local map = {
	kdl = "kdl",
}

local M = {}

M.init = function()
	vim.filetype.add({ extension = map })
end

return M
