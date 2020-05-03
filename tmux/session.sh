sessid=`tmux ls | wc -l`
if [ $sessid = 0 ]; then
  tmux new-session
else
  tmux a
fi

