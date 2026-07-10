local RSGCore = exports['rsg-core']:GetCoreObject()

local activePlayers = {}

local function isValidRadius(val)
    local num = tonumber(val)
    return num and num > 0 and num <= (Config.MaxRadius or 1000)
end

local function canUse(src)
    if Config.RequirePermission == false then return true end
    if IsPlayerAceAllowed(src, 'command.' .. (Config.Command or 'radius')) then return true end
    if IsPlayerAceAllowed(src, Config.AdminPermission or 'admin') then return true end
    if RSGCore and RSGCore.Functions and RSGCore.Functions.HasPermission(src, Config.AdminPermission or 'admin') then return true end
    return false
end

local function notify(src, message)
    TriggerClientEvent('radius-viewer:client:notify', src, message)
end

RegisterCommand(Config.Command or 'radius', function(source, args)
    if source == 0 then return end

    if not canUse(source) then
        notify(source, _('no_permission'))
        return
    end

    if not args[1] or args[1] == '' then
        activePlayers[source] = nil
        TriggerClientEvent('radius-viewer:client:toggle', source, false, 0)
        notify(source, _('radius_disabled'))
        return
    end

    local radius = tonumber(args[1])
    if not isValidRadius(radius) then
        TriggerClientEvent('radius-viewer:client:toggle', source, false, 0)
        notify(source, _('radius_usage', Config.Command or 'radius', Config.MaxRadius or 1000))
        return
    end

    if activePlayers[source] and activePlayers[source] == radius then
        activePlayers[source] = nil
        TriggerClientEvent('radius-viewer:client:toggle', source, false, 0)
        notify(source, _('radius_disabled'))
        return
    end

    activePlayers[source] = radius
    TriggerClientEvent('radius-viewer:client:toggle', source, true, radius)
    notify(source, _('radius_active', radius))
end, false)

AddEventHandler('playerDropped', function()
    activePlayers[source] = nil
end)
