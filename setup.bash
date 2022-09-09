#!/usr/bin/env bash

DIR=$(dirname $0)
if [ "$DIR" == "." ]; then
    DIR=$PWD
fi
echo $DIR

LN_OPTIONS="-s"
if [ "$1" == "-f" ]; then
    LN_OPTIONS="-sf"
fi

# Create symbolic links
ln $LN_OPTIONS $DIR/.aliases ~/.aliases
ln $LN_OPTIONS $DIR/.bashrc ~/.bashrc
ln $LN_OPTIONS $DIR/.gitconfig ~/.gitconfig
ln $LN_OPTIONS $DIR/.gitignore ~/.gitignore
ln $LN_OPTIONS $DIR/.vimrc ~/.vimrc
ln $LN_OPTIONS $DIR/.inputrc ~/.inputrc
#sudo cp -r $DIR/etc /etc
ln $LN_OPTIONS $DIR/bin ~/bin
ln $LN_OPTIONS $DIR/fish/config.fish ~/.config/fish/config.fish
ln $LN_OPTIONS $DIR/fish/conf.d ~/.config/fish/conf.d
ln $LN_OPTIONS $DIR/fish/completions ~/.config/fish/completions
ln $LN_OPTIONS $DIR/fish/functions ~/.config/fish/functions

