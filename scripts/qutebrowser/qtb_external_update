#!/usr/bin/env nu

const EXTERNAL_DIR = '~/.config/qutebrowser/shared/external' | path expand

export def main [] {
	if ($EXTERNAL_DIR | path exists) {rm -rf $EXTERNAL_DIR}

	mkdir $EXTERNAL_DIR
	cd $EXTERNAL_DIR

	git clone https://github.com/dracula/qutebrowser-dracula-theme.git dracula 
}

