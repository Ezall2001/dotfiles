export def init_portable_setup [] {
  hyprctl dispatch -- exec '[workspace 11]' ghostty
  hyprctl dispatch -- exec '[workspace 12 silent]' ghostty
}

