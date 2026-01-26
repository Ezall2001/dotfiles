local i = require("constants").icons

vim.g.undotree_RelativeTimestamp = 1
vim.g.undotree_WindowLayout = 1
vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_DiffpaneHeight = 20
vim.g.undotree_SplitWidth = 40
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_HighlightChangedText = 1
vim.g.undotree_HelpLine = 1
vim.g.undotree_CursorLine = 1
vim.g.undotree_StatusLine = 0

vim.g.undotree_SignAdded = i.git.added()
vim.g.undotree_SignModified = i.git.modified()
vim.g.undotree_SignDeleted = i.git.removed()
vim.g.undotree_SignDeletedEnd = i.git.removed()
