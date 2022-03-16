-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        RC.libs.awful.button({ }, 1, function()
            c:activate { context = "titlebar", action = "mouse_move"  }
        end),
        RC.libs.awful.button({ }, 3, function()
            c:activate { context = "titlebar", action = "mouse_resize"}
        end),
    }

    RC.libs.awful.titlebar(c).widget = {
        { -- Left
            RC.libs.awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = RC.libs.wibox.layout.fixed.horizontal
        },
        { -- Middle
            { -- Title
                align  = "center",
                widget = RC.libs.awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons,
            layout  = RC.libs.wibox.layout.flex.horizontal
        },
        { -- Right
            RC.libs.awful.titlebar.widget.floatingbutton (c),
            RC.libs.awful.titlebar.widget.maximizedbutton(c),
            RC.libs.awful.titlebar.widget.stickybutton   (c),
            RC.libs.awful.titlebar.widget.ontopbutton    (c),
            RC.libs.awful.titlebar.widget.closebutton    (c),
            layout = RC.libs.wibox.layout.fixed.horizontal()
        },
        layout = RC.libs.wibox.layout.align.horizontal
    }
end)
