local L = LibStub("AceLocale-3.0"):GetLocale("Lavradores",false);

local id_prato = 0
local prato_count = 0;
local Ingredientes = {
    ["Carnes"] = {
        ["74837"] = { 5,  L["Carnes Crua de tartaruga"], {["74649"]=5}},
        ["74833"] = { 5,  L["Bifes de Tigre de Cru"], {["74642"]=5}},
        ["74839"] = { 10,  L["Peitos de Ave Selvagem"], {["74654"]=5,["74647"]=5} }
    },
    ["Peixes"] = {
          ["74864"] = { 5, L["Polvos dos Recifes"], {["74647"]=5}},
          ["74856"] = {10, L["Piramboia de Jade"], {["74644"]=5,["74645"]=5}},
          ["74857"] = {5,  L["Camarão-grilo Gigante"], {["74651"]=5}},
          ["74865"] = {10, L["Peixe-espátula de Krasarang"], { ["74655"]=10}},
          ["74859"] = {5,  L["Salmão imperial"], {["74652"]=5, }}
    },
    ["Legumes"] = {
         ["74843"] = { 25,  L["Cebolinhas"], {["74652"]=25}},
         ["74841"] = { 35,  L["Cenoura Mordélicia"], {["74649"]=25,["74643"]=10}},
         ["74848"] = { 25,  L["Melão Listrado"], {["74645"]=25}}
   }
}

local Pratos = {
    ["74649"] = {"/5 ".. L["Tartaruga na Brasa"] .. " (" .. L["Velho Pata do Monte"] ..")","Interface\\Icons\\INV_MISC_FOOD_COOKED_BRAISEDTURTLE", 1276 }, 
    ["74651"] = {"/5 ".. L["Bolinho de Camarão"] .." (" .. L["Ella"] ..")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_SHRIMPDUMPLINGS", 1275 }, 
    ["74645"] = {"/5 ".. L["Peixe das Flores Eternas"] .. " (" .. L["Sho"] ..")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_ETERNALBLOSSOMFISH", 1278 }, 
    ["74654"] = {"/5 ".. L["Assado de Ave Selvagem"] .. " (" .. L["Fazendeiro Fung"] .. ")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_WILDFOWLROAST", 1283 }, 
    ["74652"] = {"/5 ".. L["Salmão Espírito de Fogo"] .. " (" .. L["Tina"] .. ")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_FIRESPIRITSALMON", 1280 }, 
    ["74642"] = {"/5 ".. L["Bife de Tigre na Brasa"] .. " (" .. L["HaoHan"] ..")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_TIGERSTEAK", 1279 }, 
    ["74655"] = {"/5 ".. L["Travessa de Dois Peixes"] .. " (" .. L["Peixe"] .. ")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_TWINFISHPLATTER", 1282 }, 
    ["74647"] = {"/5 ".. L["Fritada do Vale"] .. " (" .. L["Tchi Tchi"] .. ")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_VALLEYSTIRFRY", 1277 }, 
    ["74644"] = {"/5 ".. L["Sopa Névoa Rodopiante"] .. " (" .. L["Gina"] .. ")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_SWIRLINGMISTSOUP" ,1281}, 
    ["74643"] = {"/5 ".. L["Cenouras Salteadas"] .. " (" .. L["Be Bum"] .. ")", "Interface\\Icons\\INV_MISC_FOOD_COOKED_SAUTEEDCARROTS" , 1273}, 

}

local presentes = {
    ["79264"] = { 30409, 30428 },
    ["79265"] = { 30400, 30394 },
    ["79266"] = { 30381, 30424 },
    ["79267"] = { 30435, 30404 },
    ["79268"] = { 30389, 30420 },
} 

