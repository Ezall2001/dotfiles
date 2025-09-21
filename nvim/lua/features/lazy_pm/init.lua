require("features.lazy_pm.bootstrap")

local opts = {
	defaults = {
		lazy = false,
		version = false,
	},
	spec = {
		{ import = "plugins" },
	},
	local_spec = true,
	concurrency = 4,
	git = {
		log = { "-5" },
		timeout = 300,
		filter = true,
		throttle = {
			enabled = false,
		},
		cooldown = 300,
	},
	install = {
		missing = true,
	},
	ui = {
		size = { width = 0.8, height = 0.9 },
		wrap = true,
		border = "none",
		backdrop = 0,
		pills = true,
		browser = nil,
	},
	headless = {
		process = true,
		log = true,
		task = true,
		colors = true,
	},
	diff = {
		cmd = "diffview.nvim",
	},
	checker = {
		enabled = true,
		concurency = 1,
		notify = false,
		frequency = 60 * 60, -- 1h
		check_pinned = false,
	},

	change_detection = {
		enabled = true,
		notify = false,
	},
	readme = {
		enabled = true,
		skip_if_doc_exists = true,
	},
	profiling = {
		loader = false,
		require = false,
	},
}

return {
	init = function()
		require("lazy").setup(opts)
	end
}
