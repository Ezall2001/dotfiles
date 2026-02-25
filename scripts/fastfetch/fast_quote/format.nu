use ./consts.nu [FOOTER_RIGHT_OFFSET]
use ../consts.nu [MAX_LEN]
use ../../uansi [style]
use ../../uwrap [main]

def format_footer [footer:string] {
	if $footer == null {
		return ''
	}
	let footer = style $'──($footer)──' light_cyan d
	let offset = $MAX_LEN - $FOOTER_RIGHT_OFFSET
	uwrap $footer ($MAX_LEN - 1)
	| fill -a r -w $offset -c ' '
}

def format_header [header:string] {
	let header = $'(style $header blue bo i) (style "once said:" blue)'
	uwrap $header ($MAX_LEN - 1)
}

def format_body [body:string] {
	let body = $'“($body)”'
	uwrap $body ($MAX_LEN - 1)
	| split row "\n"
}

export def main [quote:record line:oneof<string,int>] {
	if $line == header {
		format_header $quote.character
	} else if $line == footer {
		format_footer $quote.source
	} else {
		let line = $line | into int
		let body = format_body $quote.body
		try {$body | get $line} catch {''}
	}
}
