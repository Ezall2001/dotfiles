local apply_cmd = require('features.lsp.global_config.fix.auto_code_actions.apply_ca.apply_cmd')
local apply_edit = require('features.lsp.global_config.fix.auto_code_actions.apply_ca.apply_edit')

local apply_ca = function(client, ca)
	if ca == nil then
		return
	end

	if ca.edit ~= nil then
		apply_edit(client, ca)
	end

	if ca.command ~= nil then
		apply_cmd(client, ca)
	end
end

return apply_ca
