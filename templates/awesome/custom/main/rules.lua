-- Rules to apply to new clients.
RC.libs.ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    RC.libs.ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = RC.libs.awful.client.focus.filter,
            raise     = true,
            screen    = RC.libs.awful.screen.preferred,
            placement = RC.libs.awful.placement.no_overlap+RC.libs.awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    RC.libs.ruled.client.append_rule {
        id = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- -- Add titlebars to normal clients and dialogs
    -- RC.libs.ruled.client.append_rule {
    --     id         = "titlebars",
    --     rule_any   = { type = { "normal", "dialog" } },
    --     properties = { titlebars_enabled = true      }
    -- }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- RC.libs.ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
end)

-- Open floating windows in center of the screen
client.connect_signal("request::manage", function(client, context)
    if client.floating and context == "new" then
        client. placement = RC.libs.awful.placement.centered + RC.libs.awful.placement.no_overlap + RC.libs.awful.placement.no_offscreen
    end
end)
