-- Imports
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- Editor to be used
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = RC.vars.terminal .. " -e " .. '"' .. editor

-- Create a launcher widget and a main menu
myawesomemenu = {
    {
        "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end
    },
    {
        "manual", RC.vars.terminal .. " -e man awesome"
    },
    {
        "edit config", editor_cmd .. " " .. awesome.conffile .. '"'
    },
    {
        "restart", awesome.restart
    },
    {
        "quit",
        function() awesome.quit() end
    },
}

mymainmenu = awful.menu(
    {
        items = {
            {
                "awesome",
                myawesomemenu,
                beautiful.awesome_icon
            },
            {
                "open terminal",
                RC.vars.terminal
            }
        }
    }
)

mylauncher = awful.widget.launcher(
    {
        image = beautiful.awesome_icon,
        menu = mymainmenu
    }
)

-- Menubar configuration
menubar.utils.terminal = RC.vars.terminal -- Set the terminal for applications that require it
