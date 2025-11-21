-- Suffolk Punch Horses
-- Powerful chestnut draft horses

return {
    breed = "Suffolk Punch",
    description = "Always chestnut in color, Suffolk Punches are powerful draft horses known for their stamina and pulling power.",
    
    stats = {
        baseSpeed = 3,
        baseAcceleration = 2,
        baseHandling = 3,
        baseStamina = 6,
        baseHealth = 7
    },
    
    horses = {
        {
            model = "a_c_horse_suffolkpunch_redchestnut",
            name = "Red Chestnut",
            description = "Rich red chestnut, powerful draft capabilities",
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
            model = "a_c_horse_suffolkpunch_sorrel",
            name = "Sorrel",
            description = "Classic sorrel Suffolk Punch, reliable workhorse",
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
