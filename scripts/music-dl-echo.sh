#!/usr/bin/zsh

command yt-dlp -m -a - && 
  builtin print -l -- \
  "" \
  "Download complete, copy next link to clipboard to download more." \
  "Press Ctrl+C to exit."
echo ""