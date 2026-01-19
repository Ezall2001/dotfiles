use ../consts.nu [MODIFIERS_MASK_MAP]
use ../../sfzf [main FZF_DELIMETER STYLED_FZF_DELIMETER]
use ../hyp_menu [main]
use ../hyp_utils [mod_mask_to_name]
use ../../uansi [style]


def get_params [] {
	{
		input-border: top
		nth: '1,3'
		with-nth: $"{1}($STYLED_FZF_DELIMETER){2}($STYLED_FZF_DELIMETER){3}"
	}
}

def build_keybind_str [obj:record] {
	if $obj.description == '' {return null}

	let mod = mod_mask_to_name $obj.modmask
	let keybind_str = $'($mod.icon) ($obj.key)'
	let keybind_str = style $keybind_str red

	let submap_str = if $obj.submap == '' {'default'} else {$obj.submap}
	let submap_str = style $submap_str blue

	[$submap_str $keybind_str $obj.description] | str join $FZF_DELIMETER
}

def get_input [] {
	hyprctl binds -j | from json
	| select modmask key description submap
	| each { build_keybind_str $in }
	| where $it != null
	| str join "\n"
}

export def _menu [] {
	let params = get_params
	get_input | sfzf --params $params | ignore
}

export def _main [] {
	let params = {size: [600 700]}
	hyp_menu [hyp_keymap _menu] hyp_keymap $params
}

export def main [] {_main}
