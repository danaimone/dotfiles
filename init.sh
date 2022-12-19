#!/bin/bash
echo "-= Installing System Dependencies =-"
brew install zsh tmux neovim/neovim/neovim python3 ag 
brew install antigen
brew install autojump
brew install starship
brew tap homebrew/cask
brew install reattach-to-user-namespace

echo "-= Installing Fonts =-"
brew tap homebrew/fonts
brew install --cask font-fira-code

echo "-= Installing oh-my-zsh =-"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "-= Installing z.sh =-"
curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/z.sh

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
ln -s "$(PWD)/zshrc" ~/.zshrc
ln -s "$(PWD)/tmux.conf" ~/.tmux.conf
ln -s "$(PWD)/vimrc" ~/.config/nvim/init.vim
ln -s "$(PWD)/ideavimrc" ~/.ideavimrc

echo "-= Please log out and back in to see changes =-"
