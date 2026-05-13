return function(c)
	return {
		-- treesitter
		['@boolean'] = { fg = c.bright_red, italic = true },
		['@number'] = { fg = c.bright_red, italic = true },
		['@string'] = { fg = c.orange, italic = true },

		--TODO: make minijump have the same as search
		-- mini
		MiniIndentscopeSymbol = { fg = c.bright_cyan },
		MiniJump = { fg = c.red, bg = c.visual, bold = true, underline = true },
		MiniTrailspace = { fg = c.fg, bg = c.visual },

		-- standard
		Directory = { fg = c.purple },
		Search = {}, --TODO: finish

		-- notify
		NotifyERRORBorder = { link = 'DiagnosticSignError' },
		NotifyERRORTitle = { link = 'DiagnosticError' },
		NotifyERRORIcon = { link = 'DiagnosticSignError' },
		NotifyERRORBody = { link = 'Normal' },

		NotifyWARNBorder = { link = 'DiagnosticSignWarn' },
		NotifyWARNTitle = { link = 'DiagnosticWarn' },
		NotifyWARNIcon = { link = 'DiagnosticSignWarn' },
		NotifyWARNBody = { link = 'Normal' },

		NotifyINFOBorder = { link = 'DiagnosticSignHint' },
		NotifyINFOTitle = { link = 'DiagnosticHint' },
		NotifyINFOIcon = { link = 'DiagnosticSignHint' },
		NotifyINFOBody = { link = 'Normal' },

		NotifyDEBUGBorder = { link = 'DiagnosticSignInfo' },
		NotifyDEBUGTitle = { link = 'DiagnosticInfo' },
		NotifyDEBUGIcon = { link = 'DiagnosticSignInfo' },
		NotifyDEBUGBody = { link = 'Normal' },

		NotifyTRACEBorder = { fg = c.purple },
		NotifyTRACETitle = { fg = c.bright_blue },
		NotifyTRACEIcon = { fg = c.purple },
		NotifyTRACEBody = { link = 'Normal' },

		-- Undotree
		UndotreeTimeStamp = { fg = c.green },
		UndotreeBranch = { fg = c.red },
		UndotreeNode = { fg = c.purple },
		UndotreeCurrent = { fg = c.cyan },
		UndotreeNodeCurrent = { fg = c.cyan },
		UndotreeHead = { fg = c.bright_blue, bg = c.selection },
		UndotreeFirstNode = { fg = c.red },
		UndotreeNext = { fg = c.bright_blue },
		UndotreeHelpKey = { fg = c.red, bold = true, italic = true },
		UndotreeHelpTitle = { fg = c.yellow, bg = c.selection },
		UndotreeHelp = { link = 'Comment' },
		UndotreeSeq = { link = 'Comment' },
		UndotreeSavedSmall = { link = 'Comment' },
		UndotreeSavedBig = { fg = c.bright_magenta, underline = true },

		-- Oil
		OilGitAdded = { fg = c.green },
		OilGitModified = { fg = c.orange },
		OilGitRenamed = { fg = c.bright_blue },
		OilGitDeleted = { fg = c.bright_red },
		OilGitCopied = { fg = c.bright_blue },
		OilGitConflict = { fg = c.yellow },
		OilGitUntracked = { fg = c.bright_cyan },
		OilGitIgnored = { fg = c.comment },

		-- diagnostics
		DiagnosticError = { fg = c.bright_red },
		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticVirtualTextError = { fg = c.bright_red },
		DiagnosticSignError = { fg = c.red },
		DiagnosticFloatingError = { fg = c.bright_red },

		DiagnosticWarn = { fg = c.orange },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.orange },
		DiagnosticVirtualTextWarn = { fg = c.orange },
		DiagnosticSignWarn = { fg = c.orange },
		DiagnosticFloatingWarn = { fg = c.orange },

		DiagnosticInfo = { fg = c.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.yellow },
		DiagnosticVirtualTextInfo = { fg = c.yellow },
		DiagnosticSignInfo = { fg = c.yellow },
		DiagnosticFloatingInfo = { fg = c.yellow },

		DiagnosticHint = { fg = c.cyan },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },
		DiagnosticVirtualTextHint = { fg = c.cyan },
		DiagnosticSignHint = { fg = c.cyan },
		DiagnosticFloatingHint = { fg = c.cyan },
	}
end

-- nvim-cmp
-- Telescope
-- Git Signs
-- Lualine
-- nvim-dap-ui
