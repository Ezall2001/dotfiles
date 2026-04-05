use consts.nu [PORT]

export def main [] {
	bw serve --port $PORT
}
