
Lavradores = LibStub("AceAddon-3.0"):NewAddon("Lavradores", "AceConsole-3.0", "AceHook-3.0","AceEvent-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("Lavradores",false);

function Lavradores:OnInitialize()
  LibStub("AceConfig-3.0"):RegisterOptionsTable("Lavradores", self.options)
  self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Lavradores", "Lavradores") 
   
  end
function Lavradores:OnListShow()
    if Lavradores.db.char.escondido == true then
        Todo1:Hide()
    end

    if Lavradores.db.char.fechado == true then
        self:Collapse(Todo1)
    end
end

function Lavradores:OnEnable()
    Lavradores:Enable()
    self.db = LibStub("AceDB-3.0"):New("LavradoresDB")
 
   Lavradores.inicializado = true
   if PratosEntregues then
        Lavradores:Atualize()
   else
        PratosEntregues = {
             ["74649"]  = 10,
            }
   end

   if self.db.char.move == false then
       self:SetMovable("",false)
   end

   if self.db.char.historico then
       self:Hook()
   end
   
   if self.db.char.mantimentos then
       self:MantimentosOn()
   end

    Lavradores:OnListShow()								
    --Lavradores:SecureHookScript(TradeSkillDetailScrollFrame, "OnEnter", "OnMostraTooltip");
	--self:SecureHookScript(FriendsMicroButton, "OnEnter", "OnMouseOverFriends");
	--self:SecureHookScript(CharacterMicroButton, "OnEnter", "OnMouseOverCharacter");

end

function Lavradores:GetMessage()

 if self.db.char.msg then
     return self.db.char.msg
     else
     return "ola"
end
end
function Lavradores:OnDisable()
Lavradores:Disable()
end


Lavradores:RegisterChatCommand("tillers", "tillslash")
Lavradores:RegisterChatCommand("til", "tillslash")

function Lavradores:tillslash(msg) 

    local command, rest = msg:match("^(%S*)%s*(.-)$");
    if command == "hide" or command == "esconda" then
        Todo1:Hide()
        self.db.char.escondido = true
    else
        if command == "" or command =="options" then
            InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
        end

        if command == "show" or command == "mostrar" then
            Todo1:Show()
            self.db.char.escondido = false

        else if command == "houses" or command == "casas" then
                mostra_lavradores()	
             
              end
        end
    end
    if command == "history" then
        self.db.char.historico = true
        Lavradores:Hook()
    else
        if command == "historyoff" then
        self.db.char.historico = false
        Lavradores:UnhookAll()
        end

    end
    if command == "mantimentos" then
        Lavradores:MantimentosOn()
    else if command == "mantimentosoff" then
        Lavradores:MantimentosOff()
        end
    end
end

function Lavradores:Hook()

    hookexists, hookhandler = Lavradores:IsHooked("OnMostraTooltip")
    if not hookexists then
        Lavradores:SecureHookScript(GameTooltip, "OnTooltipSetItem", "OnMostraTooltip");
    end
end
