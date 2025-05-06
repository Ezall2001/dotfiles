activate_tab = require 'keymap.activate_tab'
hardcoded = require 'keymap.hardcoded'

local binding_groups = {
  hardcoded,
  activate_tab
}

local keymap = { }

for _,group in ipairs(binding_groups) do
  table.move(group,1,#group,#keymap + 1, keymap)
end


return keymap
