use ../consts.nu [SHARED_DATA_DIR]

const SESSIONS_DIR = $SHARED_DATA_DIR | path join sessions

export def main [] {
	ls $SESSIONS_DIR
	| where ($it.name | str ends-with '.yml')
	| get name | each {path parse} | get stem
	| where $it != _autosave
}
