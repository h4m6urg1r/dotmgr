-- Imports
local awful = require("awful")
local ruled = require("ruled")

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id = "global",
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
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
    -- ruled.client.append_rule {
    --     id         = "titlebars",
    --     rule_any   = { type = { "normal", "dialog" } },
    --     properties = { titlebars_enabled = true      }
    -- }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
end)

-- Open floating windows in center of the screen (idk if it works or not seems like it does)
client.connect_signal("request::manage", function(client, context)
    if client.floating and context == "new" then
        client.placement = awful.placement.centered + awful.placement.no_overlap + awful.placement.no_offscreen
    end
end)

-- {{{ I had pretty shitty luck with this shit
-- Titlebars only on floating windows
-- client.connect_signal("property::floating", function(c)
--     if c.floating and not (c.requests_no_titlebar or c.fullscreen) then
--         awful.titlebar.show(c)
--     else
--         awful.titlebar.hide(c)
--     end
-- end)

-- awful.tag.attached_connect_signal(nil,"property::layout", function(t)
--     local float = t.layout.name == "floating"
--     for _,c in pairs(t:clients()) do
--         c.floating = float
--     end
-- end)

-- function toggle(c)
--     if c.floating or c.first_tag.layout.name == "floating" then
--         awful.titlebar.show(c)
--     else
--         awful.titlebar.hide(c)
--     end
-- end
-- }}}
