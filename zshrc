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

# Load nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Load cargo
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# FFI
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"


export EDITOR=nvim
export GIT_EDITOR=nvim

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

# Alias Editing
alias ze='vi ~/.zshrc' #zshrc edit
alias zr='source ~/.zshrc'  #zshrc reload

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.config/nvim/init.vim'
alias ie='vim ~/.ideavimrc'

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

# Ruby
alias c='rails c'
alias bi='BUNDLE_FORCE_RUBY_PLATFORM=true bundle install'

# Spring
alias ss='spring stop'

alias rdm='bin/rake db:migrate && bin/rake db:migrate RAILS_ENV=test'
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

# Homebrew
alias brewu='brew update && brew upgrade --all && brew cleanup && brew prune && brew doctor'

# VIM mode
set -o vi

export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"


# function python() {
#   python3
# }
#
# Source local config
if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.local" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.local"
fi
