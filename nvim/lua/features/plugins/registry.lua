local registry = {}

local add = function(name)
	registry[name] = true
end

local is_registred = function(name)
	return registry[name] == true
end

return {
	add = add,
	is_registred = is_registred,
}
