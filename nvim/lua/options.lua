-- ui themes
vim.o.termguicolors = true -- needed for notify.nvim
vim.opt.background = "dark"
-- TODO: more here

-- ui components
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes:1"
vim.o.foldcolumn = "0"
vim.o.laststatus = 2

-- mouse
vim.o.mouse = "a"
vim.o.mousefocus = false
vim.o.mousehide = true
vim.o.mousemodel = "popup_setpos"
vim.o.mousemoveevent = false
vim.o.mousescroll = "ver:2,hor:1"
vim.o.mousetime = 500

-- cursor
vim.o.cursorcolumn = false
vim.o.cursorline = true
vim.o.cursorlineopt = "both"
vim.o.cursorbind = false

-- editor
vim.o.modeline = false
vim.o.list = true
vim.o.listchars = "tab:┃ ,trail:·,multispace:···,extends:,precedes:,conceal:󰇘"
vim.o.conceallevel = 2
vim.o.concealcursor = "c"
-- vim.o.encoding = "utf-8"
-- vim.o.formatoptions = ""
-- TODO: finish font option discovery

--[[
display
cpoptions
wildmode
wildmenu
suffixes
wildignore
--]]

-- folds
--vim.o.foldclose = "all"
-- TODO: MORE HERE

-- indent
vim.o.smarttab = true
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true

-- wrap
vim.o.wrap = true
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.breakindentopt = ""
vim.o.preserveindent = false
vim.o.showbreak = "↪ "
vim.o.textwidth = 0
vim.o.wrapmargin = 0

-- scroll
vim.o.scrolloff = 7
vim.o.scrollback = 10000
vim.o.smoothscroll = true
vim.o.scrolljump = 1

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- buffers
vim.o.swapfile = false
vim.o.hidden = true
vim.o.buflisted = true
vim.o.autowrite = true
vim.o.autowriteall = true
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.directory = vim.fn.stdpath("data") .. "/swap//"
-- vim.o.backupdir = vim.fn.stdpath("data") .. "/backup//"
-- vim.o.undodir = vim.fn.stdpath("data") .. "/undo//"
-- vim.o.undofile = true
-- vim.o.undolevels = 1000  -- max number of undo steps
-- vim.o.undoreload = 10000 -- lines to save for undo when reloading

-- windows
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "cursor"
vim.o.equalalways = false
vim.o.winblend = 0
vim.o.winborder = "none" -- leave it to ui plugins
vim.o.winheight = 1
vim.o.winminheight = 1
vim.o.winwidth = 1
vim.o.winminwidth = 1

-- completion
vim.o.completeopt = "menu,menuone,noinsert,preinsert,popup"
-- TODO dig more into this

-- spelling
-- vim.o.spell = true
-- vim.o.spelllang = "en_us"

-- other
vim.o.clipboard = "unnamedplus"

-- TODO: refactor this
-- filetype
vim.filetype.add({
	extension = {
		kdl = "kdl",
	},
})

-- TODO: refactor this
-- help
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function(arg)
		vim.bo[arg.buf].bufhidden = "wipe"
	end,
})

-- global vars
vim.g.have_nerd_font = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- vim-tmux-navigator vars
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_save_on_switch = 2
vim.g.tmux_navigator_no_wrap = 1

--- netrw
vim.g.loaded_netrw = 1       -- disables netrw file manager
vim.g.loaded_netrwPlugin = 1 -- disables netrw extra functionalities

-- unexplored
-- vim.o.incsearch = true
-- vim.o.undofile
