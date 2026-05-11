local i = require('constants').icons

---@type trouble.Indent.symbols
local icons = {
	indent = {
		top = '│ ',
		middle = '├╴',
		last = '╰╴',
		fold_open = i.text.fold_open(true),
		fold_closed = i.text.fold_closed(true),
		ws = '  ',
	},
	folder_closed = i.file.dir_closed(),
	folder_open = i.file.dir_open(),
	kinds = {
		Array = i.programming.array(),
		Boolean = i.programming.boolean(),
		Class = i.programming.class(),
		Constant = i.programming.constant(),
		Constructor = i.programming.constructor(),
		Enum = i.programming.enum(),
		EnumMember = i.programming.enum(),
		Event = i.programming.event(),
		Field = i.programming.field(),
		File = i.file.file(),
		Function = i.programming['function'](),
		Interface = i.programming.interface(),
		Key = i.programming.key(),
		Method = i.programming['function'](),
		Module = i.programming.module(),
		Namespace = i.programming.namespace(),
		Null = i.programming.null(),
		Number = i.programming.number(),
		Object = i.programming.object(),
		Operator = i.programming.operator(),
		Package = i.programming.module(),
		Property = i.programming.field(),
		String = i.programming.string(),
		Struct = i.programming.interface(),
		TypeParameter = i.programming.type(),
		Variable = i.programming.variable(),
	},
}

return icons
