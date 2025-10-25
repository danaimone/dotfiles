# Modern macOS Dotfiles

A modern, automated dotfiles setup optimized for macOS development with Ghostty, Neovim, and Zsh.

## ✨ Features

- **Modern CLI tools**: starship, eza, bat, ripgrep, fd, fzf, zoxide
- **Development setup**: Neovim with lazy.nvim, tmux with plugins
- **Terminal**: Ghostty configuration with Catppuccin theme
- **Package management**: Homebrew managed automatically via run_onchange script
- **Secrets management**: 1Password CLI with SSH agent integration
- **Dotfile management**: Chezmoi for templating and deployment
- **External dependencies**: Zsh plugins, vim-plug, and TPM managed via .chezmoiexternal.toml
- **One-command setup**: Truly automated from fresh install!

## 🚀 Quick Start

One command to set up everything:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply danaimone
```

That's it! This will:
1. Install chezmoi
2. Clone your dotfiles from GitHub
3. Install Homebrew (if needed)
4. Install all packages automatically
5. Apply all dotfiles
6. Set up zsh plugins, vim-plug, and TPM via external sources

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
4. **Configure SSH hosts**: Edit `~/.ssh/config` to add your actual server hostnames/IPs
   ```bash
   chezmoi edit ~/.ssh/config
   # Update the leaseweb and homelab host entries with your actual details
   chezmoi apply
   ```
5. **1Password SSH Setup**: Ensure 1Password is installed and SSH agent is enabled in 1Password settings

## 📁 Structure

```
~/.dotfiles/
├── run_onchange_before_install-packages-darwin.sh.tmpl  # Auto-installs Homebrew packages
├── .chezmoiexternal.toml   # External dependencies (zsh plugins, vim-plug, TPM)
├── .chezmoiignore          # Files to ignore
├── .chezmoi.toml           # Chezmoi configuration
├── dot_zshrc               # Zsh configuration
├── dot_tmux.conf           # Tmux configuration
├── dot_ideavimrc           # IntelliJ Vim plugin
├── private_dot_ssh/
│   └── config.tmpl         # SSH config with 1Password integration
└── dot_config/
    ├── starship.toml       # Starship prompt
    ├── ghostty/            # Ghostty terminal
    └── nvim/               # Neovim configuration
```

## 🆕 For New Jobs

When starting a new job, just:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply danaimone
```

Your entire development environment will be ready in minutes! No manual cloning or setup needed.

## 🔄 Updates

To update your dotfiles:
```bash
chezmoi update    # Pulls from git and applies changes
```

Or manually:
```bash
cd $(chezmoi source-path)
git pull
chezmoi apply
```

To refresh external dependencies (zsh plugins, vim-plug, TPM):
```bash
chezmoi apply --refresh-externals
# Or use the short form:
chezmoi apply -R
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
