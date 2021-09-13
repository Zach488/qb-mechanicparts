local BackEngineVehicles = { -- Used from qb-vehicle failure <3
'ninef',
'adder',
'vagner',
't20',
'infernus',
'zentorno',
'reaper',
'comet2',
'comet3',
'jester',
'jester2',
'cheetah',
'cheetah2',
'prototipo',
'turismor',
'pfister811',
'ardent',
'nero',
'nero2',
'tempesta',
'vacca',
'bullet',
'osiris',
'entityxf',
'turismo2',
'fmj',
're7b',
'tyrus',
'italigtb',
'penetrator',
'monroe',
'ninef2',
'stingergt',
'surfer',
'surfer2',
'comet3',
}

isLoggedIn = true
PlayerJob = {}

local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "gasmonkey" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)


local function saveVehicle()
    local plyPed = PlayerPedId()
    local veh = QBCore.Functions.GetClosestVehicle()
    local vehicleMods = {
        mods = {},
    }
    vehicleMods.mods[11] = GetVehicleMod(veh,11)
    vehicleMods.mods[12] = GetVehicleMod(veh,12)
    vehicleMods.mods[13] = GetVehicleMod(veh,13)
    vehicleMods.mods[15] = GetVehicleMod(veh,15)
    
    vehicleMods.mods[18] = IsToggleModOn(veh, 18)

	local myCar = QBCore.Functions.GetVehicleProperties(veh)
    TriggerServerEvent('updateVehicle',myCar)
end

function IsBackEngine(vehModel)
    for _, model in pairs(BackEngineVehicles) do
        if GetHashKey(model) == vehModel then
            return true
        end
    end
    return false
end


--Parts Install 

--Engine

