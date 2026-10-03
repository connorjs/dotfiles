#!/bin/bash
set -euo pipefail

fish=/opt/homebrew/bin/fish
grep -qx "$fish" /etc/shells || echo "$fish" | sudo tee -a /etc/shells > /dev/null
[[ "$SHELL" == "$fish" ]] || chsh -s "$fish"
