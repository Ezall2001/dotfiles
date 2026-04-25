use ../../nushell/nui

const SOCK = '/tmp/pacpac/lockfile.sock'
const SOCK_DIR = '/tmp/pacpac'
const LOCKFILE = '~/.config/pacman/lockfile.lock' | path expand
const DEBOUNCE_INTERVAL = 10sec
const DEBOUNCE_TAG = 'pacpac_lockfile'

export def lock [] {
	'' | socat - UNIX-CONNECT:($SOCK)
}

export def install [] {
	let packages = open $LOCKFILE | lines
	| par-each { split row ' ' | first }

	run-external ...[
		paru -Suy
		...($packages)
	]
}

export def init [] {
	mkdir $SOCK_DIR

	let cb = {
		print 'exec'
		paru -Qe | save -f $LOCKFILE
	}

	while true {
		socat UNIX-LISTEN:($SOCK) - | ignore
		print 'call'
		nui schedule debounce $cb $DEBOUNCE_INTERVAL $DEBOUNCE_TAG
	}
}

export def main [] {}
