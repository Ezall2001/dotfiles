local lsps = {
	'basedpyright',
	'commitlint',
	'harper-ls',
	'json-lsp',
	'lua-language-server',
	'prettier',
	'ruff',
	'selene',
	'stylua',
	'typescript-language-server',
	'lemminx',
}

local check_lsp = function(lsp)
	local m = require('mason-registry')
	if m.is_installed(lsp) then
		return
	end

	m.get_package(lsp):install()
end

return function()
	for _, lsp in ipairs(lsps) do
		check_lsp(lsp)
	end
end
