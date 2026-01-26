local i = require('constants').icons
local p = require('constants').path

-- plugins
vim.cmd('filetype plugin indent off')

-- terminal
vim.o.termguicolors = true
vim.o.termsync = true
vim.o.termbidi = false
--TODO: test
vim.o.termpastefilter = 'BS,HT,ESC,DEL'

-- ui themes
vim.o.background = 'dark'
-- TODO: more here

-- ui components
vim.o.modeline = false
vim.o.showmode = false
vim.o.showtabline = 0
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4
vim.o.signcolumn = 'yes:1'
vim.o.laststatus = 2
vim.o.shortmess = 'aoOsWIcCF'
vim.o.report = 50

-- mouse
vim.o.mouse = 'a'
vim.o.mousefocus = false
vim.o.mousehide = true
vim.o.mousemodel = 'popup_setpos'
vim.o.mousemoveevent = false
vim.o.mousescroll = 'ver:2,hor:1'
vim.o.mousetime = 500

-- cursor
vim.o.cursorcolumn = false
vim.o.cursorline = true
vim.o.cursorlineopt = 'both'
vim.o.cursorbind = false

-- editor
vim.o.list = true
vim.opt.listchars = {
	tab = '  ',
	trail = i.text.trail(),
	multispace = i.text.multispace(),
	extends = i.text.extends(),
	precedes = i.text.precedes(),
	conceal = i.text.conceal(),
}
vim.opt.fillchars = {
	fold = i.other.horizontal_seperator(),
	foldopen = i.text.fold_open(),
	foldclose = i.text.fold_closed(),
	foldsep = ' ',
	eob = ' ',
}
vim.o.conceallevel = 2
vim.o.concealcursor = 'c'
vim.o.allowrevins = false
vim.o.ambiwidth = 'single'
vim.o.confirm = true
-- vim.o.encoding = "utf-8"
-- vim.o.formatoptions = ""
-- TODO: finish font option discovery
vim.o.matchpairs = '(:),{:},[:],<:>'

-- session
vim.o.sessionoptions = 'folds,help,winpos'

-- shada
vim.o.shada = "%40,:100,@100,/100,'100,<50,f0,s100,h"
vim.o.shadafile = 'NONE' -- delay read after project load (handled by shada)

-- jumps
vim.o.jumpoptions = 'clean,view'

-- undo
vim.o.undolevels = 1000
vim.o.undofile = true
vim.o.undoreload = 10000

--[[
display
cpoptions
wildmode
wildmenu
suffixes
wildignore
--]]

-- folds
vim.o.foldcolumn = '1'
vim.o.foldmethod = 'manual' -- handled by origami
vim.o.foldnestmax = 10
vim.o.foldminlines = 3
vim.o.foldlevel = 5
vim.o.foldlevelstart = 5
vim.o.foldenable = true

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
vim.o.breakindentopt = ''
vim.o.preserveindent = false
vim.o.showbreak = i.text.wrap(true)
vim.o.textwidth = 0
vim.o.wrapmargin = 0
vim.o.wrapscan = true

-- scroll
vim.o.scrolloff = 7
vim.o.scrollback = 10000
vim.o.smoothscroll = true
vim.o.scrolljump = 1

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- cmd
vim.o.inccommand = 'nosplit'

-- buffers
vim.o.swapfile = false
vim.o.hidden = false
vim.o.buflisted = true
vim.o.bufhidden = 'delete'
vim.o.autoread = true
vim.o.autowrite = true
vim.o.autowriteall = true
vim.o.updatetime = 100
-- vim.o.backup = false
-- vim.o.writebackup = false
-- vim.o.directory = vim.fn.stdpath("data") .. "/swap//"
-- vim.o.backupdir = vim.fn.stdpath("data") .. "/backup//"

-- windows
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = 'cursor'
vim.o.equalalways = false
vim.o.winblend = 0
vim.o.winborder = 'none' -- leave it to ui plugins
vim.o.winheight = 1
vim.o.winminheight = 1
vim.o.winwidth = 1
vim.o.winminwidth = 1

-- completion
vim.o.completeopt = 'menu,menuone,noinsert,preinsert,popup'
vim.o.autocomplete = false
vim.o.autocompletedelay = 100
vim.o.autocompletetimeout = 80
-- TODO dig more into this

