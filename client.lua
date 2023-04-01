local cats = Config.Cats
local dogs = Config.Dogs
local animals = Config.Animals
local framework = Config.Framework

if framework "qb-core" then
exports['qb-target']:AddTargetModel(cats, {
  options = {
    {
      type = "client",
      event = "bostra-pet:petCat",
      label = cats.label,
      icon = cats.icon,
    }
  },
  distance = Config.TargetDistance,
})

exports['qb-target']:AddTargetModel(dogs, {
  options = {
    {
      type = "client",
      event = "bostra-pet:petDog",
      label = dogs.label,
      icon = dogs.icon,
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
        label = animals.label,
        icon = animals.icon,
      }
    },
    distance = Config.TargetDistance,
  })
end
elseif framework "ox_core" then
  local catOptions = {
    {
        name = 'pet:cat',
        event = 'bostra-pet:petCat',
        icon = cats.icon,
        label = cats.label,
    },
}
exports.ox_target:addModel(cats, catOptions)

local dogOptions = {
  {
      name = 'pet:dog',
      event = 'bostra-pet:petDog',
      icon = dogs.icon,
      label = dogs.label,
},
}
exports.ox_target:addModel(dogs, dogOptions)

if Config.EnableAnimals then
  local animalOptions = {
    {
        name = 'pet:animal',
        event = 'bostra-pet:petAnimal',
        icon = animals.icon,
        label = animals.label,
    },
  }
  exports.ox_target:addModel(animals, animalOptions)
end
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
  if lib.progressBar({
    duration = Config.Time,
    label = 'Petting The Dog',
    useWhileDead = false,
    canCancel = true,
    disable = {
      car = true,
      move = true,
      combat = true,
      inventory = true,
    },
    anim = {
      duration = Config.Time,
      dict = 'creatures@rottweiler@tricks@',
      clip = 'petting_franklin'
    },
  }) then
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:RelieveStress', Config.Relief)
  else
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:GainStress', Config.Gain)
  end
end)


--cat
RegisterNetEvent('bostra-pet:petCat')
AddEventHandler('bostra-pet:petCat', function()
  TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "cat", 0.3)
  
  if lib.progressBar({
    duration = Config.Time,
    label = 'Petting The Cat',
    useWhileDead = false,
    canCancel = true,
    disable = {
      car = true,
      move = true,
      combat = true,
      inventory = true,
    },
    anim = {
      duration = Config.Time,
      dict = 'creatures@rottweiler@tricks@',
      clip = 'petting_franklin'
    },
  }) then
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:RelieveStress', Config.Relief)
  else
    StopAnimTask(PlayerPedId(), "creatures@rottweiler@tricks@", "petting_franklin", 1.0)
    TriggerServerEvent('hud:server:GainStress', Config.Gain)
  end
end)


----DEBUG FOR TESTING

function GetRandomAnimalSpawnCoords()
  local playerPed = GetPlayerPed(-1)
  local playerCoords = GetEntityCoords(playerPed)
  local spawnRadius = 10.0
  local spawnCoords = vector3(
    playerCoords.x + math.random(-spawnRadius, spawnRadius),
    playerCoords.y + math.random(-spawnRadius, spawnRadius),
    playerCoords.z
  )
  local heading = math.random(0, 360)
  return spawnCoords, heading
end
if Config.Debug then
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if IsControlJustReleased(0, 38) then
        for i = 1, 10 do
          local coords = GetRandomAnimalSpawnCoords()
          local catOrDog = math.random(1, 2)
          if catOrDog == 1 then
            local catModel = GetHashKey("a_c_cat_01")
            RequestModel(catModel)
            while not HasModelLoaded(catModel) do
              Citizen.Wait(0)
            end
            CreatePed(28, catModel, coords.x, coords.y, coords.z, coords.heading, true, false)
          else
            local dogModel = GetHashKey("a_c_husky")
            RequestModel(dogModel)
            while not HasModelLoaded(dogModel) do
              Citizen.Wait(0)
            end
            CreatePed(28, dogModel, coords.x, coords.y, coords.z, coords.heading, true, false)
          end
        end
      end
    end
  end)
end