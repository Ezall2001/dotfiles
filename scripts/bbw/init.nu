use consts.nu [PORT]
use ../hyprland/hyp_log [main]

const MAX_RETRY = 5

export def main [] {
	mut retry = 0
	loop {
		if $retry >= $MAX_RETRY { return }

		try {bw serve --port $PORT} catch {|e|
			hyp_log -l error -n "bitwarden server crashed" $e.rendered bbw
		}

		$retry += 1
	}
}