-- spelling
vim.o.spell = false
vim.o.spelllang = 'en'
vim.o.mkspellmem = '460000,2000,500'
vim.o.spellcapcheck = ''
-- vim.o.spellfile	=
vim.o.spelloptions = 'camel'
vim.o.spellsuggest = 'best'

--keybinds
vim.o.timeout = true
vim.o.timeoutlen = 500

-- other
vim.o.clipboard = ''
vim.o.autochdir = false

-- global vars
vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--- netrw
vim.g.loaded_netrw = 1 -- disables netrw file manager
vim.g.loaded_netrwPlugin = 1 -- disables netrw extra functionalities

-- unexplored
vim.o.warn = true
-- vim.o.hlsearch
-- vim.o.incsearch = true
-- vim.o.undofile

-- not considered
-- verbose, verbosefile
-- whichwrap
-- arabic, arabicshape
-- sidescroll, sidescrolloff
-- comment, commentstring (handled by treesitter-ctx plugin)
-- foldignore (set per filetype), foldexpr, foldmarker, foldtext, foldclose, foldopen (ufo problem)
-- statusline (handled by lualine)
-- statuscolumn (handled by statuscolumn)
-- shadafile
-- mouseshape
-- term
-- modelineexpr modelines
-- dictionary
-- directory

