use ./utils.nu [get_icon get_fg]

def draw_secondary_vws [vws:record] {
	let icon = get_icon $vws
	let fg = get_fg $vws

	$'<span size="12000" foreground="($fg)">($icon)</span>'
}

def draw_primary_vws [vws:record] {
	let icon = get_icon $vws
	let fg = get_fg $vws

	$'<span size="12000" foreground="($fg)">($icon)</span>'
}

export def main [vws_list:table]: nothing -> string {
	let primary_section = $vws_list | where type == primary
	| each {|vws| draw_primary_vws $vws} | str join ' '

	let secondary_section = $vws_list | where type == secondary
	| each {|vws| draw_secondary_vws $vws} | str join ' '

	if $secondary_section == '' {
		$'<tt>($primary_section)</tt>'
	} else {
		$'<tt>($primary_section) » ($secondary_section)</tt>'
	}

}
