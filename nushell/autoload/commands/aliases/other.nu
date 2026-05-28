alias sbat = bat --style=-header
alias pbat = bat --plain

alias _ssh = ssh
alias ssh = ssh -F ($env.XDG_CONFIG_HOME | path join 'ssh/config')

alias _btop = btop
alias btop = btop -p 0

alias pn = pnpm

alias mixer = ncpamixer -c ($env.XDG_CONFIG_HOME | path join 'ncpamixer/ncpamixer.conf')

alias grm = gtrash put

alias difft = difft --context 3 --tab-width 2 --display side-by-side --background dark --syntax-highlight on
