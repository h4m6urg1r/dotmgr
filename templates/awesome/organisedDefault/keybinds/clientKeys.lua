client.connect_signal("request::default_keybindings", function()
    RC.libs.awful.keyboard.append_client_keybindings({
        RC.libs.awful.key({ RC.vars.modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey, "Control" }, "space",  RC.libs.awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey, "Control" }, "Return", function (c) c:swap(RC.libs.awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)
