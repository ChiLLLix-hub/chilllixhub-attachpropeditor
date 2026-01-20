Config = {}

-- Props that attach to shoulder
Config.ShoulderProps = {
    ['ball'] = {
        model = 'p_trevor_prologe_bally_s',  -- Trevor's bally prop
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.15, 0.0, 0.2),
        rotation = vector3(0.0, 0.0, 0.0),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['balbazar'] = {
        model = 'bs_balbazar',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.12216942710916, 0.038774961641232, 0.10399058826594),
        rotation = vector3(-5.2415065238137, 2.2548527422859, 171.32420301999),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['fred'] = {
        model = 'bs_fred',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.14453816495097, -0.031686111659453, 0.18531826253117),
        rotation = vector3(0.0, 0.0, -171.03712304448),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['batman'] = {
        model = 'bs_batman',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.11566711232183, -0.046572279795657, 0.1892416433317),
        rotation = vector3(0.25426796133497, -8.9524053819205, 173.22883038467),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['charmander'] = {
        model = 'bs_charmander',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.10447397116138, -0.067393992046371, 0.16400717497153),
        rotation = vector3(0.0, 0.0, -178.69961510492),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['spongebob'] = {
        model = 'bs_spongebob',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.13493437347222, -0.0088790327799499, 0.17063079085205),
        rotation = vector3(0.0, 0.0, -175.92670349406),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['patrickstar'] = {
        model = 'bs_patrickstar',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.1204352633664, 0.0, 0.17466086010828),
        rotation = vector3(0.0, 0.0, -165.16249990486),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['nezuko'] = {
        model = 'bs_nezuko',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.14065917040318, -0.044183067343548, 0.18520184322865),
        rotation = vector3(0.0, 0.0, -177.67799925105),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['goku'] = {
        model = 'bs_goku',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.12432780385961, -0.029644966134742, 0.19078875726145),
        rotation = vector3(0.50603825621354, -6.2559446394615, 175.36617832336),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['squirtle'] = {
        model = 'bs_squirtle',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.11677652092635, -0.052363628005425, 0.13929913964948),
        rotation = vector3(0.0, 0.0, 172.2130049934),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['teef'] = {
        model = 'mp_m_freemode_01^teef_diff_002_a_uni',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.11677652092635, -0.052363628005425, 0.13929913964948),
        rotation = vector3(0.0, 0.0, 172.2130049934),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['yondu'] = {
        model = 'prop_fnccorgm_02pole',
        bone = 10706,  -- SKEL_L_Clavicle (left shoulder bone)
        offset = vector3(0.11677652092635, -0.052363628005425, 0.13929913964948),
        rotation = vector3(0.0, 0.0, 172.2130049934),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    -- Add more shoulder props here
    -- ['custom_prop'] = {
    --     model = 'your_custom_prop_model',
    --     bone = 10706,
    --     offset = vector3(0.15, 0.0, 0.0),
    --     rotation = vector3(0.0, 0.0, 0.0),
    --     scale = 1.0
    -- },
}

-- Props that attach to back
Config.BackProps = {
    ['bag'] = {
        model = 'prop_cs_heist_bag_02',  -- Heist bag prop
        bone = 24818,  -- SKEL_Spine3 (upper back bone)
        offset = vector3(0.27894361215601, -0.1517066665554, -0.203301112240990),
        rotation = vector3(-179.65627152013, -65.952268692384, 9.742551205472),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['picker'] = {
        model = 'p_litter_picker_s',  -- Litter picker prop
        bone = 24818,  -- SKEL_Spine3 (upper back bone)
        offset = vector3(0.27894361215601, -0.1517066665554, -0.203301112240990),
        rotation = vector3(-179.65627152013, -65.952268692384, 9.742551205472),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['float'] = {
        model = 'prop_beach_lg_float',  -- Beach float prop
        bone = 24818,  -- SKEL_Spine3 (upper back bone)
        offset = vector3(0.27894361215601, -0.1517066665554, -0.203301112240990),
        rotation = vector3(-179.65627152013, -65.952268692384, 9.742551205472),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['toym16'] = {
        model = 'w_ar_toym16',  -- Toy M16 prop
        bone = 24818,  -- SKEL_Spine3 (upper back bone)
        offset = vector3(0.27894361215601, -0.1517066665554, -0.203301112240990),
        rotation = vector3(-179.65627152013, -65.952268692384, 9.742551205472),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['carbinerifle'] = {
        model = 'w_ar_carbinerifle',  -- Carbine rifle prop
        bone = 24818,  -- SKEL_Spine3 (upper back bone)
        offset = vector3(0.27894361215601, -0.1517066665554, -0.203301112240990),
        rotation = vector3(-179.65627152013, -65.952268692384, 9.742551205472),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    ['sigspear'] = {
        model = 'w_ar_sigspearxm7',  -- Sig Spear XM7 prop
        bone = 24818,  -- SKEL_Spine3 (upper back bone)
        offset = vector3(0.27894361215601, -0.1517066665554, -0.203301112240990),
        rotation = vector3(-179.65627152013, -65.952268692384, 9.742551205472),
        scale = 1.0  -- Prop scale (1.0 = normal size)
    },
    -- Add more back props here
    -- ['custom_prop'] = {
    --     model = 'your_custom_prop_model',
    --     bone = 24818,
    --     offset = vector3(-0.1, -0.15, 0.0),
    --     rotation = vector3(0.0, 0.0, 0.0),
    --     scale = 1.0
    -- },
}

-- Props that attach to head (on top)
Config.HeadProps = {
    ['h_ball'] = {
        model = 'p_trevor_prologe_bally_s',
        bone = 31086,  -- SKEL_Head (head bone)
        offset = vector3(0.37678748394524, 0.091843251858291, -0.00011729334324725),  -- Slightly above head
        rotation = vector3(0.0, 87.153877233912, 178.5175856752),
        scale = 1.0
    },
    ['crown'] = {
        model = 'p_head_001',
        bone = 31086,  -- SKEL_Head (head bone)
        offset = vector3(0.37678748394524, 0.091843251858291, -0.00011729334324725),  -- Slightly above head
        rotation = vector3(0.0, 87.153877233912, 178.5175856752),
        scale = 1.0
    },
    ['small_crown'] = {
        model = 'teef_008_u',
        bone = 31086,  -- SKEL_Head (head bone)
        offset = vector3(0.37678748394524, 0.091843251858291, -0.00011729334324725),  -- Slightly above head
        rotation = vector3(0.0, 87.153877233912, 178.5175856752),
        scale = 1.0
    },
    -- Add more head props here
    -- ['custom_prop'] = {
    --     model = 'your_custom_prop_model',
    --     bone = 31086,
    --     offset = vector3(0.0, 0.0, 0.1),
    --     rotation = vector3(0.0, 0.0, 0.0),
    --     scale = 1.0
    -- },
}

-- Combine all props for easy lookup
Config.AllProps = {}
for propName, propData in pairs(Config.ShoulderProps) do
    Config.AllProps[propName] = propData
end
for propName, propData in pairs(Config.BackProps) do
    Config.AllProps[propName] = propData
end
for propName, propData in pairs(Config.HeadProps) do
    Config.AllProps[propName] = propData
end
