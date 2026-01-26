local u = require('features.lsp.global_config.fix.auto_code_actions.utils')

local resolve_ca = function(client, ca)
	local cap = client.server_capabilities.codeActionProvider

	if not cap or not cap.resolveProvider then
		return ca
	end

	local res = client:request_sync('codeAction/resolve', ca)
	local resolved_ca = u.handle_res(res)

	return resolved_ca
end

return resolve_ca
