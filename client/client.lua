RedEM = exports["redem_roleplay"]:RedEM()

function playCrouchAnimation()
    local animDict = "mini_games@story@mud1@fix_wheel"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(10)
    end
    local playerPed = PlayerPedId()
    TaskPlayAnim(playerPed, animDict, "wheelfix_exit", 0.1, 4.0, -1, 1, 0, false, false, false)
end

RegisterNetEvent('redemrp_repair')
AddEventHandler('redemrp_repair', function()
    local playerPed = PlayerPedId()
    local closestVehicle = GetClosestVehicle(GetEntityCoords(playerPed), 3.0, 0, 70)
    if closestVehicle and DoesEntityExist(closestVehicle) then
        if isWagonModel(GetEntityModel(closestVehicle)) then
            local vehicleHealth = GetEntityHealth(closestVehicle)
            local vehicleBodyHealth = GetVehicleBodyHealth(closestVehicle)
            if vehicleHealth <= 1.0 or vehicleBodyHealth <= 1.0 then
                playCrouchAnimation()
                Wait(4000)
                SetVehicleFixed(closestVehicle)
                ClearPedTasks(playerPed)
                TriggerEvent('redem_roleplay:Tip', 'Wagon repaired', 4000)
            else
                TriggerEvent('redem_roleplay:Tip', 'Wagon is not damaged', 4000)
            end
        else
            TriggerEvent('redem_roleplay:Tip', 'Wagon is not damaged', 4000)
        end
    else
        TriggerEvent('redem_roleplay:Tip', 'No wagon nearby', 4000)
    end
end)

function isWagonModel(modelName)
    local wagonModels = {
        "CART01", "CART02", "CART03", "CART04", "CART05", "CART06", "CART07", "CART08",
        "ARMYSUPPLYWAGON", "BUGGY01", "BUGGY02", "BUGGY03", "CHUCKWAGON000X", "CHUCKWAGON002X",
        "COACH2", "COACH3", "COACH4", "COACH5", "COACH6", "coal_wagon", "OILWAGON01X",
        "POLICEWAGON01X", "WAGON02X", "WAGON04X", "LOGWAGON", "WAGON03X", "WAGON05X", "WAGON06X",
        "WAGONPRISON01X", "STAGECOACH001X", "STAGECOACH002X", "STAGECOACH003X", "STAGECOACH004X",
        "STAGECOACH005X", "STAGECOACH006X", "UTILLIWAG", "GATCHUCK", "GATCHUCK_2", "wagonCircus01x",
        "WAGONDAIRY01X", "WAGONWORK01X", "WAGONTRAVELLER01X", "SUPPLYWAGON", "CABOOSE01X",
        "northpassenger01x", "NORTHSTEAMER01X", "HANDCART", "HUNTERCART01", "CANOE", "CANOETREETRUNK",
        "PIROGUE", "RCBOAT", "rowboat", "ROWBOATSWAMP", "SKIFF", "SHIP_GUAMA02", "SHIP_NBDGUAMA",
        "horseBoat", "BREACH_CANNON", "GATLING_GUN", "GATLINGMAXIM02", "SMUGGLER02", "turbineboat",
        "HOTAIRBALLOON01", "hotchkiss_cannon", "wagonCircus02x", "wagonDoc01x", "PIROGUE2",
        "PRIVATECOALCAR01X", "PRIVATESTEAMER01X", "PRIVATEDINING01X", "ROWBOATSWAMP02",
        "midlandboxcar05x", "coach3_cutscene", "privateflatcar01x", "privateboxcar04x",
        "privatebaggage01X", "privatepassenger01x", "trolley01x", "northflatcar01x", "supplywagon",
        "northcoalcar01x", "northpassenger03x", "privateboxcar02x", "armoredcar03x",
        "privateopensleeper02x", "WINTERSTEAMER", "wintercoalcar", "privateboxcar01x",
        "privateobservationcar", "gatchuck_2", "privatearmoured"
    }

    for _, wagonModel in ipairs(wagonModels) do
        if GetHashKey(wagonModel) == modelName then
            return true
        end
    end

    return false
end


