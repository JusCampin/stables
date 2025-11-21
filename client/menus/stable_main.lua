StableShopMenu = FeatherMenu:RegisterMenu('bcc-stables:shop:menu', {
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

function StableMenu(shop)
    local MainPage = StableShopMenu:RegisterPage('main:page')

    if not shop or Stables[shop] then
        DBG.Error('Invalid shop passed to StableMenu')
        return
    end

    local shopCfg = Stables[shop]

    MainPage:RegisterElement('header', {
        value = shopCfg.shop.name,
        slot = 'header',
        style = {
            ['color'] = '#999'
        }
    })

    MainPage:RegisterElement('subheader', {
        value = _U('horseManagement'),
        slot = 'header',
        style = {
            ['font-size'] = '0.94vw',
            ['color'] = '#CC9900'
        }
    })

    MainPage:RegisterElement('line', {
        slot = 'header',
        style = {}
    })
end