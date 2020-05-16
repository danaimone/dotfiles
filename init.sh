#!/bin/bash
echo "-= Installing System Dependencies =-"
apt install zsh tmux neovim python3 
apt install zsh-antigen
apt install hyper
echo "-= Installing Fonts =-"
brew tap caskroom/fonts
brew cask install font-fira-code

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
