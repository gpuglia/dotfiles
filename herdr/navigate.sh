#!/bin/sh
# vim-tmux-navigator-style dispatcher, invoked by herdr keybindings as:
#   navigate.sh <left|down|up|right>
# If the focused pane's foreground process is a vim-like editor (or fzf),
# forward the ctrl chord into that pane so nvim moves its own splits; the
# editor crosses back out to herdr at a split edge. Otherwise move herdr's
# pane focus directly.
set -eu

dir="${1:?usage: navigate.sh <left|down|up|right>}"
case "$dir" in
  left)  key="ctrl+h" ;;
  down)  key="ctrl+j" ;;
  up)    key="ctrl+k" ;;
  right) key="ctrl+l" ;;
  *) echo "navigate.sh: unknown direction: $dir" >&2; exit 2 ;;
esac

herdr="${HERDR_BIN_PATH:-herdr}"
pane="${HERDR_ACTIVE_PANE_ID:-${HERDR_PANE_ID:-}}"

# Same matcher vim-tmux-navigator uses, plus fzf (owns ctrl+j/k).
vim_re='^g?(view|l?n?vim?x?)(diff)?$'
fzf_re='^fzf$'

forward=0
if [ -n "$pane" ] && command -v jq >/dev/null 2>&1; then
  if "$herdr" pane process-info --pane "$pane" 2>/dev/null |
    jq -e --arg vim "$vim_re" --arg fzf "$fzf_re" \
      '.result.process_info.foreground_processes[]?.name
        | ascii_downcase
        | select(test($vim) or test($fzf))' >/dev/null 2>&1
  then
    forward=1
  fi
fi

if [ "$forward" -eq 1 ]; then
  exec "$herdr" pane send-keys "$pane" "$key"
else
  if [ -n "$pane" ]; then
    exec "$herdr" pane focus --direction "$dir" --pane "$pane"
  else
    exec "$herdr" pane focus --direction "$dir"
  fi
fi
