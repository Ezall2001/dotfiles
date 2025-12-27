use ../../sfzf [FZF_DELIMETER]
use ./consts.nu [EMOJIES_DIR]

def get_category_input [path:string] {
	let category = $path | path basename

	open $path | str replace -a "::" $FZF_DELIMETER |
	lines | par-each { $"($category)($FZF_DELIMETER)($in)" } |
	str join "\n"
}

export def get_input [] {
	ls $EMOJIES_DIR | get name |
	par-each { get_category_input $in } |
	str join "\n"
}
