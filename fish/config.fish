set -g WAHOO_PATH $HOME/git/dotfiles/.wahoo
set -g WAHOO_CUSTOM $HOME/git/dotfiles/.wahoo-mine
source $WAHOO_PATH/init.fish

set fish_function_path $fish_function_path "/home/martin/.local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup
