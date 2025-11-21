-- Other Mounts
-- Donkeys, mules, and other unique mounts

return {
    breed = "Other",
    description = "Alternative mounts including donkeys, mules, and unusual horses. Budget-friendly options with unique characteristics.",
    
    stats = {
        baseSpeed = 2,
        baseAcceleration = 2,
        baseHandling = 3,
        baseStamina = 5,
        baseHealth = 5
    },
    
    horses = {
        {
            model = "a_c_donkey_01",
            name = "Donkey",
            description = "Humble donkey, extremely affordable and surprisingly durable",
            cashPrice = 15,
            goldPrice = 1,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 2,
                stamina = 3,
                health = 3
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_mp_mangy_backup",
            name = "Mangy Horse",
            description = "Scraggly and worn, but still serviceable",
            cashPrice = 15,
            goldPrice = 1,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 1,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horsemule_01",
            name = "Mule",
            description = "Sturdy mule, excellent for carrying loads",
            cashPrice = 15,
            goldPrice = 1,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 2,
                stamina = 4,
                health = 4
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horsemulepainted_01",
            name = "Painted Mule (Zebra Donkey)",
            description = "Unusual striped mount, conversation starter",
            cashPrice = 15,
            goldPrice = 1,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 2,
                stamina = 3,
                health = 3
            },
            
            rarity = "Uncommon"
        },
        {
            model = "a_c_horse_murfreebrood_mange_01",
            name = "Murfree Horse I",
            description = "Neglected mount from Murfree territory, rough condition",
            cashPrice = 15,
            goldPrice = 1,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 1,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_murfreebrood_mange_02",
            name = "Murfree Horse II",
            description = "Another neglected Murfree mount, seen better days",
            cashPrice = 15,
            goldPrice = 1,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 1,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_murfreebrood_mange_03",
            name = "Murfree Horse III",
            description = "Third variety of Murfree mount, barely holding on",
            cashPrice = 15,
            goldPrice = 1,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 1,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common"
        }
    }
}
