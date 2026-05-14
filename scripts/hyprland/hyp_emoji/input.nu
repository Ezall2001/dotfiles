use ../../sfzf [FZF_DELIMETER]
use ./consts.nu [EMOJI_PATH]


export def get_input [] {
	open (EMOJI_PATH) | par-each {|row|
		[$row.category $row.emoji $row.name] | str join $FZF_DELIMETER
	} | str join "\n"
}
