Lavradores.options = { 
    name = "Lavradores",
    handler = Lavradores,
    type = "group",
    args = {
       Escondido = {
            type = "toggle",
            name = "Escondido",
            desc = "Marque se quiser deixar a lista de ingredientes escondida",
            order = 1,
            set = "SetEscondido",
            get = "GetEscondido",
        },
       Mantimentos = {
           type = "toggle",
           name = "Nan Quest",
           order = 2,
           desc = "Auto completa as quests de trocas de mantimentos",
           set = "SetMantimentos",
           get = "GetMantimentos",
           },
       Farm = {
            type ="toggle",
            name = "Farm", 
            desc = "Mostra a lista de ingredientes mesmo quando a pessoa ja pegou os itens necessários para o dia." , 
            order = 3,
            set = "SetFarm",
            get = "GetFarm",

          },
    },
}


