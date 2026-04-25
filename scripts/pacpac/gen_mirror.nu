export def main [] {
	run-external ...[
		doas reflector
		--country 'FR,CA,DK,DE,JP,RU,SA,ZA,ES,SE,GB,US,AE'
		--delay 2 --sort score --score 10
		--completion-percent 90 --protocol https
		--save /etc/pacman.d/mirrorlist
	]
}
