# Author Walter Paulo
# email walter0paulo@hotmail.com
# data 2022-4-16
# Personalização do shell com barra de status com porcentagem  de cup. Base código no git /tony/tmux-config

#!/bin/bash

sudo apt update
sudo apt install tmux -y

trap exit ERR
[ -d $HOME/.tmux  ] && echo .tmux already exist &&
	    mv -b $HOME/.tmux $HOME/.tmux.bak

git clone --recursive https://github.com/walterpaulo/tmux-config.git ~/.tmux ||
	git clone --recursive https://github.com/tony/tmux-config.git ~/.tmux

[ -e $HOME/.tmux.conf  ] && echo .tmux.conf already exist && 
	       	mv -u $HOME/.tmux.conf $HOME/.tmux.conf.bak

ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

cd ~/.tmux && git submodule init && git submodule update

cd ~/.tmux/vendor/tmux-mem-cpu-load && cmake . && make && sudo make install

tmux source-file ~/.tmux.conf

