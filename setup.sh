# Create symbolic links
dir=$(pwd)
cd ~
ln -s $dir/.bashrc
ln -s $dir/.gitconfig
ln -s $dir/.gitignore
ln -s $dir/.aliases
ln -s $dir/.vimrc
#sudo cp -r $dir/etc /etc
ln -s $dir/bin
