let config_paths =  glob ~/personal/dotfiles/kanata/*.kbd | each {|p| '-c' + $p}

kanata_gui ...$config_paths
sleep 1day
