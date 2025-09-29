#!/bin/bash

# Modern dotfiles installer using chezmoi
set -e

echo "🚀 Setting up your Mac development environment..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is designed for macOS only"
    exit 1
fi

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Install dependencies from Brewfile
echo "🍺 Installing packages from Brewfile..."
brew bundle --file="$(dirname "$0")/Brewfile"

# Install chezmoi if not present
if ! command -v chezmoi &> /dev/null; then
    echo "🏠 Installing chezmoi..."
    brew install chezmoi
fi

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Initialize chezmoi with our dotfiles
echo "⚙️  Setting up dotfiles with chezmoi..."
if [ ! -d ~/.local/share/chezmoi ]; then
    chezmoi init --source="$SCRIPT_DIR"
else
    echo "📁 Chezmoi already initialized"
fi

# Apply the dotfiles
echo "📋 Applying dotfiles..."
chezmoi apply

# Set zsh as default shell if not already set
if [[ "$SHELL" != "$(which zsh)" ]]; then
    echo "🐚 Setting zsh as default shell..."
    chsh -s $(which zsh)
fi

# Install vim-plug for neovim
echo "🔌 Setting up Neovim plugins..."
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install TPM (Tmux Plugin Manager)
echo "🔧 Setting up Tmux Plugin Manager..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "✅ Setup complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Restart your terminal or run: exec zsh"
echo "   2. Open nvim and run :PlugInstall to install vim plugins"
echo "   3. In tmux, press Ctrl-s + I to install tmux plugins"
echo ""
echo "🎉 Enjoy your new development environment!"