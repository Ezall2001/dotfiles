local get_start_end = function(dir, curr_jump_idx, jumps)
	local s, e

	if dir == 1 then
		s = curr_jump_idx + 1
		e = #jumps
	else
		s = curr_jump_idx - 1
		e = 1
	end

	return s, e
end

local get_jump = function(s, e, type, dir, jumps)
	local current_buf = vim.fn.bufnr()

	for i = s, e, dir do
		local j = jumps[i]

		local buf_cond = type == 'buffer' and current_buf ~= j.bufnr
		local local_cond = type == 'local' and current_buf == j.bufnr

		if buf_cond or local_cond then
			return i
		end
	end

	return nil
end

local get_command = function(dir, curr_idx, j_idx)
	local keymap, count

	if dir == 1 then
		keymap = '<C-i>'
		count = j_idx - curr_idx
	else
		keymap = '<C-o>'
		count = curr_idx - j_idx
	end

	return count .. keymap
end

local jump = function(type, dir)
	local jumps, curr_idx = unpack(vim.fn.getjumplist())
	curr_idx = curr_idx + 1
	local s, e = get_start_end(dir, curr_idx, jumps)

	if s > #jumps or s < 1 then
		return
	end

	local j_idx = get_jump(s, e, type, dir, jumps)

	if j_idx == nil then
		return
	end

	local command = get_command(dir, curr_idx, j_idx)

	local command_r = vim.api.nvim_replace_termcodes(command, true, false, true)
	vim.api.nvim_feedkeys(command_r, 'n', false)
end

return jump
