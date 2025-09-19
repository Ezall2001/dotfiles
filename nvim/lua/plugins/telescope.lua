local ts_config = {
	defaults = {
		sorting_strategy = "descending",
		selection_strategy = "follow",
		mappings = {},
	},

	extensions = {

		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
}

local config = function()
	local telescope = require("telescope")

	telescope.setup(ts_config)

	telescope.load_extension("fzf")
end

local spec = {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	config = config,
	dependencies = { "nvim-lua/plenary.nvim" },
}

return spec
