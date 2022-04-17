-- Imports
local awful = require("awful")
local machi = require("layout-machi")

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        machi.default_layout,
        awful.layout.suit.max,
        awful.layout.suit.magnifier,
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        -- awful.layout.suit.max.fullscreen,
        -- awful.layout.suit.tile.left,
        -- awful.layout.suit.tile.bottom,
        -- awful.layout.suit.tile.top,
        -- awful.layout.suit.fair,
        -- awful.layout.suit.fair.horizontal,
        -- awful.layout.suit.spiral,
        -- awful.layout.suit.spiral.dwindle,
        -- awful.layout.suit.corner.nw,
        -- awful.layout.suit.corner.ne,
        -- awful.layout.suit.corner.sw,
        -- awful.layout.suit.corner.se,
    })
end)

-- Each screen has its own tag table.
awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
