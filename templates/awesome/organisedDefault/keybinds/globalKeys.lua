-- General Awesome keys
RC.libs.awful.keyboard.append_global_keybindings({
    RC.libs.awful.key({ RC.vars.modkey,           }, "s",      RC.libs.hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    RC.libs.awful.key({ RC.vars.modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    RC.libs.awful.key({ RC.vars.modkey }, "x",
              function ()
                  RC.libs.awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = RC.libs.awful.screen.focused().mypromptbox.widget,
                    exe_callback = RC.libs.awful.util.eval,
                    history_path = RC.libs.awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "Return", function () RC.libs.awful.spawn(RC.vars.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    RC.libs.awful.key({ RC.vars.modkey },            "r",     function () RC.libs.awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),
    RC.libs.awful.key({ RC.vars.modkey }, "p", function() RC.libs.menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
})

-- Tags related keybindings
RC.libs.awful.keyboard.append_global_keybindings({
    RC.libs.awful.key({ RC.vars.modkey,           }, "Left",   RC.libs.awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "Right",  RC.libs.awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "Escape", RC.libs.awful.tag.history.restore,
              {description = "go back", group = "tag"}),
})

-- Focus related keybindings
RC.libs.awful.keyboard.append_global_keybindings({
    RC.libs.awful.key({ RC.vars.modkey,           }, "j",
        function ()
            RC.libs.awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    RC.libs.awful.key({ RC.vars.modkey,           }, "k",
        function ()
            RC.libs.awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    RC.libs.awful.key({ RC.vars.modkey,           }, "Tab",
        function ()
            RC.libs.awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),
    RC.libs.awful.key({ RC.vars.modkey, "Control" }, "j", function () RC.libs.awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    RC.libs.awful.key({ RC.vars.modkey, "Control" }, "k", function () RC.libs.awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    RC.libs.awful.key({ RC.vars.modkey, "Control" }, "n",
              function ()
                  local c = RC.libs.awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:activate { raise = true, context = "key.unminimize" }
                  end
              end,
              {description = "restore minimized", group = "client"}),
})

-- Layout related keybindings
RC.libs.awful.keyboard.append_global_keybindings({
    RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "j", function () RC.libs.awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "k", function () RC.libs.awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "u", RC.libs.awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "l",     function () RC.libs.awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "h",     function () RC.libs.awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "h",     function () RC.libs.awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "l",     function () RC.libs.awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    RC.libs.awful.key({ RC.vars.modkey, "Control" }, "h",     function () RC.libs.awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    RC.libs.awful.key({ RC.vars.modkey, "Control" }, "l",     function () RC.libs.awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    RC.libs.awful.key({ RC.vars.modkey,           }, "space", function () RC.libs.awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    RC.libs.awful.key({ RC.vars.modkey, "Shift"   }, "space", function () RC.libs.awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
})
