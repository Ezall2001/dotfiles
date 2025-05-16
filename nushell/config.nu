# aliases
alias ll = ls -l
alias vi = nvim
alias fzf = fzf --preview "bat --style=plain --color=always {}"
alias pn = pnpm
alias grep = rg
alias fastfetch = fastfetch -c ($env.XDG_CONFIG_HOME | path join "fastfetch/config.jsonc") 

# environment
$env.config.shell_integration.osc133 = false
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.config.cursor_shape = {
  vi_insert : "line",       
  vi_normal : "block"
}

$env.STARSHIP_CONFIG = $env.XDG_CONFIG_HOME | path join "starship/starship.toml"
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""


# other
const autoload_dir = $nu.data-dir | path join "vendor/autoload"
mkdir $autoload_dir

fastfetch
