const CONF_PATH = '/etc/fcron/fcron.conf' | path expand

export def _main [] {
	if (whoami) != root {
		print 'run as root'
		return
	}

	run-external ...[
		fcron
		--configfile $CONF_PATH
		--foreground
		--firstsleep 60
		--maxserial 1
		--queuelen 30
		--savetime 300
	]
}

export def main [] { _main }
