local p = require("features.project")

local project = function()
	vim.keymap.set("n", "<M-p>p", p.create)
	vim.keymap.set("n", "<M-p>d", p.delete)
end

return project
