local M = {}

M.recorder = function()
	return {
		startStopRecording = 'q',
		playMacro = 'Q',
		switchSlot = '<C-q>',
		editMacro = 'cq',
		deleteAllMacros = 'dq',
		yankMacro = 'yq',
		addBreakPoint = '##',
	}
end

M.init = function() end

return M
