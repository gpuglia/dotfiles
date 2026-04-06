#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Load cargo
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# asdf
# . /opt/homebrew/opt/asdf/libexec/asdf.sh

. "$HOME/.asdf/asdf.sh"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# FFI
# export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# export LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib"
# export CPPFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix readline)/include -I$(brew --prefix zlib)/include"
# export PKG_CONFIG_PATH="$(brew --prefix openssl)/lib/pkgconfig:$(brew --prefix readline)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"

# Prevent errors in rails c
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export VISUAL=nvim
export EDITOR=nvim
export GIT_EDITOR=nvim
export BUNDLER_EDITOR=nvim


# Prompt
prompt pure

# Customize to your needs...
# source ~/.bin/tmuxinator.zsh

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
alias brewu='brew update && brew upgrade --all && brew cleanup && brew prune && brew doctor'

# VIM mode
set -o vi

# Docker Compose
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcps='docker compose ps'

# Gradle
alias gr='./gradlew bootRun'
alias gb='./gradlew -x build'

export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH=~/.mix/escripts:$PATH

# Git worktrees
gwt() {
  local branch="$1"
  if [ -z "$branch" ]; then
    echo "Usage: gwt <branch-name>"
    return 1
  fi
  local project_name=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)")
  if [ -z "$project_name" ]; then
    echo "Error: Not in a git repository"
    return 1
  fi
  local worktree_path="$HOME/code/worktrees/$project_name/$branch"

  mkdir -p "$(dirname "$worktree_path")"

  if git worktree add "$worktree_path" -b "gus/$branch"; then
    if [ -n "$TMUX" ]; then
      tmux new-window -n "$branch" -c "$worktree_path"
    else
      cd "$worktree_path"
    fi
  fi
}

# Agents
alias oc="opencode"
alias cx="claude"

# try init
eval "$(try init ~/code/tries)"

# Elixir history
export ERL_AFLAGS="-kernel shell_history enabled"

# Source local config
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
export PATH="$HOME/.local/bin:$PATH"
