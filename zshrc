# Load cargo
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Prevent errors in rails c
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'
alias k9='kill -9'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

alias ll='ls -alGh'
alias ls='ls -Gh'

alias rm='rm -f'

# show me files matching "ls grep"
alias lsg='ll | grep'

# Vim
alias vi='nvim'
alias vim='nvim'
# alias lvi='NVIM_APPNAME=nvim-lazyvim nvim'

# Alias Editing
alias ze='vi ~/.zshrc' #zshrc edit
alias zloc='vi ~/.zshrc.local' #zshrc local edit
alias zr='source ~/.zshrc'  #zshrc reload

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='nvim ~/.config/nvim/init.vim'
alias ie='nvim ~/.ideavimrc'
alias ae='nvim ~/.config/alacritty/alacritty.toml'

# Git Aliases
alias g='git'
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcn='git ci --no-verify -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gd='git diff'
alias gb='git b'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpl='git pull'
alias gnb='git nb' # new branch aka checkout -b
alias grb='git recent-branches'
alias amend='g ci --amend --no-edit'
alias gpm='g peek'
alias gpb='g peek -'
alias gwl='git worktree list'
alias gwrm='git worktree remove'
alias lg='lazygit'

# Ruby
alias c='rails c'
alias be='bundle exec'

# Spring
alias ss='spring stop'

alias rdm='bin/rake db:migrate && bin/rake db:test:prepare'
alias rdmr='bin/rake db:migrate:redo'
alias rdmt='bin/rake db:migrate RAILS_ENV=test'
alias rdr='bin/rake db:rollback && bin/rake db:rollback RAILS_ENV=test'
alias rdrv='bin/rake db:reload_views'
alias rdrvt='bin/rake db:reload_views RAILS_ENV=test'

# Rspec
alias rs='bin/rspec spec'

# Tmux
alias tat='tmux attach-session -t'
alias mux='tmuxinator'
alias tns='tmux new-session -s'
alias tls='tmux list-sessions'
alias tks='tmux kill-session -t'

# Homebrew
# alias brewu='brew update && brew upgrade --all && brew cleanup && brew prune && brew doctor'
alias brewu='brew update && brew upgrade'
alias bsl='brew services list'
alias bss='brew services start'
alias bst='brew services stop'

# VIM mode
set -o vi
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Docker Compose
alias dc='docker-compose'
alias dc='docker-compose build'
alias dcr='docker-compose down && docker-compose up'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcps='docker-compose ps'

# Gradle
alias gr='./gradlew bootRun'
alias gb='./gradlew -x build'

path=(
  /opt/homebrew/opt/postgresql@16/bin(N)
  /opt/homebrew/opt/postgresql@15/bin(N)
  /opt/homebrew/opt/postgresql@13/bin(N)
  "$HOME/.mix/escripts"
  $path
)

# Agents
alias oc="opencode"
alias cx="claude"
alias pic="cd ~/.pi/agent"
alias oci="vi ~/.config/opencode/opencode.json"

# Elixir history
export ERL_AFLAGS="-kernel shell_history enabled"

# History dedup: keep distinct commands, only skip back-to-back exact dupes.
# Prezto's default HIST_IGNORE_ALL_DUPS + HIST_FIND_NO_DUPS makes ↑ skip
# whole runs of commands that normalize to the same string (whitespace,
# line continuations), which feels like "missing history".
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_FIND_NO_DUPS
setopt   HIST_IGNORE_DUPS

# tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"
eval "$(atuin init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "${XDG_DATA_HOME}/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi


# Source local config
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
