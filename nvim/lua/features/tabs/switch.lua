local switch_tab = function(idx)
	local tab = vim.api.nvim_list_tabpages()[idx]
	if tab then
		vim.api.nvim_set_current_tabpage(tab)
	end
end

return switch_tab
