# aliases
alias ll = ls -l
alias vi = nvim
alias fzf = fzf --preview "bat --style=plain --color=always {}"
alias pn = pnpm
alias grep = rg
alias fastfetch = fastfetch -c ($env.XDG_CONFIG_HOME | path join "fastfetch/config.jsonc") 

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
