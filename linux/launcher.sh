#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
PATCH_FILE="$ROOT/core/rtl-patch.css"
START='/* Cline RTL:START */'
END='/* Cline RTL:END */'

cyan=$'\033[1;36m'; green=$'\033[1;32m'; yellow=$'\033[1;33m'; magenta=$'\033[1;35m'; blue=$'\033[1;34m'; reset=$'\033[0m'

find_css() {
  local roots=(
    "$HOME/.vscode/extensions"
    "$HOME/.vscode-insiders/extensions"
    "$HOME/.vscode-oss/extensions"
    "$HOME/.vscode-server/extensions"
    "$HOME/.vscode-server-insiders/extensions"
  )
  local root
  for root in "${roots[@]}"; do
    [[ -d "$root" ]] || continue
    find "$root" -type f -name '*.css' 2>/dev/null |
      grep -Ei '/(cline[^/]*/|saoudrizwan[^/]*/|claude-dev[^/]*/).*(webview-ui|webview)/.*assets/|/(webview-ui|webview)/.*assets/.*' || true
  done | sort -u
}
restore_backups() {
  local found=0 backup target
  while IFS= read -r -d '' backup; do
    target="${backup%.Cline RTL.bak}"
    cp -p -- "$backup" "$target"
    printf '%bRestored:%b %s\n' "$green" "$reset" "$target"
    found=1
  done < <(find "$HOME/.vscode" "$HOME/.vscode-insiders" "$HOME/.vscode-oss" "$HOME/.vscode-server" "$HOME/.vscode-server-insiders" -type f -name '*.css.Cline RTL.bak' -print0 2>/dev/null || true)
  (( found )) || echo "No backups found."
}
install_patch() {
  mapfile -t css_files < <(find_css)
  if (( ${#css_files[@]} == 0 )); then
    printf '%bNo matching Cline CSS bundles found.%b\n' "$yellow" "$reset"
    echo "Install Cline and try again. Detection is best-effort across Cline versions."
    return
  fi
  printf '%bDetected CSS bundles:%b\n' "$yellow" "$reset"
  printf '  %s\n' "${css_files[@]}"
  echo
  read -r -p "Patch all listed files? [y/N] " answer
  [[ "$answer" =~ ^([yY]|[yY][eE][sS])$ ]] || return
  local file backup temp patch
  patch="$(cat "$PATCH_FILE")"
  for file in "${css_files[@]}"; do
    backup="$file.Cline RTL.bak"
    [[ -f "$backup" ]] || cp -p -- "$file" "$backup"
    temp="$(mktemp)"
    # Remove an older managed block before adding the current patch.
    awk -v start="$START" -v end="$END" '
      index($0,start) { skip=1; next }
      index($0,end) { skip=0; next }
      !skip { print }
    ' "$file" > "$temp"
    printf '\n%s\n' "$patch" >> "$temp"
    cat "$temp" > "$file"
    rm -f "$temp"
    printf '%bPatched:%b %s\n' "$green" "$reset" "$file"
  done
  printf '%bComplete. Restart VS Code to apply changes.%b\n' "$green" "$reset"
}
while true; do
  clear
  printf '%bCline RTL%b\n' "$cyan" "$reset"
  printf 'RTL layout patch manager\n\n'
  printf '%bGitHub%b   https://github.com/mmnosrati\n' "$blue" "$reset"
  printf '%bTelegram%b https://t.me/mmn_dev\n' "$magenta" "$reset"
  printf '%s\n' '----------------------------------------------'
  printf '%b[1]%b Install / repair RTL patch\n' "$green" "$reset"
  printf '%b[2]%b Restore original CSS from backups\n' "$yellow" "$reset"
  printf '%b[3]%b Open GitHub profile\n' "$blue" "$reset"
  printf '%b[4]%b Open Telegram\n' "$magenta" "$reset"
  printf '[q] Quit\n\n'
  read -r -p 'Select an option: ' choice
  case "${choice,,}" in
    1) install_patch; read -r -p 'Press Enter to return to menu...' ;;
    2) restore_backups; read -r -p 'Press Enter to return to menu...' ;;
    3) xdg-open 'https://github.com/mmnosrati' >/dev/null 2>&1 || true ;;
    4) xdg-open 'https://t.me/mmn_dev' >/dev/null 2>&1 || true ;;
    q) exit 0 ;;
    *) echo 'Invalid option.'; sleep 1 ;;
  esac
done
