local formatting = require("features.lsp.formatting")
local autocomplete = require("features.lsp.autocomplete")

return {
	init = function()
		formatting()
		autocomplete()

	end,
}
