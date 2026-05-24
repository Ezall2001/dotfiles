local r_base_definition = 'features.lsp.definitions'

local get_normal_kinds = function(client)
	local r_path = r_base_definition .. '.' .. client.name
	local mod = require(r_path)

	if mod.auto_code_actions == nil then
		return nil
	end

	return mod.auto_code_actions
end

local get_null_ls_kinds = function(client)
	--TODO: filter by active null-lsp lsp
	return nil
end

return function(client)
	if client.name == 'null-ls' then
		return get_null_ls_kinds(client)
	end
	return get_normal_kinds(client)
end
