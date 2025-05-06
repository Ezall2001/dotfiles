local wezterm = require 'wezterm'
local keymap = require "keymap"
local set_theme = require 'themes.dracula_plus'

local config = wezterm.config_builder()

-- THEME
set_theme(config)

-- FONTS
config.font_size = 14
config.font = wezterm.font "JetBrains Mono"

-- TABS
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.tab_max_width = 30


-- PANES
--[[config.inactive_pane_hsb = {
  saturation = 0.1,
  brightness = 0.1,
}]]

-- WINDOW
config.window_decorations = "RESIZE"
config.window_padding = { top = 0, right = 0, bottom = 0, left = 0 }
config.window_background_opacity = 0.8
config.text_background_opacity = 0.95
config.win32_system_backdrop = "Acrylic"

-- KEYBINDINGS
config.keys = keymap
config.key_map_preference = "Mapped"
config.disable_default_key_bindings = true
config.tab_and_split_indices_are_zero_based = true

-- MISC
config.default_prog = { '/Users/armen/AppData/Local/Programs/nu/bin/nu' }
config.default_cwd = "/Users/armen/personal/project_source"
config.use_dead_keys = false

return config
