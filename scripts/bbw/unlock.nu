use consts.nu [BASE_URL STATE_PATH]
use ../upath
use utils.nu [key_path update_state get_state]
use ./sync.nu [main]

def is_locked [] {
	let res = http get $'($BASE_URL)/status'
	$res.data.template.status == locked
}

def get_key [pass:string] {
	let body = {password: $pass}
	let res = http post -e --content-type application/json $'($BASE_URL)/unlock' $body

	if not $res.success {
		print $res.message
		return null
	}

	$res.data.raw
}

def check [] {
	let state = get_state
	let now = date now
	let diff = $now - ($state.last_check | into datetime)
	if $diff < 1day { return }

	print 'checking passwords'
	hyprctl dispatch exec bbw exposed check | ignore

	update_state {last_check: $now} $state
}

def _sync [] {
	print 'syncing'
	sync
}

def unlock [] {
	let pass = input --suppress-output 'master password: '
	let key = get_key $pass
	if $key == null { return }

	$key | upath save -f (key_path)

	_sync
	check
	$key
}

export def main --env [--force(-f) --no-interactive] {
	let is_locked_ = is_locked
	if $is_locked_ and $no_interactive {return false}

	let key = if $is_locked_ or $force {
		unlock
	} else { open (key_path) }

	if $key == null {return false}

	$env.BW_SESSION = $key
	true
}
