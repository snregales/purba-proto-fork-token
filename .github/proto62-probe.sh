#!/usr/bin/env bash
# Arm A of purba #62: what does an Actions token read of the protection API?
set -u
get() {
  if [ "$2" = auth ]; then
    curl -s -o body.json -w '%{http_code}' \
      -H 'Accept: application/vnd.github+json' \
      -H "Authorization: Bearer $TOKEN" "$1"
  else
    curl -s -o body.json -w '%{http_code}' \
      -H 'Accept: application/vnd.github+json' "$1"
  fi
}
line() { printf 'ARMA|%s|%s|%s|%s|%s\n' "$GRANT" "$1" "$2" "$3" "$4"; }

for mode in auth anon; do
  code=$(get "https://api.github.com/repos/$REPO/rules/branches/main" "$mode")
  line rules "$mode" "$code" "$(jq -c '[.[].type]' body.json 2>/dev/null || head -c 120 body.json)"

  code=$(get "https://api.github.com/repos/$REPO" "$mode")
  line repo "$mode" "$code" "$(jq -c '{allow_rebase_merge,allow_squash_merge,allow_merge_commit,web_commit_signoff_required}' body.json 2>/dev/null || head -c 120 body.json)"

  code=$(get "https://api.github.com/repos/$REPO/rulesets/23594651" "$mode")
  line ruleset "$mode" "$code" "$(jq -c '{enforcement, has_bypass_key: has("bypass_actors"), bypass_actors}' body.json 2>/dev/null || head -c 120 body.json)"

  code=$(get "https://api.github.com/repos/$REPO/rulesets/23594651/history" "$mode")
  line history "$mode" "$code" "$(head -c 120 body.json | tr -d '\n')"
done
