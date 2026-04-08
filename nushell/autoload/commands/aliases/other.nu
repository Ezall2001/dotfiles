alias sbat = bat --style=-header
alias pbat = bat --plain

alias _ssh = ssh
alias ssh = ssh -F ($env.XDG_CONFIG_HOME | path join 'ssh/config')

alias ncpamixer = ncpamixer -c ($env.XDG_CONFIG_HOME | path join 'ncpamixer/ncpamixer.conf')

alias _btop = btop
alias btop = btop -p 0

alias pn = pnpm
