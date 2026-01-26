local c = require('constants')
local is_requireable = require('utils.is_requireable')
local p = require('features.plugins')
local u = require('utils.callback')

local get_r_config_path = function(group_name, spec)
	return vim.fs.joinpath(c.path.r_plugin_config_root_dir, group_name, spec.name)
end

local pre_config = function(group, spec)
	local r_config_path = get_r_config_path(group, spec)
	local r_pre_config_path = vim.fs.joinpath(r_config_path, 'pre_config')

	if is_requireable(r_pre_config_path) then
		require(r_pre_config_path)
	end
end

local build = function(group, spec)
	local r_config_path = get_r_config_path(group, spec)
	local r_build_path = vim.fs.joinpath(r_config_path, 'build')

	if is_requireable(r_build_path) then
		require(r_build_path)()
	end
end

local config = function(group, spec)
	local r_config_path = get_r_config_path(group, spec)

	if is_requireable(r_config_path) then
		require(r_config_path)
	end

	p.register_plugin(spec.name)
end

local derive_spec = function(group, spec)
	local extra = {
		config = u.mkcb(config, group, spec),
		build = u.mkcb(build, group, spec),
	}

	local derived = vim.tbl_deep_extend('force', spec, extra)
	return derived
end

local derive = function(specs)
	local _specs = {}

	for group_name, group_specs in pairs(specs) do
		for _, spec in ipairs(group_specs) do
			pre_config(group_name, spec)
			local derived = derive_spec(group_name, spec)
			table.insert(_specs, derived)
		end
	end

	return _specs
end

return derive
