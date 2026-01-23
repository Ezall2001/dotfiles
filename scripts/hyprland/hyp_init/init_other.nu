export def main [] {
	hyprctl dispatch -- exec mpd-mpris -network unix -host /tmp/mpd_socket -no-instance
	hyprctl dispatch -- exec hyprpaper
	hyprctl dispatch -- exec hypridle
	hyprctl dispatch -- exec hyprsunset
	hyprctl dispatch -- exec clipse -listen
	hyprctl dispatch -- exec systemctl --user start hyprpolkitagent
	hyprctl dispatch -- exec tmux
}
