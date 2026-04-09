use consts.nu [PORT]
use ../hyprland/hyp_log [main]

export def main [] {
	loop {
		try {bw serve --port $PORT} catch {|e|
			hyp_log -l error -n "bitwarden server crashed" $e.rendered bbw
		}
	}
}
