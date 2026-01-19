-- State management for the gizmo editor
local usingGizmo = false -- Whether the editor is currently active
local mode = "Translate" -- Current edit mode: "Translate" or "Rotate"
local extraZ = 1000.0 -- Virtual Z coordinate where player is moved during editing
local spawnedProp, pedBoneId = 0, 0 -- Currently edited prop and target bone
local lastCoord = nil -- Player's original position before editing
local position, rotation = vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0) -- Prop offset and rotation

-- Toggle the NUI (web UI) focus
local function toggleNuiFrame(bool)
    usingGizmo = bool
    SetNuiFocus(bool, bool) -- Enable/disable mouse cursor and input
end

-- Main function to start the gizmo editor
-- @param handle: The spawned prop entity
-- @param boneid: The bone ID to attach to
-- @param dict: Optional animation dictionary
-- @param anim: Optional animation name
function useGizmo(handle, boneid, dict, anim)
    spawnedProp = handle
    pedBoneId = boneid

    local playerPed = PlayerPedId()
    lastCoord = GetEntityCoords(playerPed) -- Save original position

    -- Move player to virtual editing space (prevents collision issues)
    FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, 0.0, 0.0, extraZ-1)
    SetEntityHeading(playerPed, 0.0)
    SetEntityRotation(pedBoneId, 0.0, 0.0, 0.0)
    
    -- Reset prop position and rotation
    position, rotation = vector3(0.0, 0.0, 0.0), vector3(0.0, 0.0, 0.0)
    AttachEntityToEntity(spawnedProp, playerPed, pedBoneId, position, rotation, true, true, false, true, 1, true)

    -- Initialize the 3D gizmo in the web UI
    SendNUIMessage({
        action = 'setGizmoEntity',
        data = {
            handle = spawnedProp,
            position = vector3(0.0, 0.0, extraZ),
            rotation = vector3(0.0, 0.0, 0.0)
        }
    })
    toggleNuiFrame(true)

    -- Play animation if provided
    if dict and anim then taskPlayAnim(playerPed, dict, anim) end

    -- Main editor loop
    while usingGizmo do
        -- Draw instruction buttons on screen
        DrawScaleformMovieFullscreen(CreateInstuctionScaleform(), 255, 255, 255, 255, 0)
        
        -- Sync camera position with web UI for 3D rendering
        SendNUIMessage({
            action = 'setCameraPosition',
            data = {
                position = GetFinalRenderedCamCoord(),
                rotation = GetFinalRenderedCamRot()
            }
        })
        
        -- Q key toggles NUI focus (for camera control)
        if IsControlJustReleased(0, 44) then
            SetNuiFocus(true, true)
        end
        DisableIdleCamera(true)
        Wait(0)
    end

    finish()
    
    -- Return the attachment code for console output
    -- Converts virtual coordinates back to bone-relative offsets
    return {
        "AttachEntityToEntity(entity, PlayerPedId(), "..pedBoneId..", "..(extraZ-position.z)..", "..position.y..", "..position.x..", "..rotation.x..", "..rotation.y..", "..rotation.z..", true, true, false, true, 1, true)",
        (extraZ-position.z)..", "..position.y..", "..position.x..", "..rotation.x..", "..rotation.y..", "..rotation.z
    }
end

-- NUI Callback: Update prop position/rotation from web UI
RegisterNUICallback('moveEntity', function(data, cb)
    local entity = data.handle
    position = data.position
    rotation = data.rotation
    -- Reattach with new coordinates (same settings as dp emote and rp emotes)
    AttachEntityToEntity(entity, PlayerPedId(), pedBoneId, extraZ-position.z, position.y, position.x, rotation.x, rotation.y, rotation.z, true, true, false, true, 1, true)
    cb('ok')
end)

-- NUI Callback: Player finished editing
RegisterNUICallback('finishEdit', function(data, cb)
    toggleNuiFrame(false)
    SendNUIMessage({
        action = 'setGizmoEntity',
        data = {
            handle = nil, -- Clear the gizmo
        }
    })
    cb('ok')
end)

-- NUI Callback: Switch between Translate and Rotate modes
RegisterNUICallback('swapMode', function(data, cb)
    mode = data.mode
    cb('ok')
end)

-- NUI Callback: Disable NUI focus for camera control
RegisterNUICallback('cam', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Create the instruction scaleform (on-screen button hints)
function CreateInstuctionScaleform()
	local scaleform = RequestScaleformMovie("instructional_buttons")
	while not HasScaleformMovieLoaded(scaleform) do Wait(10) end

	PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
	PopScaleformMovieFunctionVoid()

	PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
	PushScaleformMovieFunctionParameterInt(200)
	PopScaleformMovieFunctionVoid()

    -- Show appropriate controls based on current mode
    InstructionButtonCreate(scaleform, 200, "Done Editing", 1)
    InstructionButtonCreate(scaleform, 44, "NUI Focus", 2)

    if mode == "Translate" then
        InstructionButtonCreate(scaleform, 45, "Rotate Mode", 3)
    else
        InstructionButtonCreate(scaleform, 32, "Translate Mode", 4)
    end

	PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
	PopScaleformMovieFunctionVoid()

	PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
	PushScaleformMovieFunctionParameterInt(0)
	PushScaleformMovieFunctionParameterInt(0)
	PushScaleformMovieFunctionParameterInt(0)
	PushScaleformMovieFunctionParameterInt(80)
	PopScaleformMovieFunctionVoid()

	return scaleform
end

function InstructionButtonCreate(scaleform, key, text, number)
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
	PushScaleformMovieFunctionParameterInt(number)
	PushScaleformMovieMethodParameterButtonName(GetControlInstructionalButton(0, key, true))
	InstructionButtonMessage(text)
	PopScaleformMovieFunctionVoid()
end

function InstructionButtonMessage(text)
	BeginTextCommandScaleformString("STRING")
	AddTextComponentScaleform(text)
	EndTextCommandScaleformString()
end

-- Cleanup function: restore player state
function finish()
    if DoesEntityExist(spawnedProp) then
        DeleteEntity(spawnedProp)
    end
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(playerPed)
    if lastCoord then
        SetEntityCoords(playerPed, lastCoord) -- Teleport back to original position
        lastCoord = nil
    end
end

-- Play and loop an animation while editing
function taskPlayAnim(ped, dict, anim, flag)
    CreateThread(function()
        while usingGizmo do
            if not IsEntityPlayingAnim(ped, dict, anim, 1) then
                while not HasAnimDictLoaded(dict) do
                    RequestAnimDict(dict)
                    Wait(10)
                end
                TaskPlayAnim(ped, dict, anim, 5.0, 5.0, -1, (flag or 15), 0, false, false, false)
                RemoveAnimDict(dict)
            end
            Wait(1000) -- Check every second
        end
    end)
end

-- Clean up when resource stops
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        finish()
    end
end)
