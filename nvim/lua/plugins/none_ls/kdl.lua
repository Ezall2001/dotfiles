local args = function(params)
	local file_path = vim.uri_to_fname(params.lsp_params.textDocument.uri)
	local conf_path = vim.trim(vim.fn.system({ "btrkdlfmt", "get_conf", file_path }))

	return { "--config", conf_path }
end

local kdl = function()
	local helpers = require("null-ls.helpers")
	local null_ls = require("null-ls")

	return {
		name = "kdl formatter",
		method = null_ls.methods.FORMATTING,
		filetypes = { "kdl" },
		generator = helpers.formatter_factory({
			command = "btrkdlfmt",
			args = args,
			to_stdin = true,
		}),
	}
end

return kdl
