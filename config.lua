Config = {}
Config.Core = "qb-core" -- framework to use, qb-core or ox_core. qb-target and ox-target respectively.
Config.TargetDistance = 2.0 --distance to interact with pet
Config.Relief = 15 -- stress relief when petting amount
Config.Gain = 10 -- stress gain when petting cancelled amount
Config.Time = 5000 -- time to pet animal, 5000 = 5 seconds
Config.PetAnim = "WORLD_HUMAN_PET_DOG" -- scenario to play when petting animal
Config.Cats = {
    `a_c_cat_01`,  -- Domestic Short Hair
    `a_c_mtlion`,
    } -- Mountain Lion because why not?
Config.CatLabel = "Pet The Cat" -- label for the target menu
Config.CatIcon  = "fa-solid fa-cat"-- icon for the target menu

Config.Dogs = { 
    `a_c_chop`, -- Chop
    `a_c_rottweiler`, -- Rottweiler
    `a_c_poodle`, -- Poodle 
    `a_c_husky`, -- Husky
    `a_c_retriever`, -- Retriever
    `a_c_shepherd`, -- Shepherd
    `a_c_westy`, -- Westy
    `a_c_pug`, }-- Pug
Config.DogLabel = "Pet The Dog" -- label for the target menu
Config.DogIcon = "fa-solid fa-dog"-- icon for the target menu


Config.EnableAnimals = false -- enable animals to pet besides cats and dogs...?
Config.Animals = {
    `a_c_boar`, -- Boar
    `a_c_coyote`, -- Coyote
    `a_c_crow`, -- Crow
    `a_c_deer`, -- Deer
    `a_c_hen`, -- Hen
    `a_c_humpback`, -- Humpback
    `a_c_mtlion`, -- Mountain Lion
    `a_c_pig`, -- Pig
    `a_c_pigeon`, -- Pigeon
    `a_c_rabbit_01`, -- Rabbit
    `a_c_rat`, -- Rat
    `a_c_rhesus`, -- Rhesus
    `a_c_seagull`, -- Seagull
    `a_c_sharkhammer`, -- Hammerhead Shark
    `a_c_sharktiger`, -- Tiger Shark
    }
Config.AniLabel = "Pet The Animal" -- label for the target menu
Config.AniIcon ="fa-solid fa-hippo" -- icon for the target menu


Config.Debug = false -- debug mode, enable spawning of animals for testing