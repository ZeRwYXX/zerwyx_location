
Locales = {}

function _U(str, ...)
    local lang = Config.Locales or 'fr'
    if Config.Translations[lang] and Config.Translations[lang][str] then
        return string.format(Config.Translations[lang][str], ...)
    else
        return "Texte introuvable"
    end
end


ESX = exports["es_extended"]:getSharedObject()

local peds = {}

Citizen.CreateThread(function()
    for i, pedInfo in pairs(Config.PedLocations) do
        local model = GetHashKey(Config.Ped)
        RequestModel(model)
        
        while not HasModelLoaded(model) do
            Citizen.Wait(10)
        end

        local ped = CreatePed(4, model, pedInfo.coords.x, pedInfo.coords.y, pedInfo.coords.z - 1.0, pedInfo.coords.w, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        exports.ox_target:addModel(model, {
            {
                name = "rent_vehicle",
                icon = "fa-solid fa-car",
                label = _U('rent_vehicle'), 
                onSelect = function()
                    TriggerEvent("zerwyx_location:openMenu", i)
                end
            }
        })

        table.insert(peds, ped)

        -- Ajouter le blip à la position du ped
        local blip = AddBlipForCoord(pedInfo.coords.x, pedInfo.coords.y, pedInfo.coords.z)
        SetBlipSprite(blip, Config.BlipSettings.sprite)
        SetBlipDisplay(blip, Config.BlipSettings.display)
        SetBlipScale(blip, Config.BlipSettings.scale)
        SetBlipColour(blip, Config.BlipSettings.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.BlipSettings.text)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent("zerwyx_location:openMenu")
AddEventHandler("zerwyx_location:openMenu", function(pedIndex)
    local locale = Config.Locales or "fr"
    local pedInfo = Config.PedLocations[pedIndex]

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openMenu",
        translations = Config.Translations[locale], 
        vehicles = Config.VehicleList,            
        spawnLocation = pedInfo.spawnVehicle        
    })
end)

RegisterNUICallback("closeMenu", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "closeMenu" }) 
    cb("ok")
end)

RegisterNUICallback("rentVehicle", function(data)
    local vehicleInfo = Config.VehicleList[data.index + 1]
    if vehicleInfo then
        TriggerServerEvent("zerwyx_location:attemptRent", vehicleInfo.model, vehicleInfo.price, data.spawnLocation)
    else
        print(_U('error_missing_info')) 
    end
end)

RegisterNetEvent("zerwyx_location:spawnVehicle")
AddEventHandler("zerwyx_location:spawnVehicle", function(model, spawnLocation)
    local playerPed = PlayerPedId()
    local spawnPos = vector3(spawnLocation.x, spawnLocation.y, spawnLocation.z)
    local heading = spawnLocation.w
    local modelHash = GetHashKey(model)

    RequestModel(modelHash)
    local attempt = 0
    
    while not HasModelLoaded(modelHash) and attempt < 50 do
        Citizen.Wait(100)
        attempt = attempt + 1
    end

    if HasModelLoaded(modelHash) then
        local vehicle = CreateVehicle(modelHash, spawnPos.x, spawnPos.y, spawnPos.z, heading, true, false)
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        
        SetNuiFocus(false, false)
        SendNUIMessage({ action = "closeMenu" })

        local plate = GetVehicleNumberPlateText(vehicle)
        
       -- exports['ak47_vehiclekeys']:GiveVirtualKey(plate)
    else
        print(_U('vehicle_spawn_error')) 
        SetNuiFocus(false, false)
        SendNUIMessage({ action = "closeMenu" }) 
    end
end)

RegisterNetEvent("zerwyx_location:showNotification")
AddEventHandler("zerwyx_location:showNotification", function(type, message)
    SendNUIMessage({
        action = "showNotification",
        type = type,
        message = message
    })
end)
