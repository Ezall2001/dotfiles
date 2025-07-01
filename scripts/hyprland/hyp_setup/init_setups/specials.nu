export def init_specials [] {
  # launch
  hyprctl dispatch -- exec '[workspace special:browser silent]' zen-browser
  hyprctl dispatch -- exec '[workspace special:terminal silent]' ghostty
  hyprctl dispatch -- exec '[workspace special:notes silent]' obsidian

  # move to workspace and tag 
  # sleep to allow for process to finish forking
  job spawn {
    sleep 1sec

    let windows = hyprctl -j clients | from json

    ## ZEN
    let zen_pid = $windows | where class == 'zen' | get pid | first
    hyprctl dispatch tagwindow +p_browser $'pid:($zen_pid)'
    hyprctl dispatch movetoworkspacesilent special:browser, pid:($zen_pid)

    ## GHOSTTY
    let ghostty_pid = hyprctl -j clients | from json
    | where ($it.class like ghostty) and ($it.workspace.name == 'special:terminal')
    | get pid | first

    hyprctl dispatch tagwindow +p_terminal $'pid:($ghostty_pid)'

  } | job tag $in hyp_init_setup
}

