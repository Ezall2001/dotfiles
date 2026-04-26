export def main [] {
	paru --clean
	paccache --remove --uninstalled
	paccache --remove --force --keep 3
}
