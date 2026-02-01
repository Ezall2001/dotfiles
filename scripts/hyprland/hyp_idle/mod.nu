use ./idle.nu [main]
use ./wake_up.nu [main]
use ./warn_idle.nu [main]
use ./lock.nu [main]

export def _main [level: int]: nothing -> nothing {
	match $level {
		0 => {wake_up}
		1 => {warn_idle}
		2 => {lock}
		3 => {idle}
	}
}

export def main [level:int] { _main $level }
