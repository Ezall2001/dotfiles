local defaults = {
	RGB = true,
	RRGGBB = true,
	names = true,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	css = false,
	css_fn = false,
	mode = "background",
}

local config = function()
	require("colorizer").setup({
		"*",
	}, defaults)
end

local spec = {
	"norcalli/nvim-colorizer.lua",
	config = config,
}

return spec
