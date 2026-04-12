export def main [] {
	if (whoami) != root {
		error make {msg: "run as root"}
	}
}
