---@diagnostic disable: param-type-mismatch
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local sn = ls.snippet_node
local isn = ls.indent_snippet_node

local init = function()
	local main_fn = s({
		trig = 'main',
		name = 'main function',
	}, {
		t('def main ['),
		i(1),
		t({
			'] {',
			'',
		}),
		isn(2, t({ '\ttest', 'test2', 'test3' }), '$PARENT_INDENT\t'),
		t({ '', '}' }),
		c(3, {
			t('hello'),
			t('hi'),
			t('hello hi'),
		}),
	})

	ls.add_snippets('nu', { main_fn })
end

return init