function mostra_lavradores()
     if _G.TomTom then
   _G.TomTom:AddZWaypoint(6, 10, 34.4, 46.8, L["Tchi Tchi"] .. " (" .. L["Fritada do Vale"] .. ")")
   _G.TomTom:AddZWaypoint(6, 10, 31.6, 58 , L["Ella"] .. " (" .. L["Bolinho de Camarão"].. ")")
   _G.TomTom:AddZWaypoint(6,10, 48.2, 33.8,  L["Fazendeiro Fung"] .. " (" .. L["Assado de Ave Selvagem"].. ")")
   _G.TomTom:AddZWaypoint(6,10, 41.6, 30,  L["Peixe"] .. " (" ..L["Travessa de Dois Peixes"].. ")")
   _G.TomTom:AddZWaypoint(6,10, 44.6, 34, L["HaoHan"] .. " (" .. L["Bife de Tigre na Brasa"] .. ")")
   _G.TomTom:AddZWaypoint(6,10, 31, 53, L["Velho Pata do Monte"] .. " (" .. L["Tartaruga na Brasa"].. ")")
   _G.TomTom:AddZWaypoint(6,10, 29.6, 30.6,  L["Sho"] .. " (" .. L["Peixe das Flores Eternas"].. ")")
   _G.TomTom:AddZWaypoint(6,10, 45, 33.8,  L["Tina"].. " (" .. L["Salmão Espírito de Fogo"].. ")")
     else
         Lavradores:Print(L["Para usar esse recurso vc precisa do Addom TomTom"])
     end
end 

local conta_checks = 0
function Lavradores:CheckItens()
    local link= GetQuestItemLink("required",1)

    local id=string.match(link, "Hitem:(%d+)")
    if presentes[""..id] then
        quest_id = GetQuestID()
        if presentes[id][1]== quest_id or presentes[id][2]==quest_id then
            Lavradores:Print("ok");
        else
            if conta_checks == 0 then
            CloseQuest()
            Lavradores:Print("|cFFFF0000"..L["Lavrador ERRADO!"].."|r")
            conta_checks = 1
            PlaySound("igQuestLogAbandonQuest");        
            else
                if conta_checks == 1 then
                    conta_checks = 0
                    Lavradores:Print(L["Veja na descrição do item para qual lavrador vc deve entregá-lo."])
                end
            end
        end
    end
end

local frame = CreateFrame("FRAME")
frame:RegisterEvent("BAG_UPDATE")
frame:RegisterEvent("QUEST_PROGRESS")

function frame:OnEvent(event, arg1)
    
    if  event == "BAG_UPDATE"  then
        if id_prato ~= 0 then -- confirma a entrega
            count  = GetItemCount(id_prato)
            if count ~= prato_count then
                local weekday, month, day, year = CalendarGetDate()
                PratosEntregues[""..id_prato] = day -- salva o dia da quest
                id_prato = 0
                prato_count = 0
            end
        end
        Lavradores:Atualize()
    else  
        if event =="QUEST_PROGRESS" and  GetNumQuestItems() > 0 then
                  Lavradores:CheckItens()
                  if id_prato == 0 then

                      local  name , texture, q, r = GetQuestItemInfo("required",1)
                      for id, conteudo  in pairs(Pratos)  do
                          if texture == conteudo[2] then
                            --CloseQuest()
                            --CompleteQuest()
                            id_prato = id
                            prato_count = GetItemCount(id)
                            break
                          end 
                      end 
                  end
            end
    end
end
frame:SetScript("OnEvent", frame.OnEvent)

function Lavradores:Toogle()
    if  self.db.char.fechado == true then
        self:Atualize()
        self:Expand(Todo1);
    else if self.db.char.fechado == false or self.db.char.fechado == nil then
       self:Collapse(Todo1);
        end
    end
end
function Lavradores:Collapse (todo)
    todo:SetWidth(220);
    Todo1Lista:Hide();
    local button = todo1_close;
    local texture = button:GetNormalTexture();
    texture:SetTexCoord(0, 0.5, 0, 0.5);
    texture = button:GetPushedTexture();    
    texture:SetTexCoord(0.5, 1, 0, 0.5);
    PlaySound("igMiniMapClose");
    self.db.char.fechado = true
end
 
function Lavradores:Expand (todo)
    todo:SetWidth(350);
    Todo1Lista:Show();
    local button = todo1_close;
    local texture = button:GetNormalTexture();
    texture:SetTexCoord(0, 0.5, 0.5, 1);
    texture = button:GetPushedTexture();
    texture:SetTexCoord(0.5, 1, 0.5, 1);
    PlaySound("igMiniMapOpen");
    self.db.char.fechado = false
end



