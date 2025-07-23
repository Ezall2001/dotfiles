local toggle_bg_transparency = function()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })

  if not normal_hl.bg then
    vim.cmd("hi Normal guibg=bg")
  else
    vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
  end
end

return toggle_bg_transparency
