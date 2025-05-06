$env.config.shell_integration.osc133 = false
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

alias ll = ls -l
alias vi = nvim
alias fzf = fzf --preview "bat --style=plain --color=always {}"
alias pn = pnpm
alias grep = rg

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu") 

$env.STARSHIP_CONFIG = $env.XDG_CONFIG_HOME | path join "starship/starship.toml"
$env.config.edit_mode = 'vi'

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

$env.config.cursor_shape = {
  vi_insert : "line",       
  vi_normal : "block"
}


source ./zoxide.nu

fastfetch
