use ./zoxide.nu [main]
use ./starship.nu [main]

def spec [] {
	[
		(zoxide)
		(starship)
	]
}

export def main [name:string action:string] {
	spec | where name == $name | first
	| get actions | get $action | do $in
}
