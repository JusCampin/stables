-- Andalusian Horses
-- Elegant and powerful Spanish horses

return {
    breed = "Andalusian",
    description = "Spanish war horses known for their beauty, strength, and noble bearing. Excellent for combat and showing.",
    
    stats = {
        baseSpeed = 4,
        baseAcceleration = 4,
        baseHandling = 6,
        baseStamina = 5,
        baseHealth = 6
    },
    
    horses = {
        {
            model = "a_c_horse_andalusian_darkbay",
            name = "Dark Bay",
            description = "Rich dark bay coat, strong and reliable warhorse",
            cashPrice = 140,
            goldPrice = 6,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 3,
                stamina = 2,
                health = 3
            },
            
            rarity = "Common"
        },
        {
            model = "a_c_horse_andalusian_perlino",
            name = "Perlino",
            description = "Rare cream-colored coat with blue eyes, exceptional handling",
            cashPrice = 450,
            goldPrice = 21,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 4,
                stamina = 3,
                health = 3
            },
            
            rarity = "Rare"
        },
        {
            model = "a_c_horse_andalusian_rosegray",
            name = "Rose Gray",
            description = "Beautiful rose-tinted gray coat, prized by collectors",
            cashPrice = 440,
            goldPrice = 21,
            invLimit = 200,
            job = {},
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 4,
                stamina = 3,
                health = 3
            },
            
            rarity = "Rare"
        }
    }
}
