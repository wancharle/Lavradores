Lavradores.options = { 
    name = "Lavradores",
    handler = Lavradores,
    type = "group",
    args = {
       Escondido = {
            type = "toggle",
            name = "Escondido",
            desc = "Marque se quiser deixar a lista de ingredientes escondida",
            set = "SetEscondido",
            get = "GetEscondido",
        },
       Mantimentos = {
           type = "toggle",
           name = "Nan Quest autocomplete",
           desc = "Auto completa as quests de trocas de mantimentos",
           set = "SetMantimentos",
           get = "GetMantimentos",
           },
    },
}


