local p = require("features.plugins.init")

local config = function()
	p.register_plugin("obsession")
end

local spec = {
	"tpope/vim-obsession",
	config = config,
}

return spec
