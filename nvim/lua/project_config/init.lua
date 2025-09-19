local require_all_in_dir = require("utils.require_all_in_dir")
local handle_project = require("project_config.lib")
local require_projects_path = vim.fs.joinpath("lua", "project_config", "definitions")

require_all_in_dir(require_projects_path, function(module)
	handle_project(module)
end)
