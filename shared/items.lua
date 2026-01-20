-- Example items.lua for ESX/QBCore integration
-- This file shows how to integrate the prop configurations with your inventory system
-- Copy the prop definitions from config.lua and adapt them to your framework

-- Example for QBCore (qb-core/shared/items.lua)
--[[
QBShared = QBShared or {}
QBShared.Items = {
    -- Shoulder Props
    ['prop_ball'] = {
        name = 'prop_ball',
        label = 'Shoulder Ball',
        weight = 500,
        type = 'item',
        image = 'prop_ball.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A decorative ball that attaches to your shoulder'
    },
    ['prop_balbazar'] = {
        name = 'prop_balbazar',
        label = 'Balbazar Figure',
        weight = 300,
        type = 'item',
        image = 'prop_balbazar.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A Balbazar character figure for your shoulder'
    },
    -- Add more items following the pattern above
    
    -- Back Props
    ['prop_bag'] = {
        name = 'prop_bag',
        label = 'Heist Bag',
        weight = 2000,
        type = 'item',
        image = 'prop_bag.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A bag that attaches to your back'
    },
    
    -- Head Props
    ['prop_crown'] = {
        name = 'prop_crown',
        label = 'Crown',
        weight = 100,
        type = 'item',
        image = 'prop_crown.png',
        unique = true,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'A decorative crown for your head'
    },
}
]]

-- Example for ESX (es_extended/config.lua or items database)
--[[
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
    ('prop_ball', 'Shoulder Ball', 1, 0, 1),
    ('prop_balbazar', 'Balbazar Figure', 1, 0, 1),
    ('prop_fred', 'Fred Figure', 1, 0, 1),
    ('prop_batman', 'Batman Figure', 1, 0, 1),
    ('prop_charmander', 'Charmander Figure', 1, 0, 1),
    ('prop_spongebob', 'SpongeBob Figure', 1, 0, 1),
    ('prop_patrickstar', 'Patrick Star Figure', 1, 0, 1),
    ('prop_nezuko', 'Nezuko Figure', 1, 0, 1),
    ('prop_goku', 'Goku Figure', 1, 0, 1),
    ('prop_squirtle', 'Squirtle Figure', 1, 0, 1),
    ('prop_bag', 'Heist Bag', 2, 0, 1),
    ('prop_picker', 'Litter Picker', 1, 0, 1),
    ('prop_float', 'Beach Float', 1, 0, 1),
    ('prop_crown', 'Crown', 1, 0, 1);
]]

-- Integration Example: Using props from config.lua
--[[
-- In your client-side script:
local function AttachConfigProp(propKey)
    local propData = Config.AllProps[propKey]
    if not propData then
        print('Prop not found: ' .. propKey)
        return
    end
    
    local playerPed = PlayerPedId()
    local model = joaat(propData.model)
    
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    
    local coords = GetEntityCoords(playerPed)
    local prop = CreateObject(model, coords.x, coords.y, coords.z, true, true, false)
    
    AttachEntityToEntity(
        prop,
        playerPed,
        GetPedBoneIndex(playerPed, propData.bone),
        propData.offset.x,
        propData.offset.y,
        propData.offset.z,
        propData.rotation.x,
        propData.rotation.y,
        propData.rotation.z,
        true,
        true,
        false,
        true,
        1,
        true
    )
    
    -- Store prop handle for later removal
    return prop
end

-- Example usage with item:
RegisterNetEvent('inventory:client:UseItem')
AddEventHandler('inventory:client:UseItem', function(itemName)
    -- Map item names to config keys
    local itemToProp = {
        ['prop_ball'] = 'ball',
        ['prop_balbazar'] = 'balbazar',
        ['prop_bag'] = 'bag',
        -- Add more mappings
    }
    
    local propKey = itemToProp[itemName]
    if propKey then
        AttachConfigProp(propKey)
    end
end)
]]

-- Note: This is a reference example. You'll need to adapt it to your specific
-- inventory system (ESX, QBCore, ox_inventory, etc.) and requirements.
