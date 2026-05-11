local is_requireable = require('utils.is_requireable')
local p = require('utils.path')

local default_opts = {
	require_init = false,
	recursive = false,
}

local require_all_in_dir

local handle_file = function(r_parent_path, name, cb, opts)
	if name == 'init.lua' and not opts.require_init then
		return
	end

	local root_name = vim.fn.fnamemodify(name, ':r')
	local module_path = vim.fs.joinpath(r_parent_path, root_name)
	local module = require(module_path)

	cb(module)
end

local handle_dir = function(r_parent_path, name, cb, opts)
	local r_dir_path = vim.fs.joinpath(r_parent_path, name)

	-- requires all files in dir
	if opts.recursive then
		require_all_in_dir(r_dir_path, cb, opts)
		return
	end

	-- require dir/init.lua if exists
	if is_requireable(r_dir_path) then
		local module = require(r_dir_path)
		cb(module)
	end
end

require_all_in_dir = function(require_dir_path, cb, opts)
	local abs_parent_path = p.get_abs_path(require_dir_path)
	local dir_items = vim.fn.readdir(abs_parent_path)

	local _opts = vim.tbl_deep_extend('force', default_opts, opts or {})

	for _, name in ipairs(dir_items) do
		local abs_path = vim.fs.joinpath(abs_parent_path, name)
		if vim.fn.isdirectory(abs_path) == 1 then
			handle_dir(require_dir_path, name, cb, _opts)
		else
			handle_file(require_dir_path, name, cb, _opts)
		end
	end
end

return require_all_in_dir
