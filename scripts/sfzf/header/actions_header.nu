use ../../uansi
use ../consts.nu [STYLES]

def build_component [
	component: record<icon: string, label:string, key:string>
]: nothing -> string {
	[
		[$component.icon $STYLES.header_line_icon]
		[$component.label $STYLES.header_line_label]
		[$component.key $STYLES.header_line_key]
	]
	| each {|i| uansi style $i.0 ...$i.1 }
	| $"($in.0)($in.1):($in.2)"
}

export def build_action_header [
	components: table<icon:string, label:string, key:string>
	separator?: string
] {
	let _separator = $separator | default ' - ' |
	uansi style $in ...$STYLES.header_line_sep

	$components |
	each {build_component $in} |
	str join $_separator
}
