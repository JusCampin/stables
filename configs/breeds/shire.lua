-- Shire Horses
-- Massive and gentle draft horses

return {
    breed = "Shire",
    description = "The largest draft horses, Shires are gentle giants with immense strength. Perfect for heavy hauling and farm work.",
    
    stats = {
        baseSpeed = 3,
        baseAcceleration = 2,
        baseHandling = 3,
        baseStamina = 6,
        baseHealth = 7
    },
    
    horses = {
        {
            model = "a_c_horse_shire_darkbay",
            name = "Dark Bay",
            description = "Massive dark bay Shire, incredible strength",
            cashPrice = 120,
            goldPrice = 5,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 1,
                stamina = 3,
                health = 4
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_shire_lightgrey",
            name = "Light Grey",
            description = "Impressive grey Shire, gentle and powerful",
            cashPrice = 120,
            goldPrice = 5,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 1,
                stamina = 3,
                health = 4
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_shire_ravenblack",
            name = "Raven Black",
            description = "Magnificent black Shire, unmatched hauling power",
            cashPrice = 130,
            goldPrice = 6,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 1,
                acceleration = 1,
                handling = 1,
                stamina = 3,
                health = 4
            },
            
            rarity = "Common"
        }
    }
}
