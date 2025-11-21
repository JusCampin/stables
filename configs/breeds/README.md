# BCC Stables - New Horse Configuration Structure

## Overview

The horse configuration has been restructured into a modular, breed-based system that makes it easier to manage and extend horse data. Each breed is now in its own file with enhanced information.

## Directory Structure

```
configs/
├── horses.lua (OLD - kept for reference)
├── horses_loader.lua (NEW - main loader)
└── breeds/
    ├── index.lua (breed categories and metadata)
    ├── american_paint.lua
    ├── american_standardbred.lua
    ├── andalusian.lua
    ├── appaloosa.lua
    ├── arabian.lua
    ├── ardennes.lua
    ├── belgian_draft.lua
    ├── breton.lua
    ├── criollo.lua
    ├── dutch_warmblood.lua
    ├── gypsy_cob.lua
    ├── hungarian_halfbred.lua
    ├── kentucky_saddler.lua
    ├── kladruber.lua
    ├── missouri_fox_trotter.lua
    ├── morgan.lua
    ├── mustang.lua
    ├── nokota.lua
    ├── norfolk_roadster.lua
    ├── shire.lua
    ├── suffolk_punch.lua
    ├── tennessee_walker.lua
    ├── thoroughbred.lua
    ├── turkoman.lua
    ├── special.lua
    └── other.lua
```

## What's New

### Enhanced Horse Data

Each horse now includes:
- **Name**: Display name (e.g., "Grey Overo")
- **Description**: Detailed information about the horse
- **Stats**: Individual performance statistics (speed, acceleration, handling, stamina, health)
- **Rarity**: Common, Uncommon, Rare, Epic, or Legendary
- **Price Information**: Cash and gold prices
- **Job Restrictions**: Which jobs can purchase the horse
- **Inventory Limit**: How much the horse can carry

### Breed Information

Each breed file contains:
- **Breed Name**: Full breed name
- **Description**: Information about the breed
- **Base Stats**: Default statistics for the breed
- **Horses Array**: All color variations with individual stats

### Categories

Breeds are organized into categories:
- **Work**: Versatile horses for general use
- **Race**: Fast horses for racing and quick travel
- **War**: Strong horses for combat
- **Draft**: Heavy horses for pulling and hauling
- **Wild**: Untamed horses with spirit
- **Elite**: Top-tier multi-role horses
- **Unique**: Special story horses
- **Misc**: Donkeys, mules, and other mounts

## Usage

### Loading the System

In your `fxmanifest.lua`, replace:
```lua
shared_script 'configs/horses.lua'
```

With:
```lua
shared_script 'configs/horses_loader.lua'
```

### Backwards Compatibility

The loader automatically creates the old `Horses` table format, so existing code will continue to work without modification.

### New Helper Functions

#### Get All Breeds
```lua
local breeds = Breeds -- Array of all breed metadata
```

#### Get Breed Categories
```lua
local categories = GetBreedCategories()
-- Returns: {"Work", "Race", "War", "Draft", "Wild", "Elite", "Unique", "Misc"}
```

#### Get Breeds by Category
```lua
local raceBreeds = GetBreedsByCategory("Race")
-- Returns array of breed metadata for racing breeds
```

#### Get Breed Information
```lua
local breedInfo = GetBreedInfo("Arabian")
-- Returns: {name, category, description, file}
```

#### Get Full Breed Data
```lua
local arabianData = GetBreedData("Arabian")
-- Returns: {breed, description, stats, horses[]}
```

#### Get All Horses for a Breed
```lua
local arabianHorses = GetHorsesForBreed("Arabian")
-- Returns array of all Arabian horses with full data
```

#### Get Specific Horse by Model
```lua
local horse, breed = GetHorseByModel("a_c_horse_arabian_white")
-- Returns: horse data and breed name
```

#### Search Horses
```lua
local results = SearchHorses("black")
-- Returns all horses with "black" in name, breed, or description
```

#### Filter by Rarity
```lua
local legendaryHorses = GetHorsesByRarity("Legendary")
-- Returns all legendary horses
```

