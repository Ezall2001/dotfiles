local t = require('configs.ft_configs.definitions.typst').utils

local pin_main_file = function(client)
	local main_file = t.get_main_file()

	if main_file == nil then
		return
	end

	client:exec_cmd({
		title = 'pin',
		command = 'tinymist.pinMain',
		arguments = { main_file },
	})
end

local M = {}

M.on_init = function(client)
	if client == nil then
		return
	end

	pin_main_file(client)
end

return M
