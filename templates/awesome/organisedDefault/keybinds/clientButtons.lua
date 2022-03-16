client.connect_signal("request::default_mousebindings", function()
    RC.libs.awful.mouse.append_client_mousebindings({
        RC.libs.awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        RC.libs.awful.button({ RC.vars.modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        RC.libs.awful.button({ RC.vars.modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)