function Lavradores:Atualize()
  -- For Each Bag ID
   local texto0 = ""  
   local texto = ""
   local total_objetivos = 0
   for tipo, v in pairs(Ingredientes) do
       texto = ""
       for id, conteudo in pairs(Ingredientes[tipo]) do
           local count = GetItemCount(id)
           local jatem = 0
           for p, ja in pairs(conteudo[3]) do
                local name, desc, rep = GetFactionInfoByID(Pratos[p][3])
                if rep == 8 then
                    jatem = jatem + ja
                end
           end
           local limite = 0
           limite = conteudo[1] - jatem
           if limite > 0 then
             if count < limite or  Lavradores:GetFarm() then
               texto = texto .."\n".. count .."/".. limite .. " - " .. conteudo[2] 
               total_objetivos = total_objetivos + 1
               end
           end
       end
       if texto ~= "" then
           texto0= texto0..L[tipo]..":"..texto.."\n\n"
       end
   end

   -- verifica missoes
   local  weekday, month, day, year = CalendarGetDate()
   texto = ""
   for id, conteudo in pairs(Pratos) do
       local count = GetItemCount(id)
       local name, desc, rep = GetFactionInfoByID(conteudo[3])

       if PratosEntregues[id] ~= day and rep < 8  then -- rep = 8 = exalted
           texto = "\n - " .. count .. conteudo[1] .. texto 
           total_objetivos = total_objetivos + 1
       end
   end
  
   if texto ~= "" then
       texto0 = texto0 .. L["Entregas"] ..":" .. texto .."\n\n"
   end
   Todo1Titulo:SetText("Lavradores " .. L["Objetivos"] .." ("..total_objetivos..")")
   Todo1Lista:SetText(texto0)
end
function Lavradores:GetFarm()
    if self.db.char.farm  then
        return true
    else
        return false
    end
end
function Lavradores:SetFarm(info,value)
    self.db.char.farm = value
    self:Atualize()
end
function Lavradores:SetMovable(info,value)
    self.db.char.move = value
    Todo1:SetMovable(value)
end
function Lavradores:GetMovable()
    if self.db.char.move then
        return true
    else
        return false
    end
end
function Lavradores:OnMouseDown()
      if Lavradores:GetMovable() then
                Todo1:StartMoving(); 
       end
end
function Lavradores:OnMouseUp()
       if Lavradores:GetMovable() then 
                Todo1:StopMovingOrSizing()
       end
end

function Lavradores:OnDragStop()
  if Lavradores:GetMovable() then
                Todo1:StopMovingOrSizing(); 
   end
end
function Lavradores:MantimentosOn()
    Lavradores:RegisterEvent("GOSSIP_SHOW", "SelecionaQuestMantimentos")
    Lavradores:RegisterEvent("QUEST_PROGRESS", "QUEST_PROGRESS")
    Lavradores:RegisterEvent("QUEST_COMPLETE", "QUEST_COMPLETE")

    self.db.char.mantimentos = true
end
function Lavradores:MantimentosOff()
    Lavradores:UnregisterEvent("GOSSIP_SHOW")
    Lavradores:UnregisterEvent("QUEST_PROGRESS")
    Lavradores:UnregisterEvent("QUEST_COMPLETE")

    self.db.char.mantimentos = false
end
function Lavradores:GetMantimentos()
    if self.db.char.mantimentos then
        return self.db.char.mantimentos
    else
        return false
   end
end
function Lavradores:SetMantimentos(info, value)
    if value == true then
        Lavradores:MantimentosOn()
    else
        Lavradores:MantimentosOff()
    end
end

function Lavradores:QUEST_PROGRESS()
        local quest = GetQuestID()
        if quest == 31535 and GetItemCount(87557) > 0 then -- nam pata de ferro troca de mantimentos por fica
            CompleteQuest()
        end
end

function Lavradores:QUEST_COMPLETE()
        local quest = GetQuestID()
         if quest == 31535 and GetItemCount(87557) > 0 then -- quest de troca de mantimentos por ficha
            CompleteQuest()
            QuestFrameCompleteQuestButton:Click()
        end

end
function Lavradores:SelecionaQuestMantimentos()
    if GetItemCount(87557) > 0 then
    SelectGossipAvailableQuest(1)
    end
end

function Lavradores:GetEscondido()
    if self.db.char.escondido then
        return self.db.char.escondido
    else
        return false
    end
end

function Lavradores:SetEscondido(info,value)
    
    if  value == true then
        Todo1:Hide()
        self.db.char.escondido = true
    else

        Todo1:Show()
        self.db.char.escondido = false
    end
end
