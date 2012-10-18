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
    },
}


