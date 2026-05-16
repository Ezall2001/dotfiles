local M = {}

M.recorder = function()
	return {
		startStopRecording = 'qq',
		playMacro = 'Q',
		switchSlot = 'qs',
		editMacro = 'qe',
		deleteAllMacros = 'qd',
		yankMacro = 'qy',
		addBreakPoint = '##',
	}
end

M.init = function() end

return M
