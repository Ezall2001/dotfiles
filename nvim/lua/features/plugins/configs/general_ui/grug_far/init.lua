local engines = require('features.plugins.configs.general_ui.grug_far.engines')
local g = require('grug-far')
local icons = require('features.plugins.configs.general_ui.grug_far.icons')
local keymaps = require('keymap.definitions.grug').keymap
local i = require('constants.icons')
local state = require('features.grug_far').state

local conf = {
	debounceMs = 500,
	minSearchChars = 2,
	maxSearchMatches = 2000,
	maxLineLength = 1000,
	maxWorkers = 4,
	engine = 'ripgrep',
	breakindentopt = '',
	windowCreationCommand = 'tab split',
	engines = engines,
	enabledEngines = { 'ripgrep', 'astgrep', 'astgrep-rules' },
	normalModeSearch = false,
	disableBufferLineNumbers = true,
	startInInsertMode = true,
	startCursorRow = 1,
	visualSelectionUsage = 'prefill-search',
	staticTitle = nil,
	keymaps = keymaps,
	icons = icons,
	resultsSeparatorLineChar = i.other.horizontal_seperator(),
	replacementInterpreter = 'default',
	enabledReplacementInterpreters = { 'default', 'lua', 'vimscript' },
	wrap = true,
	showStatusIcon = true,
	showEngineInfo = true,
	showStatusInfo = true,
	transient = true,
	maxSearchCharsInTitles = 10,
	inputsHighlight = true,
	resultsHighlight = true,
	reportDuration = true,
	smartInputHandling = true,
	showCompactInputs = true,
	showInputsTopPadding = false,
	showInputsBottomPadding = false,
	backspaceEol = true,

	folding = {
		enabled = true,
		foldlevel = 1,
		foldcolumn = '1',
		include_file_path = false,
	},
	openTargetWindow = {
		exclude = {},
		preferredLocation = 'right',
		useScratchBuffer = true,
	},
	resultLocation = {
		showNumberLabel = true,
		numberLabelPosition = 'eol',
		numberLabelFormat = '  [%d]',
	},
	helpLine = {
		enabled = false,
	},
	prefills = {
		search = nil,
		replacement = nil,
		filesFilter = nil,
		flags = nil,
		paths = nil,
	},
	hooks = {
		on_before_edit_file = nil,
	},
	history = {
		maxHistoryLines = 10000,
		historyDir = state.get_dir(),
		autoSave = {
			enabled = true,
			onReplace = true,
			onSyncAll = true,
			onBufDelete = true,
		},
	},
}

g.setup(conf)
