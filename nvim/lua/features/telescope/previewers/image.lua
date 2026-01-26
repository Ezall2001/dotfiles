local image_cache = {}

local function render_image(filepath, max_width, callback)
	local key = filepath .. '|w' .. max_width

	if image_cache[key] then
		callback(image_cache[key])
		return nil
	end

	vim.fn.jobstart({
		'chafa',
		'--size',
		tostring(max_width) .. 'x',
		filepath,
	}, {
		stdout_buffered = true,
		on_stdout = function(_, data, _)
			if not data then
				return
			end
			local output = table.concat(data, '\r\n')
			image_cache[key] = output
			callback(output)
		end,
	})
end

local is_image = function(filepath)
	local image_extensions = { 'png', 'jpg', 'jpeg', 'webp', 'svg' }
	local ext = vim.fn.fnamemodify(filepath, ':e'):lower()
	return vim.tbl_contains(image_extensions, ext)
end

local image_previewer = function(filepath, bufnr)
	local is_image_ = is_image(filepath)

	if not is_image_ then
		return false
	end

	local term = vim.api.nvim_open_term(bufnr, {})

	vim.schedule(function()
		local winid = vim.fn.bufwinid(bufnr)
		if winid == -1 then
			winid = 0
		end

		local width = vim.api.nvim_win_get_width(winid) - 2
		if width < 10 then
			width = 40
		end

		render_image(filepath, width, function(output)
			vim.api.nvim_chan_send(term, output)
		end)
	end)

	return true
end

return image_previewer
