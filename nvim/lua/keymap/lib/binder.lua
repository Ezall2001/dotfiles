local bind_keymap = function(keymap)
  for _, map in ipairs(keymap) do
    vim.keymap.set(map[1],map[2],map[3],map[4])
  end
end


return bind_keymap
