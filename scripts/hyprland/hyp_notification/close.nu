export def main [--all(-a)] {
	if $all {
		dunstctl close-all
	} else {
		dunstctl close
	}
}
