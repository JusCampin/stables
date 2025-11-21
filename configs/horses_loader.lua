-- Horse Breeds Loader
-- This file provides helper functions to access horse data by breed for menu systems
-- Loads individual breed files dynamically on client

-- Initialize breed data storage
local BreedData = {}
local breedsLoaded = false

-- Function to load a single breed file
local function LoadBreedFile(filename)
    local fileContent = LoadResourceFile(GetCurrentResourceName(), 'configs/breeds/' .. filename .. '.lua')
    if fileContent then
        local breedFunc, loadError = load(fileContent, '@@configs/breeds/' .. filename .. '.lua')
        if breedFunc then
            return breedFunc()
        else
            print('Error loading breed file ' .. filename .. ': ' .. tostring(loadError))
        end
    else
        print('Could not read breed file: ' .. filename)
    end
    return nil
end

-- Load all breed data files
local function InitializeBreedData()
    if breedsLoaded then return end
    
    BreedData = {
        american_paint = LoadBreedFile('american_paint'),
        american_standardbred = LoadBreedFile('american_standardbred'),
        andalusian = LoadBreedFile('andalusian'),
        appaloosa = LoadBreedFile('appaloosa'),
        arabian = LoadBreedFile('arabian'),
        ardennes = LoadBreedFile('ardennes'),
        belgian_draft = LoadBreedFile('belgian_draft'),
        breton = LoadBreedFile('breton'),
        criollo = LoadBreedFile('criollo'),
        dutch_warmblood = LoadBreedFile('dutch_warmblood'),
        gypsy_cob = LoadBreedFile('gypsy_cob'),
        hungarian_halfbred = LoadBreedFile('hungarian_halfbred'),
        kentucky_saddler = LoadBreedFile('kentucky_saddler'),
        kladruber = LoadBreedFile('kladruber'),
        missouri_fox_trotter = LoadBreedFile('missouri_fox_trotter'),
        morgan = LoadBreedFile('morgan'),
        mustang = LoadBreedFile('mustang'),
        nokota = LoadBreedFile('nokota'),
        norfolk_roadster = LoadBreedFile('norfolk_roadster'),
        shire = LoadBreedFile('shire'),
        suffolk_punch = LoadBreedFile('suffolk_punch'),
        tennessee_walker = LoadBreedFile('tennessee_walker'),
        thoroughbred = LoadBreedFile('thoroughbred'),
        turkoman = LoadBreedFile('turkoman'),
        special = LoadBreedFile('special'),
        other = LoadBreedFile('other')
    }
    
    breedsLoaded = true
    print('[BCC Stables] Loaded ' .. #GetBreedCategories() .. ' breed categories')
end

-- Initialize on load
CreateThread(function()
    Wait(100) -- Small delay to ensure index.lua globals are available
    InitializeBreedData()
end)

-- Helper Functions

-- Get all available breed categories for menu display
function GetBreedCategories()
    return GetCategories()
end

-- Get all breeds in a specific category
function GetBreedsByCategory(category)
    local results = {}
    for _, breed in ipairs(Breeds) do
        if breed.category == category then
            table.insert(results, breed)
        end
    end
    return results
end

-- Get breed metadata by name
function GetBreedInfo(breedName)
    for _, breed in ipairs(Breeds) do
        if breed.name == breedName then
            return breed
        end
    end
    return nil
end

-- Get full breed data including horses by breed name
function GetBreedData(breedName)
    local breedInfo = GetBreedInfo(breedName)
    if breedInfo and breedInfo.file then
        return BreedData[breedInfo.file]
    end
    return nil
end

-- Get all horses for a specific breed
function GetHorsesForBreed(breedName)
    local breedData = GetBreedData(breedName)
    if breedData then
        return breedData.horses
    end
    return {}
end

-- Get a specific horse by model name
function GetHorseByModel(modelName)
    for _, breedData in pairs(BreedData) do
        for _, horse in ipairs(breedData.horses) do
            if horse.model == modelName then
                return horse, breedData.breed
            end
        end
    end
    return nil, nil
end

-- Get all horses (flattened list)
function GetAllHorses()
    local allHorses = {}
    for _, breed in ipairs(Breeds) do
        local breedData = BreedData[breed.file]
        if breedData then
            for _, horse in ipairs(breedData.horses) do
                table.insert(allHorses, {
                    breed = breedData.breed,
                    model = horse.model,
                    name = horse.name,
                    description = horse.description,
                    cashPrice = horse.cashPrice,
                    goldPrice = horse.goldPrice,
                    invLimit = horse.invLimit,
                    job = horse.job,
                    stats = horse.stats,
                    rarity = horse.rarity
                })
            end
        end
    end
    return allHorses
end

-- Search horses by name, breed, or description
function SearchHorses(searchTerm)
    local results = {}
    searchTerm = searchTerm:lower()

    for _, breed in ipairs(Breeds) do
        local breedData = BreedData[breed.file]
        if breedData then
            for _, horse in ipairs(breedData.horses) do
                local horseName = horse.name:lower()
                local breedName = breedData.breed:lower()
                local description = horse.description:lower()

                if horseName:find(searchTerm) or breedName:find(searchTerm) or description:find(searchTerm) then
                    table.insert(results, {
                        breed = breedData.breed,
                        horse = horse
                    })
                end
            end
        end
    end

    return results
end

-- Get horses by rarity
function GetHorsesByRarity(rarity)
    local results = {}

    for _, breed in ipairs(Breeds) do
        local breedData = BreedData[breed.file]
        if breedData then
            for _, horse in ipairs(breedData.horses) do
                if horse.rarity == rarity then
                    table.insert(results, {
                        breed = breedData.breed,
                        horse = horse
                    })
                end
            end
        end
    end

    return results
end

-- Get horses by price range
function GetHorsesByPriceRange(minPrice, maxPrice, useGold)
    local results = {}

    for _, breed in ipairs(Breeds) do
        local breedData = BreedData[breed.file]
        if breedData then
            for _, horse in ipairs(breedData.horses) do
                local price = useGold and horse.goldPrice or horse.cashPrice
                if price >= minPrice and price <= maxPrice then
                    table.insert(results, {
                        breed = breedData.breed,
                        horse = horse
                    })
                end
            end
        end
    end

    return results
end

-- Get horses available for a specific job
function GetHorsesForJob(jobName)
    local results = {}

    for _, breed in ipairs(Breeds) do
        local breedData = BreedData[breed.file]
        if breedData then
            for _, horse in ipairs(breedData.horses) do
                -- If job table is empty, horse is available to all
                if #horse.job == 0 then
                    table.insert(results, {
                        breed = breedData.breed,
                        horse = horse
                    })
                else
                    -- Check if jobName is in the job list
                    for _, allowedJob in ipairs(horse.job) do
                        if allowedJob == jobName then
                            table.insert(results, {
                                breed = breedData.breed,
                                horse = horse
                            })
                            break
                        end
                    end
                end
            end
        end
    end

    return results
end

print("^2[BCC Stables]^7 Loaded " .. #Breeds .. " horse breeds with enhanced data structure")
