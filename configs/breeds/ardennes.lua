-- Ardennes Horses
-- Heavy war horses built for strength and resilience

return {
    breed = "Ardennes",
    description = "Powerful war horses from the Ardennes region. Built for strength and resilience in combat situations.",
    
    stats = {
        baseSpeed = 4,
        baseAcceleration = 3,
        baseHandling = 4,
        baseStamina = 5,
        baseHealth = 7
    },
    
    horses = {
        {
            model = "a_c_horse_ardennes_bayroan",
            name = "Bay Roan",
            description = "Sturdy bay roan warhorse, reliable in any situation",
            cashPrice = 140,
            goldPrice = 6,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 2,
                stamina = 2,
                health = 3
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_ardennes_irongreyroan",
            name = "Iron Grey Roan",
            description = "Premium warhorse with iron grey coat, exceptional durability",
            cashPrice = 1200,
            goldPrice = 58,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 3,
                acceleration = 3,
                handling = 3,
                stamina = 4,
                health = 5
            },
            
            rarity = "Legendary"
        },
        {
            model = "a_c_horse_ardennes_strawberryroan",
            name = "Strawberry Roan",
            description = "Beautiful strawberry roan coat with solid warhorse capabilities",
            cashPrice = 450,
            goldPrice = 21,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 2,
                stamina = 3,
                health = 4
            },
            
            rarity = "Rare"
        }
    }
}
