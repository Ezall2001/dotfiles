---@diagnostic disable: missing-parameter

local M = {}

M.next = function(jump)
	local t = require('trouble')
	t.next()

	if jump then
		t.jump()
	end
end

M.prev = function(jump)
	local t = require('trouble')
	t.prev()

	if jump then
		t.jump()
	end
end

M.next_group = function(jump)
	local t = require('trouble')

	local view = t.open()
	if view == nil then
		return
	end

	local items = view:flatten()

	local cur = view:at()
	local cur_file = cur.item and cur.item.filename

	local curr_idx = nil
	for i, item in ipairs(items) do
		if item == cur.item then
			curr_idx = i
			break
		end
	end

	if not curr_idx then
		M.next(jump)
		return
	end

	for i = curr_idx + 1, #items do
		local item = items[i]

		if item.filename ~= cur_file then
			view:move({ idx = i, jump = true })
			break
		end
	end

	if jump then
		t.jump()
	end
end

M.prev_group = function(jump)
	local t = require('trouble')

	local view = t.open()
	if view == nil then
		return
	end

	local items = view:flatten()

	local cur = view:at()
	local cur_file = cur.item and cur.item.filename

	local curr_idx = nil
	for i, item in ipairs(items) do
		if item == cur.item then
			curr_idx = i
			break
		end
	end

	if not curr_idx then
		M.prev(jump)
		return
	end

	for i = curr_idx - 1, 1, -1 do
		local item = items[i]

		if item.filename ~= cur_file then
			view:move({ idx = i, jump = true })
			break
		end
	end

	if jump then
		t.jump()
	end
end

return M
