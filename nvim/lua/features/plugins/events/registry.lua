local registry = {}

local add = function(name)
	registry[name] = true
end

local is_registred = function(names)
	return vim.iter(names):all(function(n)
		return registry[n]
	end)
end

return {
	add = add,
	is_registred = is_registred,
	r_test = registry,
}
