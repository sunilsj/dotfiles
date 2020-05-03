totalwindows=`tmux list-windows | wc -l`
if [ $totalwindows = 1 ]; then
  tmux rename-window -t 0 "Terminal"
fi


winname=`tmux list-windows | grep "Terminal" | wc -l`
if [ $winname = 0 ]; then
  tmux new-window -n "Terminal"
fi

winname=`tmux list-windows | grep "Insyte" | wc -l`
if [ $winname = 0 ]; then
  tmux new-window -n "Insyte"
fi

winname=`tmux list-windows | grep "BlueX" | wc -l`
if [ $winname = 0 ]; then
  tmux new-window -n "BlueX"
fi

