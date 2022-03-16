-- Editor to be used
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = RC.vars.terminal .. " -e " .. '"' .. editor

-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() RC.libs.hotkeys_popup.show_help(nil, RC.libs.awful.screen.focused()) end },
   { "manual", RC.vars.terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile .. '"'},
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

mymainmenu = RC.libs.awful.menu({ items = { { "awesome", myawesomemenu, RC.libs.beautiful.awesome_icon },
                                    { "open terminal", RC.vars.terminal }
                                  }
                        })

mylauncher = RC.libs.awful.widget.launcher({ image = RC.libs.beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
RC.libs.menubar.utils.terminal = RC.vars.terminal -- Set the terminal for applications that require it
