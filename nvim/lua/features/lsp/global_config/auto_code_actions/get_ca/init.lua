local get_normal_ca = require('features.lsp.global_config.fix.auto_code_actions.get_ca.get_normal_ca')
local get_null_ls_ca = require('features.lsp.global_config.fix.auto_code_actions.get_ca.get_null_ls_ca')
local get_ts_ca = require('features.lsp.global_config.fix.auto_code_actions.get_ca.get_ts_ls_ca')

local get_cas = function(client, kind)
	if client.name == 'ts_ls' then
		return get_ts_ca(client, kind)
	end

	if client.name == 'null-ls' then
		return get_null_ls_ca(client, kind)
	end

	return get_normal_ca(client, kind)
end

return get_cas
