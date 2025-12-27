export def copy [selected:list<string>] {
	$selected | str join " " | clipse -c
	notify-send -t 1000 "items copied"
	return ''
}