--[[
'backspace'	  'bs'	    how backspace works at start of line
'backup'	  'bk'	    keep backup file after overwriting a file
'backupcopy'	  'bkc'     make backup as a copy, don't rename the file
'backupdir'	  'bdir'    list of directories for the backup file
'backupext'	  'bex'     extension used for the backup file
'backupskip'	  'bsk'     no backup for files that match these patterns
'belloff'	  'bo'	    do not ring the bell for these reasons
'binary'	  'bin'     read/write/edit file in binary mode
'bomb'			    prepend a Byte Order Mark to the file
'breakat'	  'brk'     characters that may cause a line break
'breakindent'	  'bri'     wrapped line repeats indent
'breakindentopt'  'briopt'  settings for 'breakindent'
'browsedir'	  'bsdir'   which directory to start browsing in
'casemap'	  'cmp'     specifies how case of letters is changed
'cdhome'	  'cdh'	    change directory to the home directory by ":cd"
'cdpath'	  'cd'	    list of directories searched with ":cd"
'cedit'			    key used to open the command-line window
'charconvert'	  'ccv'     expression for character encoding conversion
'chistory'	  'chi'     maximum number of quickfix lists in history
'cindent'	  'cin'     do C program indenting
'cinkeys'	  'cink'    keys that trigger indent when 'cindent' is set
'cinoptions'	  'cino'    how to do indenting when 'cindent' is set
'cinscopedecls'	  'cinsd'   words that are recognized by 'cino-g'
'cinwords'	  'cinw'    words where 'si' and 'cin' add an indent
'cmdheight'	  'ch'	    number of lines to use for the command-line
'cmdwinheight'	  'cwh'     height of the command-line window
'colorcolumn'	  'cc'	    columns to highlight
'columns'	  'co'	    number of columns in the display
'complete'	  'cpt'     specify how Insert mode completion works
'completefunc'	  'cfu'     function to be used for Insert mode completion
'completeopt'	  'cot'     options for Insert mode completion
'completeslash'	  'csl'	    like 'shellslash' for completion
'completetimeout' 'cto'     initial decay timeout for CTRL-N and CTRL-P
'copyindent'	  'ci'	    make 'autoindent' use existing indent structure
'cpoptions'	  'cpo'     flags for Vi-compatible behavior
'debug'			    set to "msg" to see all error messages
'define'	  'def'     pattern to be used to find a macro definition
'delcombine'	  'deco'    delete combining characters on their own
'diff'			    use diff mode for the current window
'diffanchors'	  'dia'     list of {address} to force anchoring of a diff
'diffexpr'	  'dex'     expression used to obtain a diff file
'diffopt'	  'dip'     options for using diff mode
'digraph'	  'dg'	    enable the entering of digraphs in Insert mode
'display'	  'dy'	    list of flags for how to display text
'eadirection'	  'ead'     in which direction 'equalalways' works
'encoding'	  'enc'     encoding used internally
'endoffile'	  'eof'     write CTRL-Z at end of the file
'endofline'	  'eol'     write <EOL> for last line in file
'equalalways'	  'ea'	    windows are automatically made the same size
'equalprg'	  'ep'	    external program to use for "=" command
'errorbells'	  'eb'	    ring the bell for error messages
'errorfile'	  'ef'	    name of the errorfile for the QuickFix mode
'errorformat'	  'efm'     description of the lines in the error file
'eventignore'	  'ei'	    autocommand events that are ignored
'eventignorewin'  'eiw'     autocommand events that are ignored in a window
'expandtab'	  'et'	    use spaces when <Tab> is inserted
'exrc'		  'ex'	    read init files in the current directory
'fileencoding'	  'fenc'    file encoding for multibyte text
'fileencodings'   'fencs'   automatically detected character encodings
'fileformat'	  'ff'	    file format used for file I/O
'fileformats'	  'ffs'     automatically detected values for 'fileformat'
'fileignorecase'  'fic'     ignore case when using file names
'filetype'	  'ft'	    type of file, used for autocommands
'findfunc'	  'ffu'     function to be called for the |:find| command
'fixendofline'	  'fixeol'  make sure last line in file has <EOL>
'formatexpr'	  'fex'     expression used with "gq" command
'formatlistpat'   'flp'     pattern used to recognize a list header
'formatoptions'   'fo'	    how automatic formatting is to be done
'formatprg'	  'fp'	    name of external program used with "gq" command
'fsync'		  'fs'	    whether to invoke fsync() after file write
'gdefault'	  'gd'	    the ":substitute" flag 'g' is default on
'grepformat'	  'gfm'     format of 'grepprg' output
'grepprg'	  'gp'	    program to use for ":grep"
'guicursor'	  'gcr'     GUI: settings for cursor shape and blinking
'guifont'	  'gfn'     GUI: Name(s) of font(s) to be used
'guifontwide'	  'gfw'     list of font names for double-wide characters
'guioptions'	  'go'	    GUI: Which components and options are used
'guitablabel'	  'gtl'     GUI: custom label for a tab page
'guitabtooltip'   'gtt'     GUI: custom tooltip for a tab page
'helpfile'	  'hf'	    full path name of the main help file
'helpheight'	  'hh'	    minimum height of a new help window
'helplang'	  'hlg'     preferred help languages
'history'	  'hi'	    number of command-lines that are remembered
'hlsearch'	  'hls'     highlight matches with last search pattern
'icon'			    let Vim set the text of the window icon
'iconstring'		    string to use for the Vim icon text
'ignorecase'	  'ic'	    ignore case in search patterns
'imcmdline'	  'imc'     use IM when starting to edit a command line
'imdisable'	  'imd'     do not use the IM in any mode
'iminsert'	  'imi'     use :lmap or IM in Insert mode
'imsearch'	  'ims'     use :lmap or IM when typing a search pattern
'include'	  'inc'     pattern to be used to find an include file
'includeexpr'	  'inex'    expression used to process an include line
'incsearch'	  'is'	    highlight match while typing search pattern
'indentexpr'	  'inde'    expression used to obtain the indent of a line
'indentkeys'	  'indk'    keys that trigger indenting with 'indentexpr'
'infercase'	  'inf'     adjust case of match for keyword completion
'isfname'	  'isf'     characters included in file names and pathnames
'isident'	  'isi'     characters included in identifiers
'iskeyword'	  'isk'     characters included in keywords
'isprint'	  'isp'     printable characters
'joinspaces'	  'js'	    two spaces after a period with a join command
'keymap'	  'kmp'     name of a keyboard mapping
'keymodel'	  'km'	    enable starting/stopping selection with keys
'keywordprg'	  'kp'	    program to use for the "K" command
'langmap'	  'lmap'    alphabetic characters for other language mode
'langmenu'	  'lm'	    language to be used for the menus
'langremap'	  'lrm'	    do apply 'langmap' to mapped characters
'laststatus'	  'ls'	    tells when last window has status lines
'lazyredraw'	  'lz'	    don't redraw while executing macros
'lhistory'	  'lhi'	    maximum number of location lists in history
'linebreak'	  'lbr'     wrap long lines at a blank
'lines'			    number of lines in the display
'linespace'	  'lsp'     number of pixel lines to use between characters
'lisp'			    automatic indenting for Lisp
'lispoptions'	  'lop'     changes how Lisp indenting is done
'lispwords'	  'lw'	    words that change how lisp indenting works
'loadplugins'	  'lpl'     load plugin scripts when starting up
'magic'			    changes special characters in search patterns
'makeef'	  'mef'     name of the errorfile for ":make"
'makeencoding'	  'menc'    encoding of external make/grep commands
'makeprg'	  'mp'	    program to use for the ":make" command
'matchpairs'	  'mps'     pairs of characters that "%" can match
'matchtime'	  'mat'     tenths of a second to show matching paren
'maxcombine'	  'mco'     maximum nr of combining characters displayed
'maxfuncdepth'	  'mfd'     maximum recursive depth for user functions
'maxmapdepth'	  'mmd'     maximum recursive depth for mapping
'maxmempattern'   'mmp'     maximum memory (in Kbyte) used for pattern search
'menuitems'	  'mis'     maximum number of items in a menu
'modifiable'	  'ma'	    changes to the text are not possible
'modified'	  'mod'     buffer has been modified
'more'			    pause listings when the whole screen is filled
'nrformats'	  'nf'	    number formats recognized for CTRL-A command
'omnifunc'	  'ofu'     function for filetype-specific completion
'opendevice'	  'odev'    allow reading/writing devices on MS-Windows
'operatorfunc'	  'opfunc'  function to be called for |g@| operator
'packpath'	  'pp'      list of directories used for packages
'paragraphs'	  'para'    nroff macros that separate paragraphs
'patchexpr'	  'pex'     expression used to patch a file
'patchmode'	  'pm'	    keep the oldest version of a file
'path'		  'pa'	    list of directories searched with "gf" et.al.
'preserveindent'  'pi'	    preserve the indent structure when reindenting
'previewheight'   'pvh'     height of the preview window
'previewwindow'   'pvw'     identifies the preview window
'pumheight'	  'ph'	    maximum number of items to show in the popup menu
'pumwidth'	  'pw'	    minimum width of the popup menu
'pyxversion'	  'pyx'	    Python version used for pyx* commands
'quoteescape'	  'qe'	    escape characters used in a string
'readonly'	  'ro'	    disallow writing the buffer
'redrawtime'	  'rdt'     timeout for 'hlsearch' and |:match| highlighting
'regexpengine'	  're'	    default regexp engine to use
'relativenumber'  'rnu'	    show relative line number in front of each line
'report'		    threshold for reporting nr. of lines changed
'revins'	  'ri'	    inserting characters will work backwards
'rightleft'	  'rl'	    window is right-to-left oriented
'rightleftcmd'	  'rlc'     commands for which editing works right-to-left
'ruler'		  'ru'	    show cursor line and column in the status line
'rulerformat'	  'ruf'     custom format for the ruler
'runtimepath'	  'rtp'     list of directories used for runtime files
'scroll'	  'scr'     lines to scroll with CTRL-U and CTRL-D
'scrollbind'	  'scb'     scroll in window as other windows scroll
'scrollopt'	  'sbo'     how 'scrollbind' should behave
'sections'	  'sect'    nroff macros that separate sections
'secure'		    secure mode for reading .vimrc in current dir
'selection'	  'sel'     what type of selection to use
'selectmode'	  'slm'     when to use Select mode instead of Visual mode
'sessionoptions'  'ssop'    options for |:mksession|
'shada'		  'sd'	    use |shada| file upon startup and exiting
'shell'		  'sh'	    name of shell to use for external commands
'shellcmdflag'	  'shcf'    flag to shell to execute one command
'shellpipe'	  'sp'	    string to put output of ":make" in error file
'shellquote'	  'shq'     quote character(s) for around shell command
'shellredir'	  'srr'     string to put output of filter in a temp file
'shellslash'	  'ssl'     use forward slash for shell file names
'shelltemp'	  'stmp'    whether to use a temp file for shell commands
'shellxescape'	  'sxe'     characters to escape when 'shellxquote' is (
'shellxquote'	  'sxq'     like 'shellquote', but include redirection
'shiftround'	  'sr'	    round indent to multiple of shiftwidth
'shiftwidth'	  'sw'	    number of spaces to use for (auto)indent step
'showbreak'	  'sbr'     string to use at the start of wrapped lines
'showcmd'	  'sc'	    show (partial) command somewhere
'showcmdloc'	  'sloc'    where to show (partial) command
'showfulltag'	  'sft'     show full tag pattern when completing tag
'showmatch'	  'sm'	    briefly jump to matching bracket if insert one
'signcolumn'	  'scl'	    when and how to display the sign column
'smartcase'	  'scs'     no ignore case when pattern has uppercase
'smartindent'	  'si'	    smart autoindenting for C programs
'smarttab'	  'sta'     <Tab> in leading whitespace indents by 'shiftwidth'
'smoothscroll'	  'sms'     scroll by screen lines when 'wrap' is set
'softtabstop'	  'sts'     number of columns between two soft tab stops
'startofline'	  'sol'     commands move cursor to first non-blank in line
'suffixes'	  'su'	    suffixes that are ignored with multiple match
'suffixesadd'	  'sua'     suffixes added when searching for a file
'swapfile'	  'swf'     whether to use a swapfile for a buffer
'switchbuf'	  'swb'     sets behavior when switching to another buffer
'synmaxcol'	  'smc'     maximum column to find syntax items
'syntax'	  'syn'     syntax to be loaded for current buffer
'tabclose'	  'tcl'     which tab page to focus when closing a tab
'tabline'	  'tal'     custom format for the console tab pages line
'tabpagemax'	  'tpm'     maximum number of tab pages for |-p| and "tab all"
'tabstop'	  'ts'	    number of columns between two tab stops
'tagbsearch'	  'tbs'     use binary searching in tags files
'tagcase'	  'tc'      how to handle case when searching in tags files
'tagfunc'	  'tfu'	    function to get list of tag matches
'taglength'	  'tl'	    number of significant characters for a tag
'tagrelative'	  'tr'	    file names in tag file are relative
'tags'		  'tag'     list of file names used by the tag command
'tagstack'	  'tgst'    push tags onto the tag stack
'textwidth'	  'tw'	    maximum width of text that is being inserted
'thesaurus'	  'tsr'     list of thesaurus files for keyword completion
'thesaurusfunc'	  'tsrfu'   function to be used for thesaurus completion
'tildeop'	  'top'     tilde command "~" behaves like an operator
'title'			    let Vim set the title of the window
'titlelen'		    percentage of 'columns' used for window title
'titleold'		    old title, restored when exiting
'titlestring'		    string to use for the Vim window title
'ttimeout'		    time out on mappings
'ttimeoutlen'	  'ttm'     time out time for key codes in milliseconds
'ttytype'	  'tty'     alias for 'term'
'undodir'	  'udir'    where to store undo files
'undofile'	  'udf'	    save undo information in a file
'undolevels'	  'ul'	    maximum number of changes that can be undone
'undoreload'	  'ur'	    max nr of lines to save for undo on a buffer reload
'updatecount'	  'uc'	    after this many characters flush swap file
'varsofttabstop'  'vsts'    a list of number of columns between soft tab stops
'vartabstop'	  'vts'	    a list of number of columns between tab stops
'verbose'	  'vbs'     give informative messages
'verbosefile'	  'vfile'   file to write messages in
'viewdir'	  'vdir'    directory where to store files with :mkview
'viewoptions'	  'vop'     specifies what to save for :mkview
'virtualedit'	  've'	    when to use virtual editing
'visualbell'	  'vb'	    use visual bell instead of beeping
'warn'			    warn for shell command when buffer was changed
'wildchar'	  'wc'	    command-line character for wildcard expansion
'wildcharm'	  'wcm'     like 'wildchar' but also works when mapped
'wildignore'	  'wig'     files matching these patterns are not completed
'wildignorecase'  'wic'     ignore case when completing file names
'wildmenu'	  'wmnu'    use menu for command line completion
'wildmode'	  'wim'     mode for 'wildchar' command-line expansion
'wildoptions'	  'wop'     specifies how command line completion is done
'winaltkeys'	  'wak'     when the windows system handles ALT keys
'window'	  'wi'	    nr of lines to scroll for CTRL-F and CTRL-B
'winfixbuf'	  'wfb'     keep window focused on a single buffer
'winfixheight'	  'wfh'     keep window height when opening/closing windows
'winfixwidth'	  'wfw'     keep window width when opening/closing windows
'winheight'	  'wh'	    minimum number of lines for the current window
'winhighlight'	  'winhl'   window-local highlighting
'winminheight'	  'wmh'     minimum number of lines for any window
'winminwidth'	  'wmw'     minimal number of columns for any window
'winwidth'	  'wiw'     minimal number of columns for current window
'write'			    writing to a file is allowed
'writeany'	  'wa'	    write to file with no need for "!" override
'writebackup'	  'wb'	    make a backup before overwriting a file
'writedelay'	  'wd'	    delay this many msec for each char (for debug)
]]
--
