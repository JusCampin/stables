-- Feather Menu Implementation for BCC Stables
-- Uses the category > breed > horse navigation structure

-- Initialize Feather Menu
local FeatherMenu = exports['feather-menu']:initiate()

-- Global variables
local StableMenu = nil
local CategoryPage = nil
local currentLocation = nil -- Store stable location info if needed
local PageCache = {} -- Cache for dynamically created pages

-- Helper: Create a formatted price string
local function FormatPrice(horse)
    local priceText = ""
    if horse.cashPrice and horse.cashPrice > 0 then
        priceText = "$" .. horse.cashPrice
    end
    if horse.goldPrice and horse.goldPrice > 0 then
        if priceText ~= "" then
            priceText = priceText .. " or "
        end
        priceText = priceText .. horse.goldPrice .. " Gold"
    end
    return priceText
end

-- Helper: Build horse stats display
local function BuildStatsDisplay(stats)
    if not stats then return "No stats available" end
    return string.format(
        "Speed: %d | Acceleration: %d | Handling: %d\nStamina: %d | Health: %d",
        stats.speed or 0,
        stats.acceleration or 0,
        stats.handling or 0,
        stats.stamina or 0,
        stats.health or 0
    )
end

-- Initialize the main menu
function InitializeStableMenu()
    -- Register the main menu
    StableMenu = FeatherMenu:RegisterMenu('bcc-stables:shop:menu', {
        top = '3%',
        left = '3%',
        ['720width'] = '400px',
        ['1080width'] = '500px',
        ['2kwidth'] = '600px',
        ['4kwidth'] = '800px',
        style = {},
        contentslot = {
            style = {
                ['height'] = '400px',
                ['min-height'] = '250px'
            }
        },
        draggable = true,
        canclose = true
    }, {
        opened = function()
           InMenu = true
            DisplayRadar(false)
        end,
        closed = function()
            InMenu = false
            DestroyAllCams(true)
            DisplayRadar(true)
        end
    })

    -- Create the category selection page
    CreateCategoryPage()
end

-- Create the category selection page
function CreateCategoryPage()
    if not StableMenu then return end
    
    CategoryPage = StableMenu:RegisterPage('categories:page')

    -- Header
    CategoryPage:RegisterElement('header', {
        value = 'Stable',
        slot = "header"
    })

    CategoryPage:RegisterElement('subheader', {
        value = "Select Horse Category",
        slot = "header"
    })

    CategoryPage:RegisterElement('line', {
        slot = "header"
    })

    -- Get all categories
    local categories = GetBreedCategories()
    
    -- Create buttons for each category
    for _, category in ipairs(categories) do
        CategoryPage:RegisterElement('button', {
            label = category,
            slot = "content"
        }, function()
            OpenBreedSelectionPage(category)
        end)
    end

    -- Footer
    CategoryPage:RegisterElement('bottomline', {
        slot = "footer"
    })
end

-- Create and open breed selection page for a category
function OpenBreedSelectionPage(category)
    if not StableMenu then return end
    
    local breedPageId = 'breeds:' .. category:lower():gsub("%s+", "_")
    
    -- Check if page already exists in cache
    if not PageCache[breedPageId] then
        local BreedPage = StableMenu:RegisterPage(breedPageId)
        PageCache[breedPageId] = BreedPage

        -- Header
        BreedPage:RegisterElement('header', {
            value = 'Stable',
            slot = "header"
        })

        BreedPage:RegisterElement('subheader', {
            value = category .. " Breeds",
            slot = "header"
        })

        BreedPage:RegisterElement('line', {
            slot = "header"
        })

        -- Get breeds in this category
        local breeds = GetBreedsByCategory(category)

        -- Create button for each breed
        for _, breed in ipairs(breeds) do
            BreedPage:RegisterElement('button', {
                label = breed.name,
                slot = "content"
            }, function()
                OpenHorseSelectionPage(breed.name, category)
            end)
        end

        -- Back button
        BreedPage:RegisterElement('button', {
            label = "← Back to Categories",
            slot = "footer",
            style = {
                ['margin-top'] = '10px'
            }
        }, function()
            if CategoryPage then
                CategoryPage:RouteTo()
            end
        end)

        BreedPage:RegisterElement('bottomline', {
            slot = "footer"
        })
    end

    -- Route to this page
    PageCache[breedPageId]:RouteTo()
end

