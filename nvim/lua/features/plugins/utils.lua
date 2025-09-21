local create_plugin_event_name = function(name)
	local pattern = name .. "Registred"
	return pattern
end

return {
	create_plugin_event_name = create_plugin_event_name,
}