RegisterNetEvent('qb-mechanic:E0')
AddEventHandler('qb-mechanic:E0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if engine == 0 or engine == 1 or engine == 2 or engine == 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installing Engine", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine0"], "remove")
                                    QBCore.Functions.Notify("Stock Engine Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif engine > 3 then
                    QBCore.Functions.Notify("Cannot Install Engine", "Error", 5000)
                else
                    QBCore.Functions.Notify("Stock Engine Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

RegisterNetEvent('qb-mechanic:E1')
AddEventHandler('qb-mechanic:E1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if engine == -1 or engine == 1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installing Engine", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine1"], "remove")
                                    QBCore.Functions.Notify("Engine Upgrade B Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif engine > 1 then
                    QBCore.Functions.Notify("Cannot Install Engine", "Error", 5000)
                else
                    QBCore.Functions.Notify("Engine Upgrade B Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

RegisterNetEvent('qb-mechanic:E2')
AddEventHandler('qb-mechanic:E2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if engine == 0 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installing Engine", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine2"], "remove")
                                    QBCore.Functions.Notify("Engine Upgrade C Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif engine > 1 or engine < 0 then
                    QBCore.Functions.Notify("Cannot Install Engine", "Error", 5000)
                else
                    QBCore.Functions.Notify("Engine Upgrade C Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

RegisterNetEvent('qb-mechanic:E3')
AddEventHandler('qb-mechanic:E3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if engine == 1 or engine == 3 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installing Engine", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine3"], "remove")
                                    QBCore.Functions.Notify("Engine Upgrade D Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif engine > 3 or engine < 1 then
                    QBCore.Functions.Notify("Cannot Install Engine", "Error", 5000)
                else
                    QBCore.Functions.Notify("Engine Upgrade D Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)


RegisterNetEvent('qb-mechanic:E4')
AddEventHandler('qb-mechanic:E4', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    engine = GetVehicleMod(veh, 11)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if engine == 2 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Gas_Engine", "Installing Engine", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 11, 3, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "engine4", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["engine4"], "remove")
                                    QBCore.Functions.Notify("Engine Upgrade S Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif engine < 3 then
                    QBCore.Functions.Notify("Cannot Install Engine", "Error", 5000)
                else
                    QBCore.Functions.Notify("Engine Upgrade S Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

--brakes
RegisterNetEvent('qb-mechanic:B0')
AddEventHandler('qb-mechanic:B0', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if brake == 0 or brake == 1 or brake == 2 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installing Stock Brakes", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, -1, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake0", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake0"], "remove")
                                    QBCore.Functions.Notify("Stock Brakes Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif brake > 2 then
                    QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
                else
                    QBCore.Functions.Notify("Stock Brakes Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

RegisterNetEvent('qb-mechanic:B1')
AddEventHandler('qb-mechanic:B1', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if brake == -1 or brake == 1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installing Brakes", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 0, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake1", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake1"], "remove")
                                    QBCore.Functions.Notify("Brake Upgrade B Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif brake > 1 then
                    QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
                else
                    QBCore.Functions.Notify("Brakes Upgrade B Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

RegisterNetEvent('qb-mechanic:B2')
AddEventHandler('qb-mechanic:B2', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if brake == 0 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installing Brakes", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake2", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake2"], "remove")
                                    QBCore.Functions.Notify("Brakes Upgrade C Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif brake > 1 or brake < 0 then
                    QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
                else
                    QBCore.Functions.Notify("Brakes Upgrade C Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

RegisterNetEvent('qb-mechanic:B3')
AddEventHandler('qb-mechanic:B3', function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    brake = GetVehicleMod(veh, 12)
        if PlayerJob.name == "gasmonkey" then
            if onDuty then
                if brake == 1 then
                    if vehicle ~= nil and vehicle ~= 0 then
                        if (IsBackEngine(GetEntityModel(vehicle))) then
                            SetVehicleDoorOpen(vehicle, 5, false, false)
                        else
                            SetVehicleDoorOpen(vehicle, 4, false, false)
                        end
                        local ped = PlayerPedId()
                        local pos = GetEntityCoords(ped)
                        local vehpos = GetEntityCoords(vehicle)
                        if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
                            local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                            if (IsBackEngine(GetEntityModel(vehicle))) then
                                drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                            end
                            if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
                                QBCore.Functions.Progressbar("Brakes", "Installing Brakes", 10000, false, true, {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                }, {
                                    animDict = "mini@repair",
                                    anim = "fixing_a_player",
                                    flags = 16,
                                }, {}, {}, function() -- Done
                                    ClearPedTasksImmediately(PlayerPedId())
                                    SetVehicleModKit(vehicle, 0)
                                    SetVehicleMod(vehicle, 12, 2, true)
                                    local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
                                    saveVehicle()  
                                    TriggerServerEvent("QBCore:Server:RemoveItem", "brake3", 1)
                                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake3"], "remove")
                                    QBCore.Functions.Notify("Brakes Upgrade S Successfully installed", "Success", 5000)

                                end)
                            end
                        end
                    end
                elseif brake > 3 or brake < 1 then
                    QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
                else
                    QBCore.Functions.Notify("Brakes Upgrade S Already Installed", "Error", 5000)
                end
            else
                QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
            end
        else
            QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
        end
end)

-- --Transmission
-- RegisterNetEvent('qb-mechanic:B0')
-- AddEventHandler('qb-mechanic:B0', function()
--     local vehicle = QBCore.Functions.GetClosestVehicle()
--     local PlayerJob = QBCore.Functions.GetPlayerData().job
--     brake = GetVehicleMod(veh, 12)
--         if PlayerJob.name == "gasmonkey" then
--             if onDuty then
--                 if brake == 0 or brake == 1 or brake == 2 then
--                     if vehicle ~= nil and vehicle ~= 0 then
--                         if (IsBackEngine(GetEntityModel(vehicle))) then
--                             SetVehicleDoorOpen(vehicle, 5, false, false)
--                         else
--                             SetVehicleDoorOpen(vehicle, 4, false, false)
--                         end
--                         local ped = PlayerPedId()
--                         local pos = GetEntityCoords(ped)
--                         local vehpos = GetEntityCoords(vehicle)
--                         if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
--                             local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
--                             if (IsBackEngine(GetEntityModel(vehicle))) then
--                                 drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
--                             end
--                             if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
--                                 QBCore.Functions.Progressbar("Brakes", "Installing Stock Brakes", 10000, false, true, {
--                                     disableMovement = true,
--                                     disableCarMovement = true,
--                                     disableMouse = false,
--                                     disableCombat = true,
--                                 }, {
--                                     animDict = "mini@repair",
--                                     anim = "fixing_a_player",
--                                     flags = 16,
--                                 }, {}, {}, function() -- Done
--                                     ClearPedTasksImmediately(PlayerPedId())
--                                     SetVehicleModKit(vehicle, 0)
--                                     SetVehicleMod(vehicle, 12, -1, true)
--                                     local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
--                                     saveVehicle()  
--                                     TriggerServerEvent("QBCore:Server:RemoveItem", "brake0", 1)
--                                     TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake0"], "remove")
--                                     QBCore.Functions.Notify("Stock Brakes Successfully installed", "Success", 5000)

--                                 end)
--                             end
--                         end
--                     end
--                 elseif brake > 2 then
--                     QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
--                 else
--                     QBCore.Functions.Notify("Stock Brakes Already Installed", "Error", 5000)
--                 end
--             else
--                 QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
--             end
--         else
--             QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
--         end
-- end)

-- RegisterNetEvent('qb-mechanic:B1')
-- AddEventHandler('qb-mechanic:B1', function()
--     local vehicle = QBCore.Functions.GetClosestVehicle()
--     local PlayerJob = QBCore.Functions.GetPlayerData().job
--     brake = GetVehicleMod(veh, 12)
--         if PlayerJob.name == "gasmonkey" then
--             if onDuty then
--                 if brake == -1 or brake == 1 then
--                     if vehicle ~= nil and vehicle ~= 0 then
--                         if (IsBackEngine(GetEntityModel(vehicle))) then
--                             SetVehicleDoorOpen(vehicle, 5, false, false)
--                         else
--                             SetVehicleDoorOpen(vehicle, 4, false, false)
--                         end
--                         local ped = PlayerPedId()
--                         local pos = GetEntityCoords(ped)
--                         local vehpos = GetEntityCoords(vehicle)
--                         if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
--                             local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
--                             if (IsBackEngine(GetEntityModel(vehicle))) then
--                                 drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
--                             end
--                             if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
--                                 QBCore.Functions.Progressbar("Brakes", "Installing Brakes", 10000, false, true, {
--                                     disableMovement = true,
--                                     disableCarMovement = true,
--                                     disableMouse = false,
--                                     disableCombat = true,
--                                 }, {
--                                     animDict = "mini@repair",
--                                     anim = "fixing_a_player",
--                                     flags = 16,
--                                 }, {}, {}, function() -- Done
--                                     ClearPedTasksImmediately(PlayerPedId())
--                                     SetVehicleModKit(vehicle, 0)
--                                     SetVehicleMod(vehicle, 12, 0, true)
--                                     local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
--                                     saveVehicle()  
--                                     TriggerServerEvent("QBCore:Server:RemoveItem", "brake1", 1)
--                                     TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake1"], "remove")
--                                     QBCore.Functions.Notify("Brake Upgrade B Successfully installed", "Success", 5000)

--                                 end)
--                             end
--                         end
--                     end
--                 elseif brake > 1 then
--                     QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
--                 else
--                     QBCore.Functions.Notify("Brakes Upgrade B Already Installed", "Error", 5000)
--                 end
--             else
--                 QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
--             end
--         else
--             QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
--         end
-- end)

-- RegisterNetEvent('qb-mechanic:B2')
-- AddEventHandler('qb-mechanic:B2', function()
--     local vehicle = QBCore.Functions.GetClosestVehicle()
--     local PlayerJob = QBCore.Functions.GetPlayerData().job
--     brake = GetVehicleMod(veh, 12)
--         if PlayerJob.name == "gasmonkey" then
--             if onDuty then
--                 if brake == 0 then
--                     if vehicle ~= nil and vehicle ~= 0 then
--                         if (IsBackEngine(GetEntityModel(vehicle))) then
--                             SetVehicleDoorOpen(vehicle, 5, false, false)
--                         else
--                             SetVehicleDoorOpen(vehicle, 4, false, false)
--                         end
--                         local ped = PlayerPedId()
--                         local pos = GetEntityCoords(ped)
--                         local vehpos = GetEntityCoords(vehicle)
--                         if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
--                             local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
--                             if (IsBackEngine(GetEntityModel(vehicle))) then
--                                 drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
--                             end
--                             if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
--                                 QBCore.Functions.Progressbar("Brakes", "Installing Brakes", 10000, false, true, {
--                                     disableMovement = true,
--                                     disableCarMovement = true,
--                                     disableMouse = false,
--                                     disableCombat = true,
--                                 }, {
--                                     animDict = "mini@repair",
--                                     anim = "fixing_a_player",
--                                     flags = 16,
--                                 }, {}, {}, function() -- Done
--                                     ClearPedTasksImmediately(PlayerPedId())
--                                     SetVehicleModKit(vehicle, 0)
--                                     SetVehicleMod(vehicle, 12, 2, true)
--                                     local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
--                                     saveVehicle()  
--                                     TriggerServerEvent("QBCore:Server:RemoveItem", "brake2", 1)
--                                     TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake2"], "remove")
--                                     QBCore.Functions.Notify("Brakes Upgrade C Successfully installed", "Success", 5000)

--                                 end)
--                             end
--                         end
--                     end
--                 elseif brake > 1 or brake < 0 then
--                     QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
--                 else
--                     QBCore.Functions.Notify("Brakes Upgrade C Already Installed", "Error", 5000)
--                 end
--             else
--                 QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
--             end
--         else
--             QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
--         end
-- end)

-- RegisterNetEvent('qb-mechanic:B3')
-- AddEventHandler('qb-mechanic:B3', function()
--     local vehicle = QBCore.Functions.GetClosestVehicle()
--     local PlayerJob = QBCore.Functions.GetPlayerData().job
--     brake = GetVehicleMod(veh, 12)
--         if PlayerJob.name == "gasmonkey" then
--             if onDuty then
--                 if brake == 1 then
--                     if vehicle ~= nil and vehicle ~= 0 then
--                         if (IsBackEngine(GetEntityModel(vehicle))) then
--                             SetVehicleDoorOpen(vehicle, 5, false, false)
--                         else
--                             SetVehicleDoorOpen(vehicle, 4, false, false)
--                         end
--                         local ped = PlayerPedId()
--                         local pos = GetEntityCoords(ped)
--                         local vehpos = GetEntityCoords(vehicle)
--                         if #(pos - vehpos) < 4.0 and not IsPedInAnyVehicle(ped) then
--                             local drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
--                             if (IsBackEngine(GetEntityModel(vehicle))) then
--                                 drawpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
--                             end
--                             if #(pos - drawpos) < 2.0 and not IsPedInAnyVehicle(ped) then
                            
--                                 QBCore.Functions.Progressbar("Brakes", "Installing Brakes", 10000, false, true, {
--                                     disableMovement = true,
--                                     disableCarMovement = true,
--                                     disableMouse = false,
--                                     disableCombat = true,
--                                 }, {
--                                     animDict = "mini@repair",
--                                     anim = "fixing_a_player",
--                                     flags = 16,
--                                 }, {}, {}, function() -- Done
--                                     ClearPedTasksImmediately(PlayerPedId())
--                                     SetVehicleModKit(vehicle, 0)
--                                     SetVehicleMod(vehicle, 12, 2, true)
--                                     local vehicle = QBCore.Functions.GetVehicleProperties(vehicle)
--                                     saveVehicle()  
--                                     TriggerServerEvent("QBCore:Server:RemoveItem", "brake3", 1)
--                                     TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["brake3"], "remove")
--                                     QBCore.Functions.Notify("Brakes Upgrade S Successfully installed", "Success", 5000)

--                                 end)
--                             end
--                         end
--                     end
--                 elseif brake > 3 or brake < 1 then
--                     QBCore.Functions.Notify("Cannot Install Brakes", "Error", 5000)
--                 else
--                     QBCore.Functions.Notify("Brakes Upgrade S Already Installed", "Error", 5000)
--                 end
--             else
--                 QBCore.Functions.Notify("You need to sign on duty!!", "Error", 5000)
--             end
--         else
--             QBCore.Functions.Notify("Do you work for gasmonkey?", "error", 4000)
--         end
-- end)


--Vehicle Menu
RegisterNetEvent('qb-mechanic:VehicleMenu')
AddEventHandler('qb-mechanic:VehicleMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "| Vehicle Menu |",
            txt = "",
        },
        {
            id = 2,
            header = "Check Status Of Vehicle",
            txt = "Make sure vehicle is in working condition",
            params = {
                event = "qb-mechanic:CheckVehStatus"
            }
        },
        {
            id = 3,
            header = "Check Upgrades Of Vehicle",
            txt = "Fast as Fuckk Boii",
            params = {
                event = "qb-mechanic:CheckMods"
            }
        },
    })
end)

--Check Car Health
RegisterNetEvent('qb-mechanic:CheckVehStatus')
AddEventHandler('qb-mechanic:CheckVehStatus', function()
    veh = QBCore.Functions.GetClosestVehicle()
    plate = GetVehicleNumberPlateText(veh)
    engineHealth = GetVehicleEngineHealth(veh)
    vehTemp = GetVehicleEngineTemperature(veh)
    bodyHealth = GetVehicleBodyHealth(veh)
    fuelHealth = exports['LegacyFuel']:GetFuel(veh)
    tankHealth = GetVehiclePetrolTankHealth(veh)
 
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "<  Go back",
            txt = "",
            params = {
                event = "qb-mechanic:VehicleMenu"
            }
        },
        {
            id = 2,
            header = "Fuel Level",
            txt = "Status: " .. math.ceil(fuelHealth) .. ".0% / 100.0%",
        },
        {
            id = 3,
            header = "Engine Health",
            txt = "Status: " .. math.ceil(engineHealth / 10) .. "% / 100.0%",
        },
        {
            id = 4,
            header = "Body Health",
            txt = "Status: " .. math.ceil(bodyHealth / 10) .. "% / 100.0%",
        },
        {
            id = 5,
            header = "Tank Health",
            txt = "Status: " .. math.ceil(tankHealth / 10) .. "% / 100.0%",
        },
        {
            id = 6,
            header = "Engine Temperature",
            txt = "Status: " .. math.ceil(vehTemp) .. "° C",
        },        
    })
    
end)

--Check Mods installed on Car
RegisterNetEvent('qb-mechanic:CheckMods')
AddEventHandler('qb-mechanic:CheckMods', function()

    veh = QBCore.Functions.GetClosestVehicle()
    engine = GetVehicleMod(veh, 11)
    brakes = GetVehicleMod(veh, 12)
    transmission = GetVehicleMod(veh, 13)
    suspension = GetVehicleMod(veh, 15)
    turbo = IsToggleModOn(veh, 18)
    
    if engine == -1 then
        engine = "Standard"
    elseif
    engine == 0 then
        engine = "Upgrade Level B"
    elseif
    engine == 1 then
        engine = "Upgrade Level C"
    elseif
    engine == 2 then
        engine = "Upgrade Level D"
    elseif
    engine == 3 then
        engine = "Upgrade Level S"
    end
    if brakes == -1 then
        brakes = "Standard"
    elseif
    brakes == 0 then
        brakes = "Upgrade Level B"
    elseif
    brakes == 1 then
        brakes = "Upgrade Level C"
    elseif
    brakes == 2 then
        brakes = "Upgrade Level S"
    end
    if transmission == -1 then
        transmission = "Standard"
    elseif
    transmission == 0 then
        transmission = "Upgrade Level B"
    elseif
    transmission == 1 then
        transmission = "Upgrade Level C"
    elseif
    transmission == 2 then
        transmission = "Upgrade Level S"
    end
    if suspension == -1 then
        suspension = "Standard"
    elseif
    suspension == 0 then
        suspension = "Upgrade Level B"
    elseif
    suspension == 1 then
        suspension = "Upgrade Level C"
    elseif
    suspension == 2 then
        suspension = "Upgrade Level S"
    end
    if turbo == "0" then
        turbo = "Standard"
    elseif
    turbo == 1 then
        turbo = "You have a Turbo"
    end
    
    
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "<  Go back",
            txt = "",
            params = {
                event = "qb-mechanic:VehicleMenu"
            }
        },
        {
            id = 2,
            header = "Engine Upgrades",
            txt =  engine,
        },
        {
            id = 3,
            header = "Brakes Upgrade",
            txt = brakes,
        },
        {
            id = 4,
            header = "Transmission Upgrade",
            txt = transmission,
        },
        {
            id = 5,
            header = "Suspension Upgrade",
            txt = suspension,
        },
        {
            id = 6,
            header = "Turbo Upgrade",
            txt = turbo,
        },
              
    })
    
end)






