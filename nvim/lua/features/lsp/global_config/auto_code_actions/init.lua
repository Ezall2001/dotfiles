local apply_client_cas = require('features.lsp.global_config.fix.auto_code_actions.apply_client_cas')
--TODO:remove this
require('features.lsp.global_config.fix.auto_code_actions.test_playground')

local init = function(buf)
	local clients = vim.lsp.get_clients({ bufnr = buf })

	for _, client in ipairs(clients) do
		apply_client_cas(client)
	end
end

return init
