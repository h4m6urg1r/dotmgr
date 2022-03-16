-- Keyboard map indicator and switcher
mykeyboardlayout = RC.libs.awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = RC.libs.wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
    -- Create a promptbox for each screen
    s.mypromptbox = RC.libs.awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = RC.libs.awful.widget.layoutbox {
        screen  = s,
        buttons = {
            RC.libs.awful.button({ }, 1, function () RC.libs.awful.layout.inc( 1) end),
            RC.libs.awful.button({ }, 3, function () RC.libs.awful.layout.inc(-1) end),
            RC.libs.awful.button({ }, 4, function () RC.libs.awful.layout.inc(-1) end),
            RC.libs.awful.button({ }, 5, function () RC.libs.awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = RC.libs.awful.widget.taglist {
        screen  = s,
        filter  = RC.libs.awful.widget.taglist.filter.all,
        buttons = {
            RC.libs.awful.button({ }, 1, function(t) t:view_only() end),
            RC.libs.awful.button({ RC.vars.modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            RC.libs.awful.button({ }, 3, RC.libs.awful.tag.viewtoggle),
            RC.libs.awful.button({ RC.vars.modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            RC.libs.awful.button({ }, 4, function(t) RC.libs.awful.tag.viewprev(t.screen) end),
            RC.libs.awful.button({ }, 5, function(t) RC.libs.awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = RC.libs.awful.widget.tasklist {
        screen  = s,
        filter  = RC.libs.awful.widget.tasklist.filter.currenttags,
        buttons = {
            RC.libs.awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            RC.libs.awful.button({ }, 3, function() RC.libs.awful.menu.client_list { theme = { width = 250 } } end),
            RC.libs.awful.button({ }, 4, function() RC.libs.awful.client.focus.byidx(-1) end),
            RC.libs.awful.button({ }, 5, function() RC.libs.awful.client.focus.byidx( 1) end),
        }
    }

    -- Create the wibox
    s.mywibox = RC.libs.awful.wibar {
        position = "top",
        screen   = s,
        widget   = {
            layout = RC.libs.wibox.layout.align.horizontal,
            { -- Left widgets
                layout = RC.libs.wibox.layout.fixed.horizontal,
                mylauncher,
                s.mytaglist,
                s.mypromptbox,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = RC.libs.wibox.layout.fixed.horizontal,
                mykeyboardlayout,
                RC.libs.wibox.widget.systray(),
                mytextclock,
                s.mylayoutbox,
            },
        }
    }
end)
-- }}}
