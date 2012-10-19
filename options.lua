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
                        width= "full",
                        set = "SetEscondido",
                        get = "GetEscondido",
                   },
        
             Mantimentos = {
                       type = "toggle",
                       name = L["Reabastecendo a despensa"],
                       width = "double",
                       order = 3,
                       desc = L["Auto completa a quest 'Reabastecendo a despensa'"],
                       set = "SetMantimentos",
                       get = "GetMantimentos",
                       },
              Farm = {
                        type ="toggle",
                        name = "Farm", 
                        desc = L["Mostra a lista de ingredientes mesmo quando a pessoa já pegou os itens necessários para o dia."], 
                        order = 2,
                        set = "SetFarm",
                        get = "GetFarm",

                     },
      },
}