-- Create and open horse selection page for a breed
function OpenHorseSelectionPage(breedName, category)
    if not StableMenu then return end
    
    local horsePageId = 'horses:' .. breedName:lower():gsub("%s+", "_")
    
    -- Check if page already exists in cache
    if not PageCache[horsePageId] then
        local HorsePage = StableMenu:RegisterPage(horsePageId)
        PageCache[horsePageId] = HorsePage

        -- Header
        HorsePage:RegisterElement('header', {
            value = 'Stable',
            slot = "header"
        })

        HorsePage:RegisterElement('subheader', {
            value = breedName,
            slot = "header"
        })

        HorsePage:RegisterElement('line', {
            slot = "header"
        })

        -- Get horses for this breed
        local horses = GetHorsesForBreed(breedName)

        -- Create button for each horse
        if horses and #horses > 0 then
            for _, horse in ipairs(horses) do
                local priceText = FormatPrice(horse)
                
                HorsePage:RegisterElement('button', {
                    label = horse.name .. " - " .. priceText,
                    slot = "content"
                }, function()
                    OpenHorseDetailsPage(horse, breedName, category)
                end)
            end
        else
            HorsePage:RegisterElement('textdisplay', {
                value = "No horses available in this breed",
                slot = "content"
            })
        end

        -- Back button
        HorsePage:RegisterElement('button', {
            label = "← Back to " .. category .. " Breeds",
            slot = "footer",
            style = {
                ['margin-top'] = '10px'
            }
        }, function()
            local breedPageId = 'breeds:' .. category:lower():gsub("%s+", "_")
            if PageCache[breedPageId] then
                PageCache[breedPageId]:RouteTo()
            end
        end)

        HorsePage:RegisterElement('bottomline', {
            slot = "footer"
        })
    end

    -- Route to this page
    PageCache[horsePageId]:RouteTo()
end

-- Create and open horse details page
function OpenHorseDetailsPage(horse, breedName, category)
    if not StableMenu then return end
    
    local detailsPageId = 'details:' .. horse.model:lower()
    
    -- Always recreate details page (since it's horse-specific)
    local DetailsPage = StableMenu:RegisterPage(detailsPageId)

    -- Header
    DetailsPage:RegisterElement('header', {
        value = 'Stable',
        slot = "header"
    })

    DetailsPage:RegisterElement('subheader', {
        value = horse.name,
        slot = "header"
    })

    DetailsPage:RegisterElement('line', {
        slot = "header"
    })

    -- Horse description
    if horse.description then
        DetailsPage:RegisterElement('textdisplay', {
            value = horse.description,
            slot = "content",
            style = {
                ['margin-bottom'] = '15px',
                ['text-align'] = 'center',
                ['padding'] = '0 20px'
            }
        })
    end

    -- Price
    local priceText = FormatPrice(horse)
    DetailsPage:RegisterElement('textdisplay', {
        value = "Price: " .. priceText,
        slot = "content",
        style = {
            ['font-weight'] = 'bold',
            ['margin-bottom'] = '10px'
        }
    })

    -- Rarity
    if horse.rarity then
        DetailsPage:RegisterElement('textdisplay', {
            value = "Rarity: " .. horse.rarity,
            slot = "content",
            style = {
                ['margin-bottom'] = '10px'
            }
        })
    end

    -- Stats
    if horse.stats then
        local statsText = BuildStatsDisplay(horse.stats)
        DetailsPage:RegisterElement('textdisplay', {
            value = statsText,
            slot = "content",
            style = {
                ['margin-bottom'] = '15px',
                ['white-space'] = 'pre-line'
            }
        })
    end

    -- Inventory Limit
    if horse.invLimit then
        DetailsPage:RegisterElement('textdisplay', {
            value = "Inventory Slots: " .. horse.invLimit,
            slot = "content",
            style = {
                ['margin-bottom'] = '10px'
            }
        })
    end

    -- Purchase button
    DetailsPage:RegisterElement('button', {
        label = "Purchase Horse",
        slot = "content",
        style = {
            ['margin-top'] = '20px',
            ['background-color'] = '#2a5c1e'
        }
    }, function()
        -- Handle purchase
        PurchaseHorse(horse)
    end)

    -- Back button
    DetailsPage:RegisterElement('button', {
        label = "← Back to " .. breedName,
        slot = "footer",
        style = {
            ['margin-top'] = '10px'
        }
    }, function()
        local horsePageId = 'horses:' .. breedName:lower():gsub("%s+", "_")
        if PageCache[horsePageId] then
            PageCache[horsePageId]:RouteTo()
        end
    end)

    DetailsPage:RegisterElement('bottomline', {
        slot = "footer"
    })

    -- Route to this page
    DetailsPage:RouteTo()
end

-- Handle horse purchase
function PurchaseHorse(horse)
    if not StableMenu then return end
    
    -- Close the menu
    StableMenu:Close()

    -- Trigger server event to handle purchase
    TriggerServerEvent('bcc-stables:PurchaseHorse', horse.model, currentLocation)

    -- Show notification
    FeatherMenu:Notify({
        message = 'Processing purchase for ' .. horse.name,
        type = 'info',
        autoClose = 3000
    })
end

-- Open the stable menu (call this from your stable interaction)
function OpenStableMenu(location)
    currentLocation = location
    
    -- Initialize menu if not already done
    if not StableMenu then
        InitializeStableMenu()
    end

    -- Open the menu at category page
    if StableMenu then
        StableMenu:Open({
            startupPage = CategoryPage
        })
    end
end

-- Export for use in other scripts
exports('OpenStableMenu', OpenStableMenu)

-- Command for testing (remove in production)
RegisterCommand('testmenu', function()
    OpenStableMenu(nil)
end, false)
