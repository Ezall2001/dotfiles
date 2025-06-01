const SCRIPTS_PATH = '~/.config/scripts'

# scripts
const NU_LIB_DIRS = [
  ($SCRIPTS_PATH),
]

use hyp_lunch_clipboard
use hyp_screenshot
use helb

# aliases
alias _ls = ls
alias ls = ls -a
alias ll = ls -l

alias sbat = bat --style=-header
alias pbat = bat --plain

alias _fzf = fzf
alias fzf = fzf --preview "bat --style=plain --color=always {}"

alias _ssh = ssh
alias ssh = ssh -F ($env.XDG_CONFIG_HOME | path join 'ssh/config')

alias _btop = btop
alias btop = btop -p 0

alias vi = nvim
alias pn = pnpm

## git aliases
alias g = git
alias gc = git commit
alias ga = git add
alias gsw = git switch
alias gst = git stash 
alias gd = git diff
alias gstl = git stash list
alias gstp = git stash pop
alias gstd = git stash drop
alias gr = git rebase
alias gr-c = git rebase --continue
alias gr-a = git rebase --abort
alias gm = git merge
alias gm-a = git merge --abort
alias gm-c = git merge --continue
alias gg = git log --graph --oneline -n10
alias gga = git log --graph --oneline -n10 --all
alias gl = git log
alias gs = git status -s
alias gcp = git cherry-pick
alias gcp-c = git cherry-pick --continue
alias gcp-a = git cherry-pick --abort
alias grs = git reset
alias gw = git worktree
alias gwl = git worktree list
alias gwa = git worktree add
alias gwr = git worktree remove
alias gbi = git bisect
alias gbib = git bisect bad
alias gbig = git bisect good
alias gf = git fetch
alias gpsh = git push
alias gpsh-f = git push --force-with-lease
alias gpl = git pull

# environment
## UNIX CONVENTION
$env.EDITOR = 'nvim'
$env.VISUAL = 'nvim'
$env.PAGER = 'bat'
$env.SHELL = 'nu'
$env.BROWSER = 'zen-browser'
$env.MANPAGER = "sh -c 'sed -u -e \"s/\\x1B\\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

## XDG
$env.XDG_CONFIG_HOME = "/home/armen/.config"
$env.XDG_DATA_HOME = "/home/armen/.local/share"
$env.XDG_STATE_HOME = "/home/armen/.local/state"
$env.XDG_CACHE_HOME = "/home/armen/.cache"

## nushell config
$env.config.shell_integration.osc133 = false
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false
$env.config.edit_mode = 'vi'
$env.config.cursor_shape = {
  vi_insert : "line",       
  vi_normal : "block"
}

## other nushell config
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

## integration
$env.path ++= [$SCRIPTS_PATH]
$env.STARSHIP_CONFIG = $env.XDG_CONFIG_HOME | path join "starship/starship.toml"



