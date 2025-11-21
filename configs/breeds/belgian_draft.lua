-- Belgian Draft Horses
-- Powerful draft horses ideal for heavy work

return {
    breed = "Belgian Draft",
    description = "Massive and strong draft horses perfect for pulling heavy loads and farm work. Not built for speed but unmatched in strength.",
    
    stats = {
        baseSpeed = 3,
        baseAcceleration = 2,
        baseHandling = 3,
        baseStamina = 6,
        baseHealth = 7
    },
    
    horses = {
        {
            model = "a_c_horse_belgian_blondchestnut",
            name = "Blond Chestnut",
            description = "Light chestnut draft horse, excellent for heavy hauling",
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
            model = "a_c_horse_belgian_mealychestnut",
            name = "Mealy Chestnut",
            description = "Distinctive mealy chestnut coat, powerful and reliable",
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
        }
    }
}
