local QBCore = exports['qb-core']:GetCoreObject()
local cats = Config.Cats
local dogs = Config.Dogs
local animals = Config.Animals

exports['qb-target']:AddTargetModel(cats, {
  options = {
    {
      type = "client",
      event = "bostra-pet:petCat",
      label = Config.Cats.label,
      icon = Config.Cats.icon,
    }
  },
  distance = Config.TargetDistance,
})

exports['qb-target']:AddTargetModel(dogs, {
  options = {
    {
      type = "client",
      event = "bostra-pet:petDog",
      label = Config.Dogs.label,
      icon = Config.Dogs.icon,
    }
  },
  distance = Config.TargetDistance,
})

if Config.EnableAnimals then
exports['qb-target']:AddTargetModel(animals, {
  options = {
    {
      type = "client",
      event = "bostra-pet:petAnimal",
      label = Config.Animals.label,
      icon = Config.Animals.icon,
    }
  },
  distance = Config.TargetDistance,
})
end
--generic animals
RegisterNetEvent('bostra-pet:petAnimal')
AddEventHandler('bostra-pet:petAnimal', function()
  TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "animal", 0.3)
  QBCore.Functions.Progressbar('animal', 'Petting...', Config.Time, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true
  }, {
    animDict = "creatures@rottweiler@tricks@",
    anim = "petting_franklin",
    flags = 49,
  }, {}, {}, function()
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:RelieveStress', Config.Relief)
  end, function()
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:GainStress', Config.Gain)
  end)
end)

--dog
RegisterNetEvent('bostra-pet:petDog')
AddEventHandler('bostra-pet:petDog', function()
  TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "dog", 0.3)
  QBCore.Functions.Progressbar('dog', 'Petting...', Config.Time, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true
  }, {
    animDict = "creatures@rottweiler@tricks@",
    anim = "petting_franklin",
    flags = 49,
  }, {}, {}, function()
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:RelieveStress', Config.Relief)
  end, function()
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:GainStress', Config.Gain)
  end)
end)

--cat
RegisterNetEvent('bostra-pet:petCat')
AddEventHandler('bostra-pet:petCat', function()
  TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "cat", 0.3)
  QBCore.Functions.Progressbar('cat', 'Petting...', Config.Time, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true
  }, {
    animDict = "creatures@rottweiler@tricks@",
    anim = "petting_franklin",
    flags = 49,
  }, {}, {}, function()
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:RelieveStress', Config.Relief)
  end, function()
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:GainStress', Config.Gain)
  end)
end)