local binder = require("keymap.lib.binder")


local bind_immediates = function()
  local keymap = require("keymap.immediate")
  binder(keymap)
end

local bind_deffered = function()
  local keymap = require("keymap.deffered")
  binder(keymap)
end


return { bind_deffered = bind_deffered, bind_immediates = bind_immediates }
