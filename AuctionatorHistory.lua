
 
function  Lavradores:OnMostraTooltip()
      local tooltip = GameTooltip
      local name, link = GameTooltip:GetItem()
      local h = tooltip:GetHeight()
      local bd = "" .. GetRealmName() .. "_" .. UnitFactionGroup("player");
      bd  = _G["AUCTIONATOR_PRICE_DATABASE"][bd];

     local item = bd[name]
     if item then
         for n, p in pairs(bd[name]) do
           if string.sub(n,1,1) == "H" then
               tooltip:AddDoubleLine(n, zcpriceToMoneyString (p),1,1,1,1,1,1)
               h= h+16;
           end
         end
         tooltip:SetHeight(h);
    end
end
--hooksecurefunc(GameTooltip, "SetBagItem", OnMostraTooltip);


------- AUCTIONATOR SNIPPETS ----------
local gTimeTightZero	= time({year=2008, month=8, day=1, hour=0});

function zcround (v)
   return math.floor (v + 0.5);
end


function zcval2gsc (v)
   local rv = zcround(v)
   
   local g = math.floor (rv/10000);
   
   rv = rv - g*10000;
   
   local s = math.floor (rv/100);
   
   rv = rv - s*100;
   
   local c = rv;
   
   return g, s, c
end

local goldicon        = "|TInterface\\MoneyFrame\\UI-GoldIcon:12:12:4:0|t"
local silvericon    = "|TInterface\\MoneyFrame\\UI-SilverIcon:12:12:4:0|t"
local coppericon    = "|TInterface\\MoneyFrame\\UI-CopperIcon:12:12:4:0|t"


-----------------------------------------

function zcpriceToString (val)
   
   local gold, silver, copper  = zcval2gsc(val);
   
   local st = "";
   
   
   if (gold ~= 0) then
      st = gold.."g ";
   end
   
   
   if (st ~= "") then
      st = st..format("%02is ", silver);
   elseif (silver ~= 0) then
      st = st..silver.."s ";
   end
   
   
   if (st ~= "") then
      st = st..format("%02ic", copper);
   elseif (copper ~= 0) then
      st = st..copper.."c";
   end
   
   return st;
end
function zcpriceToMoneyString (val, noZeroCoppers)
   
   local gold, silver, copper  = zcval2gsc(val);
   
   local st = "";
   
   if (gold ~= 0) then
      st = gold..goldicon.."  ";
   end
   
   
   if (st ~= "") then
      st = st..format("%02i%s  ", silver, silvericon);
   elseif (silver ~= 0) then
      st = st..silver..silvericon.."  ";
   end
   
   if (noZeroCoppers and copper == 0) then
      return st;
   end
   
   if (st ~= "") then
      st = st..format("%02i%s", copper, coppericon);
   elseif (copper ~= 0) then
      st = st..copper..coppericon;
   end
   
   return st;
   
end


