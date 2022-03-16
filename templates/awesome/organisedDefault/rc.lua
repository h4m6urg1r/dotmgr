RC = {}
RC.libs = {}
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
RC.libs.gears = require("gears")
RC.libs.awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
RC.libs.wibox = require("wibox")
-- Theme handling library
RC.libs.beautiful = require("beautiful")
-- Notification library
RC.libs.naughty = require("naughty")
-- Declarative object management
RC.libs.ruled = require("ruled")
RC.libs.menubar = require("menubar")
RC.libs.hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

--==============================================================================================================================
-- {{{ Error handling
require('main.errorHandling')
-- }}}

--==============================================================================================================================
-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
RC.libs.beautiful.init(RC.libs.gears.filesystem.get_themes_dir() .. "default/theme.lua")
RC.vars = require('main.userVariables')
-- }}}

--==============================================================================================================================
-- {{{ Menu
require('main.menu')
-- }}}

--==============================================================================================================================
-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
require('main.layouts')
-- }}}

--==============================================================================================================================
-- {{{ Wibar
require('decorations.bar')
-- }}}

--==============================================================================================================================
-- {{{ Mouse bindings
require('keybinds.globalButtons')
-- }}}

--==============================================================================================================================
-- {{{ Key bindings
require('keybinds.globalKeys')

--==============================================================================================================================
require('keybinds.tags')

--==============================================================================================================================
require('keybinds.clientButtons')

--==============================================================================================================================
require('keybinds.clientKeys')
-- }}}

--==============================================================================================================================
-- {{{ Rules
-- Rules to apply to new clients.
require('main.rules')
-- }}}

--==============================================================================================================================
-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
require('decorations.titlebar')
-- }}}

--==============================================================================================================================
-- {{{ Notifications
-- Creates notification window for naughty
require('decorations.notification')
-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
