local L = LibStub("AceLocale-3.0"):GetLocale("Lavradores",false);

Lavradores.options = { 
    name = "Lavradores",
    handler = Lavradores,
    type = "group",
    args = {
              Escondido = {
                        type = "toggle",
                        name = L["Escondido"],
                        desc = L["Marque se quiser deixar a lista de ingredientes escondida"],
                        order = 1,
                        set = "SetEscondido",
                        get = "GetEscondido",
                   },
                   Movel = {
                       type = "toggle",
                       name = L["Mover lista"],
                       desc = L["Permite mudar a posição da lista."],
                       order = 2,
                       width = "double",
                       set = "SetMovable",
                       get = "GetMovable",
                       
                       },
        
             Mantimentos = {
                       type = "toggle",
                       name = L["Reabastecendo a despensa"],
                       width = "double",
                       order = 4,
                       desc = L["Auto completa a quest 'Reabastecendo a despensa'"],
                       set = "SetMantimentos",
                       get = "GetMantimentos",
                       },
              Farm = {
                        type ="toggle",
                        name = "Farm", 
                        desc = L["Mostra a lista de ingredientes mesmo quando a pessoa já pegou os itens necessários para o dia."], 
                        order = 3,
                        set = "SetFarm",
                        get = "GetFarm",

                     },
             Alert = {
                 type = "description",
                 name = "\n\nNote: All texts were translated via google translate. \nAny mistake in the text or in the addon let me know.\nLeave a comment (or private message) with the error in http://www.curse.com/addons/wow/lavradores.",
                 order = 5,
                 },
      },
}


