-- Breeds Index
-- This file contains the list of all available horse breeds and their metadata
-- Used for displaying breed categories in the stable menu

Breeds = {
    {
        name = "American Paint",
        category = "Work",
        description = "Versatile and hardy horses with distinctive coat patterns",
        file = "american_paint"
    },
    {
        name = "American Standardbred",
        category = "Race",
        description = "Swift and enduring trotting horses",
        file = "american_standardbred"
    },
    {
        name = "Andalusian",
        category = "War",
        description = "Elegant and powerful Spanish horses",
        file = "andalusian"
    },
    {
        name = "Appaloosa",
        category = "Work",
        description = "Spotted horses known for stamina and sure-footedness",
        file = "appaloosa"
    },
    {
        name = "Arabian",
        category = "Race",
        description = "Elite horses with superior speed and handling",
        file = "arabian"
    },
    {
        name = "Ardennes",
        category = "War",
        description = "Heavy war horses built for strength and resilience",
        file = "ardennes"
    },
    {
        name = "Belgian Draft",
        category = "Draft",
        description = "Powerful draft horses ideal for heavy work",
        file = "belgian_draft"
    },
    {
        name = "Breton",
        category = "War",
        description = "Robust warhorses from Brittany",
        file = "breton"
    },
    {
        name = "Criollo",
        category = "Work",
        description = "Tough and adaptable South American horses",
        file = "criollo"
    },
    {
        name = "Dutch Warmblood",
        category = "Work",
        description = "Athletic and versatile riding horses",
        file = "dutch_warmblood"
    },
    {
        name = "Gypsy Cob",
        category = "Work",
        description = "Strong and reliable horses with feathered legs",
        file = "gypsy_cob"
    },
    {
        name = "Hungarian Halfbred",
        category = "Work",
        description = "Balanced horses suitable for various tasks",
        file = "hungarian_halfbred"
    },
    {
        name = "Kentucky Saddler",
        category = "Race",
        description = "Smooth-gaited horses perfect for long rides",
        file = "kentucky_saddler"
    },
    {
        name = "Kladruber",
        category = "War",
        description = "Majestic baroque horses with impressive presence",
        file = "kladruber"
    },
    {
        name = "Missouri Fox Trotter",
        category = "Race",
        description = "Premium horses with exceptional speed and stamina",
        file = "missouri_fox_trotter"
    },
    {
        name = "Morgan",
        category = "Work",
        description = "Compact and reliable all-purpose horses",
        file = "morgan"
    },
    {
        name = "Mustang",
        category = "Wild",
        description = "Wild horses known for their spirit and endurance",
        file = "mustang"
    },
    {
        name = "Nokota",
        category = "Wild",
        description = "Rare and resilient wild horses",
        file = "nokota"
    },
    {
        name = "Norfolk Roadster",
        category = "Race",
        description = "Fast and agile roadster horses",
        file = "norfolk_roadster"
    },
    {
        name = "Shire",
        category = "Draft",
        description = "Massive and gentle draft horses",
        file = "shire"
    },
    {
        name = "Suffolk Punch",
        category = "Draft",
        description = "Powerful chestnut draft horses",
        file = "suffolk_punch"
    },
    {
        name = "Tennessee Walker",
        category = "Race",
        description = "Smooth-gaited horses with comfortable rides",
        file = "tennessee_walker"
    },
    {
        name = "Thoroughbred",
        category = "Race",
        description = "Premium racing horses bred for speed",
        file = "thoroughbred"
    },
    {
        name = "Turkoman",
        category = "Elite",
        description = "Rare and prestigious multi-role horses",
        file = "turkoman"
    },
    {
        name = "Special",
        category = "Unique",
        description = "Unique story horses and special mounts",
        file = "special"
    },
    {
        name = "Other",
        category = "Misc",
        description = "Donkeys, mules, and other unique mounts",
        file = "other"
    }
}

-- Helper function to get breed by name
function GetBreedByName(breedName)
    for _, breed in ipairs(Breeds) do
        if breed.name == breedName then
            return breed
        end
    end
    return nil
end

-- Helper function to get all breeds by category
function GetBreedsByCategory(category)
    local breedList = {}
    for _, breed in ipairs(Breeds) do
        if breed.category == category then
            table.insert(breedList, breed)
        end
    end
    return breedList
end

-- Get all available categories
function GetCategories()
    local categories = {}
    local seen = {}
    for _, breed in ipairs(Breeds) do
        if not seen[breed.category] then
            table.insert(categories, breed.category)
            seen[breed.category] = true
        end
    end
    return categories
end

-- Return the module
return {
    Breeds = Breeds,
    GetBreedByName = GetBreedByName,
    GetBreedsByCategory = GetBreedsByCategory,
    GetCategories = GetCategories
}
