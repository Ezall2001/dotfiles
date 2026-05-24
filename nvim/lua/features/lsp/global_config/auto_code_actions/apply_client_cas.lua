local apply_ca = require('features.lsp.global_config.fix.auto_code_actions.apply_ca')
local get_ca = require('features.lsp.global_config.fix.auto_code_actions.get_ca')
local get_kinds = require('features.lsp.global_config.fix.auto_code_actions.get_kinds')
local resolve_ca = require('features.lsp.global_config.fix.auto_code_actions.resolve_ca')

local apply_client_cas = function(client)
	local kinds = get_kinds(client)

	if kinds == nil then
		return
	end

	for _, kind in ipairs(kinds) do
		local ca = get_ca(client, kind)
		local resolved_ca = resolve_ca(client, ca)
		-- vim.print(vim.inspect(resolved_ca))
		apply_ca(client, resolved_ca)
	end
end

return apply_client_cas
