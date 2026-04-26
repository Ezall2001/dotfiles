const PATHS = [
	~/.config/scripts/nushell/nui/commandline/get
	~/.config/scripts/waybar/waybar_weather
]

def install [] {
	$PATHS | each {|p|
		print ('installing poetry project: ' + $p)
		cd $p
		^poetry env activate
		^poetry lock
		^poetry install
	}
}

export def main [] {
	{
		tasks: {
			install: {install}
		}
	}
}
