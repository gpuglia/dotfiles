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

# Load rbenv
eval "$(rbenv init -)"

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Prompt
prompt pure

# Customize to your needs...
# source ~/.bin/tmuxinator.zsh

# Base16 Shell
# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

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
alias ve='vim ~/.vimrc'

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

# Spring
alias ss='spring stop'

alias rdm='bin/rake db:migrate && bin/rake db:test:prepare'
alias rdmr='bin/rake db:migrate:redo'
alias rdmt='bin/rake db:migrate RAILS_ENV=test'
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

# Postgres
alias pg_start='pg_ctl -D /usr/local/var/postgres start -l logfile'

# Pistachio
alias pist='open https://github.com/alphasights/pistachio'

# Notes
alias learn='vi ~/notes/learnings.txt'

# VIM mode
set -o vi

# octave
alias octave='octave --no-gui-libs'

# cake
export CAKE_LOCAL_DB="alpha_dev"
export CAKE_REMOTE_APP="cake-data"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
