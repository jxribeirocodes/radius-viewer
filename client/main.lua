local active = false
local radius = 0.0
local threadRunning = false

local function notify(message)
    local notifySystem = Config.Notify or 'redm-ui'

    if notifySystem == 'redm-ui' then
        if exports['l-redm-ui'] then
            exports['l-redm-ui']:Notify({ title = _('title'), message = message, type = 'info' })
            return
        end
    end

    if notifySystem == 'oxlib' then
        if lib and lib.notify then
            lib.notify({ title = _('title'), description = message, type = 'inform' })
            return
        end
    end

    TriggerEvent('chat:addMessage', {
        args = { _('title'), message }
    })
end

local function drawRadiusMarker(coords, size)
    local marker = Config.Marker or {}
    local found, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z + 2.0, true)
    local z = (found and groundZ or coords.z) + (marker.GroundOffset or 0.02)

    Citizen.InvokeNative(
        0x2A32FAA57B937173,
        marker.Type or 0x94FDAE17,
        coords.x, coords.y, z,
        0.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        size * 2.0, size * 2.0, marker.ScaleZ or 0.25,
        marker.R or 0, marker.G or 150, marker.B or 255, marker.Alpha or 160,
        marker.Bob == true,
        marker.FaceCamera == true,
        2,
        marker.Rotate ~= false,
        nil,
        nil,
        false
    )
end

local function ensureThread()
    if threadRunning then return end
    threadRunning = true

    CreateThread(function()
        while active do
            local ped = PlayerPedId()
            if ped and ped ~= 0 then
                drawRadiusMarker(GetEntityCoords(ped), radius)
            end

            Wait(0)
        end

        threadRunning = false
    end)
end

RegisterNetEvent('radius-viewer:client:notify', function(message)
    notify(message)
end)

RegisterNetEvent('radius-viewer:client:toggle', function(state, size)
    active = state == true
    radius = tonumber(size) or 0.0

    if not active or radius <= 0.0 then
        active = false
        radius = 0.0
        return
    end

    ensureThread()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    active = false
end)
