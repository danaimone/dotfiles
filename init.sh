#!/bin/bash
echo "-= Installing System Dependencies =-"
sudo apt-get install aptitude
sudo aptitude install zsh tmux neovim/neovim/neovim python3 ag reattach-to-user-namespace
sudo aptitude install zsh-antigen hyper

echo "-= Installing Fonts =-"
sudo aptitude install fonts-firacode

echo "-= Installing z.sh =-"
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/z.sh

echo "-= Assigning Zsh as Default Shell =-"
chsh -s $(which zsh)

echo "-= Upgrading Neovim with Python and Package Manager =-"
pip3 install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "-= Removing any existing configs =-"
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

echo "-= Creating necessary directories =-"
mkdir -p ~/.config ~/.config/nvim

echo "-= Creating necessary directories =-"
mkdir -p ~/.cconfig ~/.config/nvim

echo "-= Symlinking new configs =-"
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim

echo "-= Please log out and back in to see changes =-"
