#!/bin/bash
echo "-= Installing System Dependencies =-"
sudo apt-get install aptitude
sudo aptitude install zsh 
sudo aptitude install tmux 
sudo aptitude install neovim 
sudo aptitude install python3 
sudo aptitude install ag 
sudo aptitude install python3
sudo aptitude install python3-pip
sudo aptitude install reattach-to-user-namespace
wget -q -O ~/.antigen.zsh git.io/antigen
sudo aptitude install hyper

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
ln -s ~/dotfiles/aliases ~/.bash_aliases

echo "-= Fixing gpg for WSL =-"
export GPG_TTY=$(tty)

echo "-= Please log out and back in to see changes =-"
