#!/bin/sh
# Focus the Nth agent (1-based) in `herdr agent list` order.
set -eu

idx="${1:?usage: agent-jump.sh <1-9>}"
case "$idx" in
  [1-9]) ;;
  *) echo "agent-jump.sh: index must be 1-9: $idx" >&2; exit 2 ;;
esac

herdr="${HERDR_BIN_PATH:-herdr}"
pane=$("$herdr" agent list 2>/dev/null |
  jq -r --argjson n "$((idx - 1))" '.result.agents[$n].pane_id // empty')

[ -n "$pane" ] || exit 0
exec "$herdr" agent focus "$pane"
