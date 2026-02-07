-- Command: /prop [modelName] [boneId] [animDict] [animName]
-- Example: /prop prop_sandwich_01 18905 mp_player_inteat@burger mp_player_int_eat_burger
RegisterCommand('prop',function(source, args, rawCommand)
    -- Get prop model (default: burger)
    local model = joaat(args[1] or "prop_cs_burger_01")
    
    -- Load the model
    if not HasModelLoaded(model) then RequestModel(model) while not HasModelLoaded(model) do Wait(1) end end
    
    -- Spawn the prop at player location
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local object = CreateObject(model, playerCoords.x, playerCoords.y, playerCoords.z, false, false, false)
    
    -- Parse bone argument (can be numeric ID or bone name)
    local boneArg = args[2]
    local boneToNumber = tonumber(boneArg)
    local bone = (boneArg and boneToNumber) and GetPedBoneIndex(playerPed, boneToNumber) or boneArg and GetEntityBoneIndexByName(playerPed, boneArg) or 18905
    
    -- Start the gizmo editor and get the attachment code
    local objectPositionData = useGizmo(object, bone, args[3], args[4])
    
    -- Print the attachment code to F8 console
    print(objectPositionData[1]) -- Full AttachEntityToEntity command
    print(objectPositionData[2]) -- Just coordinates
end)
