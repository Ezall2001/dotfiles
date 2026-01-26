local i = require("constants").icons
local m = require("mason")

--- @type MasonSettings
local conf = {
	PATH = "prepend",
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
	registries = { "github:mason-org/mason-registry" },
	providers = {
		"mason.providers.registry-api",
		"mason.providers.client",
	},

	github = {
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},

	pip = {
		upgrade_pip = false,
		install_args = {},
	},

	ui = {
		check_outdated_packages_on_open = true,
		border = "rounded",
		backdrop = 0,
		width = 0.8,
		height = 0.9,
		icons = {
			package_installed = i.other.toggle.on(),
			package_pending = i.other.install(),
			package_uninstalled = i.other.toggle.off(),
		},

		keymaps = {
			toggle_package_expand = "<CR>",
			install_package = "i",
			update_package = "u",
			check_package_version = "c",
			check_outdated_packages = "C",
			update_all_packages = "U",
			uninstall_package = "x",
			cancel_installation = "<C-c>",
			apply_language_filter = "/",
			toggle_package_install_log = "<CR>",
			toggle_help = "?",
		},
	},
}

m.setup(conf)
