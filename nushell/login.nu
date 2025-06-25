# environment
## UNIX CONVENTION
$env.EDITOR = 'nvim'
$env.VISUAL = 'nvim'
$env.PAGER = 'bat'
$env.SHELL = 'nu'
$env.BROWSER = 'zen-browser'
$env.MANPAGER = "sh -c 'sed -u -e \"s/\\x1B\\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

## XDG
$env.XDG_CONFIG_HOME = $nu.home-path | path join ".config"
$env.XDG_DATA_HOME = $nu.home-path | path join ".local/share"
$env.XDG_STATE_HOME = $nu.home-path | path join ".local/state"
$env.XDG_CACHE_HOME = $nu.home-path | path join ".cache"
$env.XDG_PICTURES_DIR = $nu.home-path | path join "Downloads"

## OTHER
$env.path ++= ['.config/scripts'] | each {|p| $nu.home-path | path join $p}
