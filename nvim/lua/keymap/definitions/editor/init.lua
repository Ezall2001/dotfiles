local r = require('utils.require_all_in_dir')

local cb = function(mod)
	mod.init()
end

local M = {}

M.init = function()
	local r_path = vim.fs.joinpath('keymap', 'definitions', 'editor')
	r(r_path, cb)
end

M.mini_indent = require('keymap.definitions.editor.indentation').mini_indentation
M.mini_splitjoin = require('keymap.definitions.editor.editing').mini_splitjoin
M.mini_move = require('keymap.definitions.editor.editing').mini_move
M.mini_comment = require('keymap.definitions.editor.comment').mini_comment
M.mini_jump = require('keymap.definitions.editor.motion').mini_jump
M.mini_surround = require('keymap.definitions.editor.editing').mini_surround
M.mini_pairs = require('keymap.definitions.editor.editing').mini_pairs
M.mini_ai = require('keymap.definitions.editor.motion').mini_ai
M.yanky_picker = require('keymap.definitions.editor.yank').yanky_telescope_picker

return M
