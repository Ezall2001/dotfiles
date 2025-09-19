local require_all_in_dir = require("utils.require_all_in_dir")

local require_keymap_dir = vim.fs.joinpath("keymap", "definitions")

require_all_in_dir(require_keymap_dir, function(module)
	module()
end)
