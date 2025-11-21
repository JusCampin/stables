-- American Paint Horses
-- Versatile and hardy horses with distinctive coat patterns

return {
    breed = "American Paint",
    description = "American Paint Horses are known for their distinctive coat patterns and versatility. They excel in various roles from ranch work to riding.",
    
    -- Breed statistics (affects gameplay)
    stats = {
        baseSpeed = 5,
        baseAcceleration = 5,
        baseHandling = 5,
        baseStamina = 5,
        baseHealth = 5
    },
    
    -- Available coat colors
    horses = {
        {
            model = "a_c_horse_americanpaint_greyovero",
            name = "Grey Overo",
            description = "A stunning paint with grey and white overo pattern, highly sought after",
            cashPrice = 425,
            goldPrice = 20,
            invLimit = 200,
            job = {}, -- Jobs that can purchase: e.g., {'police', 'doctor'}
            
            -- Individual horse stats (modifiers to breed base)
            stats = {
                speed = 3,
                acceleration = 3,
                handling = 3,
                stamina = 3,
                health = 3
            },
            
            rarity = "Rare"
        },
        {
            model = "a_c_horse_americanpaint_overo",
            name = "Overo",
            description = "Classic overo pattern with balanced characteristics",
            cashPrice = 130,
            goldPrice = 6,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 2,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_americanpaint_splashedwhite",
            name = "Splashed White",
            description = "Eye-catching white markings create a unique splashed appearance",
            cashPrice = 140,
            goldPrice = 6,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 2,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_americanpaint_tobiano",
            name = "Tobiano",
            description = "Traditional tobiano pattern with distinct colored and white sections",
            cashPrice = 140,
            goldPrice = 6,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 2,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common"
        }
    }
}
