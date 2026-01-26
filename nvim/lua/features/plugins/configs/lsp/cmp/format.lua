local i = require('constants.icons')

local kind_icons = {
	Text = i.programming.text(),
	Unit = i.programming.unit(),
	Color = i.programming.color(),
	Reference = i.programming.reference(),
	Keyword = i.programming.keyword(),
	Value = i.programming.value(),
	Snippet = i.programming.snippet(),
	Folder = i.file.dir_closed(),
	Variable = i.programming.variable(),
	Operator = i.programming.operator(),
	File = i.file.file(),
	Class = i.programming.class(),
	Struct = i.programming.interface(),
	Enum = i.programming.enum(),
	Function = i.programming['function'](),
	EnumMember = i.programming.enum(),
	Constant = i.programming.constant(),
	Event = i.programming.event(),
	Method = i.programming['function'](),
	Interface = i.programming.interface(),
	Module = i.programming.module(),
	Constructor = i.programming.constructor(),
	Field = i.programming.field(),
	TypeParameter = i.programming.type(),
	Property = i.programming.field(),
	Array = i.programming.array(),
	Boolean = i.programming.boolean(),
	Key = i.programming.key(),
	Namespace = i.programming.namespace(),
	Null = i.programming.null(),
	Number = i.programming.number(),
	Object = i.programming.object(),
	Package = i.programming.module(),
	String = i.programming.string(),
}

local format = function(_, vim_item)
	vim_item.kind = kind_icons[vim_item.kind]
	return vim_item
end

local formatting = {
	expandable_indicator = false,
	fields = { 'kind', 'abbr', 'menu' },
	format = format,
}

return formatting
