local handle_project = function(project)
	require("project_config.lib.override_filetypes")(project)
end

return handle_project
