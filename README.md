# Modern macOS Dotfiles

A modern, automated dotfiles setup optimized for macOS development with Ghostty, Neovim, and Zsh.

## ✨ Features

- **Modern CLI tools**: starship, eza, bat, ripgrep, fd, fzf, zoxide
- **Development setup**: Neovim with lazy.nvim, tmux with plugins
- **Terminal**: Ghostty configuration with Catppuccin theme
- **Package management**: Homebrew with Brewfile
- **Dotfile management**: Chezmoi for templating and deployment
- **One-command setup**: Clone and run!

## 🚀 Quick Start

```bash
git clone https://github.com/your-username/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

That's it! The script will:
1. Install Homebrew (if needed)
2. Install all packages from Brewfile
3. Set up chezmoi and apply dotfiles
4. Configure zsh as default shell
5. Set up Neovim plugins

## 📦 What's Included

### Core Tools
- **Terminal**: Ghostty with Catppuccin theme
- **Shell**: Zsh with modern features
- **Editor**: Neovim with lazy.nvim plugin manager
- **Multiplexer**: tmux with sensible defaults
- **Prompt**: Starship with custom configuration

### Modern CLI Replacements
- `ls` → `eza` (better file listing)
- `cat` → `bat` (syntax highlighting)
- `grep` → `ripgrep` (faster search)
- `find` → `fd` (user-friendly find)
- `cd` → `zoxide` (smart cd with history)

## 🎨 Customization

- **Theme**: Catppuccin Mocha throughout
- **Font**: Hack Nerd Font
- **Prompt**: Custom starship configuration
- **Vim**: Modern Neovim setup with LSP support

## 🔧 Manual Steps (if needed)

After installation:
1. Restart your terminal: `exec zsh`
2. Open Neovim: plugins will auto-install with lazy.nvim
3. Install tmux plugins: `<prefix> + I` (Ctrl-a + I)

## 📁 Structure

```
~/.dotfiles/
├── install.sh              # One-command installer
├── Brewfile                # Homebrew dependencies
├── .chezmoi.toml           # Chezmoi configuration
├── dot_zshrc               # Zsh configuration
├── dot_tmux.conf           # Tmux configuration
├── dot_ideavimrc           # IntelliJ Vim plugin
└── dot_config/
    ├── starship.toml       # Starship prompt
    ├── ghostty/            # Ghostty terminal
    └── nvim/               # Neovim configuration
```

## 🆕 For New Jobs

When starting a new job, just:
```bash
git clone https://github.com/your-username/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Your entire development environment will be ready in minutes!

## 🔄 Updates

To update your dotfiles:
```bash
cd ~/.dotfiles
git pull
chezmoi apply
```

## 🎮 Neovim Plugin Shortcuts

### Leader Key: `Space`

### Plugin Shortcuts
| Shortcut | Action | Plugin |
|----------|--------|---------|
| `<C-p>` | Find files | Telescope |
| `<leader>fg` | Live grep (search in files) | Telescope |
| `<C-n>` | Toggle file tree | Neo-tree |
| `K` | Show hover documentation | LSP |
| `<leader>gd` | Go to definition | LSP |
| `<leader>ca` | Code actions | LSP |
| `<leader>gf` | Format code | none-ls |

### Telescope (Fuzzy Finder)
- `<C-p>` - Find files quickly
- `<leader>fg` - Search text across all files
- `<Esc>` - Close telescope (while in insert mode)

### What Each Plugin Does
- **Telescope**: Fuzzy finder for files and text search
- **Neo-tree**: File explorer sidebar (shows hidden files)
- **LSP**: Language server support for Lua, TypeScript, JavaScript, HTML
- **none-ls**: Code formatting with Prettier and Stylua
- **nvim-cmp**: Auto-completion with snippets
- **Catppuccin**: Pretty Mocha theme
- **Alpha**: Nice startup screen
- **Lualine**: Status line at bottom

---

*Built with ❤️ using chezmoi, Homebrew, starship, and modern CLI tools*
