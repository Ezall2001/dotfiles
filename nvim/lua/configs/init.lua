local M = {}

M.init = function()
	require("configs.global").init()
	require("configs.ft_setters").init()
	require("configs.ft_configs").init()
end

return M
