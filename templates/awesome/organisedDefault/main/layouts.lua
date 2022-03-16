-- Each screen has its own tag table.
RC.libs.awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, RC.libs.awful.layout.layouts[1])

tag.connect_signal("request::default_layouts", function()
    RC.libs.awful.layout.append_default_layouts({
        RC.libs.awful.layout.suit.floating,
        RC.libs.awful.layout.suit.tile,
        RC.libs.awful.layout.suit.tile.left,
        RC.libs.awful.layout.suit.tile.bottom,
        RC.libs.awful.layout.suit.tile.top,
        RC.libs.awful.layout.suit.fair,
        RC.libs.awful.layout.suit.fair.horizontal,
        RC.libs.awful.layout.suit.spiral,
        RC.libs.awful.layout.suit.spiral.dwindle,
        RC.libs.awful.layout.suit.max,
        RC.libs.awful.layout.suit.max.fullscreen,
        RC.libs.awful.layout.suit.magnifier,
        RC.libs.awful.layout.suit.corner.nw,
    })
end)
