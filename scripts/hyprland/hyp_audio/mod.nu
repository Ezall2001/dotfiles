use ../../sfzf [main FZF_DELIMETER]
use ../hyp_menu [main]

const CMD = [hyp_audio menu]
const audio_r = '^audio((.*\n)*)^video$'
const sink_r = '.*sinks:\n((.*\n)*).*sources:'
const source_r = ''


def get_input [type:string] {
	let wp_audio_section = wpctl status | rg -Uio --replace '$1' $audio_r

	let regex = if $type == 'source' {$source_r} else {$sink_r}

	$wp_audio_section
	| rg -Uio --replace '$1' $regex
	| lines | drop 1
	| each {
		str replace -r '.*?(\d+)\. (.*)\s+\[.*\]' $'$1($FZF_DELIMETER)$2'
	}
	| to text
}

def get_params [] {
	{
		with-nth: '{2}'
		accept-nth: '{1}'
		input-border: top
	}
}

export def _menu [type:string] {
	let params = get_params
	let selected = get_input $type | sfzf --params $params

	try {
		wpctl set-default $selected
	}
}

export def _main [type: string] {
	hyp_menu [hyp_audio _menu $type] hyp_audio
}

export def main [type:string] { _main $type }
