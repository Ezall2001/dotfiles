local builtin = require("telescope.builtin")

local keymap = {
  { "n", "<leader>ff", builtin.find_files, { desc = "telescope find files" } },
  { "n", "<leader>fh", builtin.help_tags,  { desc = "telescope find files" } },
  { "n", "<leader>fg", builtin.live_grep,  { desc = "telescope live grep" } }
}

return keymap
