if [[ "$TMUX" == "" ]]; then
  exec eval "tmux -f $HOME/.config/tmux/tmux.conf attach -t $USER > /dev/null 2>&1 || tmux -f $HOME/.config/tmux/tmux.conf new -s $USER"
fi
