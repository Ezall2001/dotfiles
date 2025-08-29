const W_STEP_COOF = 0.07
const H_STEP_COOF = 0.06

def get_step_coof [direction:string] {
	match $direction {
		r => [$W_STEP_COOF 0]
		l => [($W_STEP_COOF * -1) 0]
		u => [0 $H_STEP_COOF]
		d => [0 ($H_STEP_COOF * -1)]
	}
}

export def main [direction:string --reset (-r)] {
	let act_mon = hyprctl monitors -j | from json | where focused == true | first
	let act_win = hyprctl activewindow -j | from json

	let prv_size = $act_win.size

	let coof = get_step_coof $direction
	let step = [
		($act_mon.width * $coof.0 / $act_mon.scale | math floor)
		($act_mon.height * $coof.1 / $act_mon.scale | math floor)
	]

	hyprctl dispatch resizeactive $step.0 $step.1
}
