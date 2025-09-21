local handle_project = function(project)
	require("per_project_config.lib.override_filetypes")(project)
end

return handle_project
