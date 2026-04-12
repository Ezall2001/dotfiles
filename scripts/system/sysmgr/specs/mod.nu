use ./clipse.nu [main]
use ./btop.nu [main]
use ./doas.nu [main]
use ./tmux.nu [main]
use ./qtb.nu [main]
use ./dotfiles.nu [main]
use ./poetry.nu [main]
use ./nodejs.nu [main]

export def main [] {
	{
		dotfiles: (dotfiles)
		doas: (doas)
		clipse: (clipse)
		btop: (btop)
		tmux: (tmux)
		qtb: (qtb)
		poetry: (poetry)
		nodejs: (nodejs)
	}
}
