local wez = require 'wezterm'
local keys = require 'keymap.keys_definition'

local act = wez.action

local create_keybinding = function(key, index)
  return { key = key, mods = 'CTRL', action = act.ActivateTab(index) }
end

local keybindings = {}

for i, key in ipairs(keys.number_keys) do
  local keybinding = create_keybinding(key, i - 1)
  table.insert(keybindings, keybinding)
end


return keybindings
