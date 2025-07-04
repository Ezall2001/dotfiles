const builtin_mon_name = 'eDP-1'

export def init_portable_setup [] {
  let w1 = hyp_workspace id 1 $builtin_mon_name
  let w2 = hyp_workspace id 2 $builtin_mon_name

  hyprctl dispatch -- exec $'[workspace ($w1)]' ghostty
  hyprctl dispatch -- exec $'[workspace ($w2) silent]' ghostty
}

