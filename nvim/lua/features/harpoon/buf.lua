local LIST = 'buf'

local M = {}

M.add = function(idx)
	local h = require('harpoon')
	local l = h:list(LIST)

	local prv_item = l:get(idx)
	l:replace_at(idx)

	if prv_item == nil then
		return
	end

	l:add(prv_item)
end

M.select = function(i)
	local h = require('harpoon')
	h:list(LIST):select(i)
end

M.init = function() end

---@type HarpoonPartialConfigItem
M.config = {}

M.config.create_list_item = function(_, item)
	if item ~= nil then
		return item
	end

	local path = vim.api.nvim_buf_get_name(0)

	return { value = path }
end

M.config.select = function(item)
	if item == nil then
		return
	end

	local buf = vim.fn.bufnr(item.value)

	if buf == -1 then
		vim.cmd.edit(item.value)
		return
	end

	vim.api.nvim_set_current_buf(buf)
end

M.config.equals = function(a, b)
	return a and b and a.value == b.value
end

return M
