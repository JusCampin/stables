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
