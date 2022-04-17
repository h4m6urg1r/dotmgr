RC = {}
-- RC.libs = {}
-- RC.custom = {}
-- RC.custom.titlebar = {}
--
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
gears = require("gears")
awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
-- Declarative object management
ruled = require("ruled")
menubar = require("menubar")
hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
-- require("awful.hotkeys_popup.keys")

-- Extra layout
machi = require("layout-machi")
beautiful.layout_machi = machi.get_icon()
--==============================================================================================================================
-- {{{ Error handling
require('main.errorHandling')
-- }}}

--==============================================================================================================================
-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
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

-- {{{ Garbage collector
require('main.garbageCollector')
-- }}}