#### Filter by Price Range
```lua
local affordableHorses = GetHorsesByPriceRange(0, 200, false)
-- Returns horses costing $0-$200 cash
```

#### Filter by Job
```lua
local policeHorses = GetHorsesForJob("police")
-- Returns all horses available to police job
```

## Menu Implementation Example

### Step 1: Display Breed Categories
```lua
-- Show category menu
for _, category in ipairs(GetBreedCategories()) do
    -- Add menu item for each category
    AddMenuItem(category)
end
```

### Step 2: Display Breeds in Category
```lua
-- When category selected, show breeds
local breeds = GetBreedsByCategory(selectedCategory)
for _, breed in ipairs(breeds) do
    AddMenuItem(breed.name, breed.description)
end
```

### Step 3: Display Horses in Breed
```lua
-- When breed selected, show all horses
local horses = GetHorsesForBreed(selectedBreed)
for _, horse in ipairs(horses) do
    AddMenuItem(
        horse.name,
        horse.description,
        "$" .. horse.cashPrice .. " | " .. horse.goldPrice .. " Gold"
    )
end
```

### Step 4: Display Horse Details
```lua
-- When horse selected, show full details
local horse, breed = GetHorseByModel(selectedModel)
print("Breed: " .. breed)
print("Name: " .. horse.name)
print("Description: " .. horse.description)
print("Rarity: " .. horse.rarity)
print("Speed: " .. horse.stats.speed)
print("Stamina: " .. horse.stats.stamina)
-- etc.
```

## Individual Breed File Format

Each breed file follows this structure:

```lua
return {
    breed = "Breed Name",
    description = "Information about the breed",
    
    stats = {
        baseSpeed = 5,
        baseAcceleration = 5,
        baseHandling = 5,
        baseStamina = 5,
        baseHealth = 5
    },
    
    horses = {
        {
            model = "game_model_name",
            name = "Display Name",
            description = "Horse description",
            cashPrice = 100,
            goldPrice = 5,
            invLimit = 200,
            job = {}, -- or {"police", "doctor"}
            
            stats = {
                speed = 2,
                acceleration = 2,
                handling = 2,
                stamina = 2,
                health = 2
            },
            
            rarity = "Common" -- Common, Uncommon, Rare, Epic, Legendary
        }
        -- ... more horses
    }
}
```

## Adding New Horses

1. Open the appropriate breed file in `configs/breeds/`
2. Add a new entry to the `horses` array
3. Include all required fields (model, name, description, prices, stats, rarity)
4. Save the file - changes will be loaded automatically

## Adding New Breeds

1. Create a new file in `configs/breeds/` (e.g., `new_breed.lua`)
2. Follow the breed file format above
3. Add an entry to `configs/breeds/index.lua` in the `Breeds` table
4. Add a require statement in `configs/horses_loader.lua`

## Statistics Guide

### Base Stats (0-10 scale)
- **Speed**: Maximum speed
- **Acceleration**: How quickly reaches max speed
- **Handling**: Turning and control
- **Stamina**: How long can run
- **Health**: Durability and health pool

### Rarity Levels
- **Common**: Basic horses, widely available
- **Uncommon**: Slightly better than common
- **Rare**: Above average horses
- **Epic**: High-end horses with excellent stats
- **Legendary**: The best horses available

## Benefits of New Structure

1. **Easier Management**: Each breed in its own file
2. **Enhanced Data**: More information per horse (stats, rarity, descriptions)
3. **Better Menus**: Category → Breed → Horse navigation
4. **Searchable**: Helper functions for filtering and searching
5. **Maintainable**: Add/modify horses without touching other breeds
6. **Backwards Compatible**: Old code still works
7. **Future-Proof**: Easy to extend with new features

## Migration Notes

The old `horses.lua` file has been kept for reference but is no longer used. The `horses_loader.lua` creates a compatible `Horses` table automatically, so existing menu code should work without changes.

To take advantage of the new features, update your menu code to use the breed-based navigation and new helper functions.
