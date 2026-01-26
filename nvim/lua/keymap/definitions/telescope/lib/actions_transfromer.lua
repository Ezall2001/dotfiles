local action_transformer = function(mappings, action)
	if type(action.key) == 'string' then
		mappings.i[action.key] = action.action
		mappings.n[action.key] = action.action
		return mappings
	end

	if action.key.i then
		mappings.i[action.key.i] = action.action
	end

	if action.key.n then
		mappings.n[action.key.n] = action.action
	end

	return mappings
end

local actions_transformer = function(actions)
	local mappings = { i = {}, n = {} }

	for _, action in ipairs(actions) do
		mappings = action_transformer(mappings, action)
	end

	return mappings
end

return actions_transformer
