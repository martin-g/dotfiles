set -g WAHOO_PATH $HOME/.wahoo
set -g WAHOO_CUSTOM $HOME/.dotfiles
source $WAHOO_PATH/init.fish

set fish_function_path $fish_function_path "/home/martin/.local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup
