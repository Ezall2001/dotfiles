export def init_station_setup [] {
  hyprctl dispatch -- exec '[workspace 1]' ghostty
  hyprctl dispatch -- exec '[workspace 1 silent]' ghostty
  hyprctl dispatch -- exec '[workspace 2 silent]' ghostty

  hyprctl dispatch -- exec '[workspace 11 silent]' ghostty
}

