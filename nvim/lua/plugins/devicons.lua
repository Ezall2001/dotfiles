local opts = {
	color_icons = true,
	default = true,
	strict = true,
	variant = "dark",
}

local config = function()
	require("nvim-web-devicons").setup(opts)
end

local spec = { "nvim-tree/nvim-web-devicons", config = config }

return spec
