local p = require("commands.project")

local project = function()
	vim.keymap.set("n", "<M-p>p", p.init_project)
	vim.keymap.set("n", "<M-p>d", p.remove_project)
end

return project
