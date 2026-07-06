#!/usr/bin/env bash
# Prints PR number (as a clickable OSC8 link), aggregate CI status icon,
# and count of unresolved review-thread comments (e.g. Bugbot) for the
# current branch. Empty output => module hidden by starship.
set -euo pipefail

json=$(gh pr view --json number,url,statusCheckRollup,headRepositoryOwner,headRepository 2>/dev/null) || exit 0
[ -n "$json" ] || exit 0

number=$(jq -r '.number' <<<"$json")
url=$(jq -r '.url' <<<"$json")
owner=$(jq -r '.headRepositoryOwner.login' <<<"$json")
repo=$(jq -r '.headRepository.name' <<<"$json")

# Aggregate check conclusions/states into one status.
status=$(jq -r '
  [.statusCheckRollup[]? | (.conclusion // .state // "PENDING")] as $s
  | if ($s | length) == 0 then "NONE"
    elif ($s | any(. == "FAILURE" or . == "ERROR" or . == "CANCELLED" or . == "TIMED_OUT" or . == "ACTION_REQUIRED")) then "FAILURE"
    elif ($s | any(. == "PENDING" or . == "IN_PROGRESS" or . == "QUEUED" or . == "EXPECTED" or . == "STARTUP_FAILURE" or . == "WAITING")) then "PENDING"
    else "SUCCESS"
    end
' <<<"$json")

# Count unresolved review threads (inline comments incl. Bugbot).
unresolved=$(gh api graphql -f query='
  query($owner:String!,$repo:String!,$pr:Int!){
    repository(owner:$owner,name:$repo){
      pullRequest(number:$pr){
        reviewThreads(first:100){
          nodes{ isResolved }
        }
      }
    }
  }' -f owner="$owner" -f repo="$repo" -F pr="$number" 2>/dev/null \
  | jq -r '[.data.repository.pullRequest.reviewThreads.nodes[]? | select(.isResolved == false)] | length' 2>/dev/null) || unresolved=0
[ -n "$unresolved" ] || unresolved=0

# Jellybeans palette (24-bit) to match dotfiles theme.
case "$status" in
  SUCCESS) icon="✓"; color=$'\033[38;2;139;193;170m' ;;  # #8bc1aa green
  FAILURE) icon="✗"; color=$'\033[38;2;214;67;67m'   ;;  # #d64343 red
  PENDING) icon="◐"; color=$'\033[38;2;250;208;122m' ;;  # #fad07a yellow
  *)        icon="";  color=$'\033[38;2;136;136;136m' ;;  # #888888 grey / no checks
esac

reset=$'\033[0m'
link=$'\033]8;;'"$url"$'\033\\'"#$number"$'\033]8;;\033\\'

comment_part=""
if [ "$unresolved" -gt 0 ]; then
  # #fad07a yellow, matches pending/comment attention color.
  comment_part=$'\033[38;2;250;208;122m'" 💬$unresolved""$reset"
fi

printf '%s%s %s%s%s' "$color" "$link" "$icon" "$reset" "$comment_part"
