#!/usr/bin/env bash

read -d '' NEWCONTENT <<"BLOCK"
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
BLOCK

ZSHRC="$(cat ~/.zshrc)"

echo "$NEWCONTENT" > ~/.zshrc
echo "$ZSHRC" >> ~/.zshrc
