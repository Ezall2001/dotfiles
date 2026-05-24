local r = require('utils.range')
local u = require('features.lsp.global_config.fix.auto_code_actions.utils')

local get_normal_cas = function(client, kind)
	local doc = vim.lsp.util.make_text_document_params(0)

	local res = client:request_sync('textDocument/codeAction', {
		textDocument = doc,
		context = { only = { kind }, diagnostics = {} },
		range = r.range(),
	})

	return u.handle_res(res)[1]
end

return get_normal_cas
