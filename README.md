# Cross-Platform Dotfiles

A modern, automated dotfiles setup for **macOS**, **Linux**, and **Windows** with Neovim, tmux, and Zsh.

## ✨ Features

- **Cross-platform**: Supports macOS, Linux (Ubuntu/Debian/Fedora/Arch), Windows (native + WSL)
- **Modern CLI tools**: starship, eza, bat, ripgrep, fd, fzf, zoxide
- **Development setup**: Neovim with lazy.nvim, tmux with plugins
- **Package management**: Automatic platform detection and package installation
- **Secrets management**: 1Password with SSH agent integration on all platforms
- **Dotfile management**: Chezmoi for templating and cross-platform deployment
- **External dependencies**: Zsh plugins, vim-plug, and TPM managed via .chezmoiexternal.toml
- **One-command setup**: Truly automated from fresh install!

## 🚀 Quick Start

One command to set up everything on any platform:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply danaimone
```

That's it! This will:
1. Install chezmoi
2. Clone your dotfiles from GitHub
3. Detect your platform (macOS/Linux/Windows/WSL)
4. Install the appropriate package manager packages
5. Apply all dotfiles with platform-specific configurations
6. Set up zsh plugins, vim-plug, and TPM via external sources

## 📦 What's Included

### Core Tools (All Platforms)
- **Shell**: Zsh with modern plugins and completions
- **Editor**: Neovim with lazy.nvim plugin manager and LSP support
- **Multiplexer**: tmux with sensible defaults and plugin manager
- **Prompt**: Starship with custom configuration
- **Version Control**: Git with modern aliases

### Modern CLI Replacements
- `ls` → `eza` (better file listing)
- `cat` → `bat` (syntax highlighting)
- `grep` → `ripgrep` (faster search)
- `find` → `fd` (user-friendly find)
- `cd` → `zoxide` (smart cd with history)

### Platform-Specific
- **macOS**: Ghostty terminal, Homebrew packages
- **Linux**: Distribution-appropriate packages (apt/dnf/pacman), Ghostty via snap/native
- **Windows**: winget packages, Windows Terminal, PowerShell 7
- **WSL**: Linux tools with Windows 1Password SSH agent integration

## 💻 Platform-Specific Setup

### macOS

The setup automatically installs:
- Homebrew (if not present)
- Ghostty terminal
- 1Password and 1Password CLI
- All modern CLI tools
- Nerd Fonts

**Post-install:**
1. Enable 1Password SSH agent in **1Password → Settings → Developer → SSH Agent**
2. Restart your terminal

### Linux (Ubuntu/Debian/Fedora/Arch)

The setup automatically:
- Detects your distribution
- Uses the appropriate package manager (apt/dnf/pacman)
- Installs 1Password from official repos (NOT snap for SSH agent support)
- Installs Ghostty (via snap on Ubuntu, native on Arch)
- Installs all development tools

**Post-install:**
1. Install 1Password desktop app if not auto-installed
2. Enable SSH agent in 1Password settings
3. Restart your terminal

### Windows (Native)

The setup automatically:
- Uses winget to install packages
- Installs Windows Terminal
- Installs PowerShell 7
- Installs 1Password
- Installs modern CLI tools (Windows versions)

**Post-install:**
1. Enable 1Password SSH agent in **Settings → Developer → SSH Agent**
2. Restart Windows Terminal
3. Set your default shell in Windows Terminal settings

### Windows (WSL)

The setup automatically:
- Detects WSL environment
- Installs Linux tools in WSL
- Configures SSH to use Windows 1Password agent via ssh.exe
- Skips GUI apps (use Windows Terminal from Windows)

**Requirements:**
- Windows 10 1809+ or Windows 11
- WSL 2
- 1Password for Windows installed on host with SSH agent enabled

**Post-install:**
1. Ensure 1Password for Windows is running
2. Verify SSH agent is enabled in 1Password Windows app
3. Test SSH: `ssh-add -l` should list your 1Password SSH keys

## 🔧 Post-Installation Steps

### 1. Enable 1Password CLI Integration

The SSH config pulls connection details from 1Password automatically. Enable CLI integration:

1. Open 1Password desktop app
2. Go to **Settings → Developer**
3. Enable **"Integrate with 1Password CLI"**
4. Enable **"Use the SSH agent"**

The setup script will check this and provide instructions if needed.

### 2. Configure SSH Hosts in 1Password

SSH connection details are stored in 1Password SSH Key items. To add your servers:

1. Create an SSH Key item in 1Password (or use existing)
2. Add these custom fields:
   - **IP** (text): Server IP address
   - **username** (text): SSH username
   - **SSH Port** (text): SSH port number
3. Update the SSH config template to reference your 1Password items:
```bash
chezmoi edit ~/.ssh/config
# Add host entries that reference your 1Password items
# Example: {{ onepasswordRead "op://Personal/Your SSH Key/IP" }}
chezmoi apply
```

Pre-configured hosts (if you have matching 1Password items):
- `ssh leaseweb` - Leaseweb dedicated server
- `ssh homelab` or `ssh proxmox` - Home Proxmox server

### 3. Verify 1Password SSH Agent

Test that SSH agent is working:
```bash
# Should list your SSH keys from 1Password
ssh-add -l
```

### 4. Set Zsh as Default Shell (Linux/WSL)

```bash
chsh -s $(which zsh)
```

### 5. Restart Terminal

```bash
# macOS/Linux/WSL
exec zsh

# Windows: Close and reopen Windows Terminal
```

### 6. Install Neovim Plugins

Plugins auto-install on first Neovim launch:
```bash
nvim
# Wait for lazy.nvim to install plugins
```

### 7. Install Tmux Plugins

Inside tmux:
```
<prefix> + I    # Ctrl-a + I (or Ctrl-b + I depending on config)
```

## 📁 Structure

```
~/dotfiles/
├── dot_config/
│   ├── chezmoi/
│   │   └── chezmoi.toml.tmpl           # Platform detection and config
│   ├── nvim/                           # Neovim configuration (cross-platform)
│   ├── ghostty/                        # Ghostty terminal config (macOS/Linux)
│   └── starship.toml                   # Starship prompt (cross-platform)
├── private_dot_ssh/
│   └── config.tmpl                     # SSH config with platform-specific 1Password paths
├── run_onchange_before_install-packages-linux.sh.tmpl          # Linux package installer
├── run_onchange_before_install-packages-windows-wsl.sh.tmpl    # WSL package installer
├── run_onchange_before_install-packages-windows.ps1.tmpl       # Windows package installer
├── .chezmoiexternal.toml               # External dependencies (plugins, etc.)
├── .chezmoiignore                      # Ignored files
├── dot_zshrc                           # Zsh configuration (cross-platform)
├── dot_tmux.conf                       # Tmux configuration (cross-platform)
└── dot_ideavimrc                       # IntelliJ Vim plugin (cross-platform)
```

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

## 🌿 Branch Structure

- **master**: Cross-platform dotfiles (Linux, Windows, WSL)
- **macOS**: macOS-optimized dotfiles with Homebrew-specific features

Use the appropriate branch for your primary platform, or use master for maximum portability.

## 🎮 Neovim Plugin Shortcuts

### Leader Key: `Space`

### Essential Shortcuts
| Shortcut | Action | Plugin |
|----------|--------|---------|
| `<C-p>` | Find files | Telescope |
| `<leader>fg` | Live grep (search in files) | Telescope |
| `<C-n>` | Toggle file tree | Neo-tree |
| `K` | Show hover documentation | LSP |
| `<leader>gd` | Go to definition | LSP |
| `<leader>ca` | Code actions | LSP |
| `<leader>gf` | Format code | none-ls |

### What Each Plugin Does
- **Telescope**: Fuzzy finder for files and text search
- **Neo-tree**: File explorer sidebar (shows hidden files)
- **LSP**: Language server support for multiple languages
- **none-ls**: Code formatting with Prettier and Stylua
- **nvim-cmp**: Auto-completion with snippets
- **Catppuccin**: Pretty Mocha theme
- **Alpha**: Nice startup screen
- **Lualine**: Status line at bottom

## 🛠️ Troubleshooting

### SSH Agent Not Working

**macOS:**
- Verify 1Password is installed and running
- Check Settings → Developer → SSH Agent is enabled
- Socket path: `~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock`

**Linux:**
- 1Password must be installed from official repos, NOT snap/flatpak
- Check `~/.1password/agent.sock` exists
- Restart 1Password if needed

**WSL:**
- Ensure 1Password for Windows is running
- Verify SSH agent is enabled in Windows 1Password
- Test from WSL: `ssh-add -l`
- If issues, verify `ssh.exe` is in PATH

### Package Installation Fails

**Linux:**
- Run `sudo apt update` (Ubuntu/Debian) or equivalent for your distro
- Check internet connection
- Verify GPG keys are imported correctly

**Windows:**
- Ensure winget is installed (comes with Windows 11, available for Windows 10)
- Run Windows Terminal as Administrator if permission issues

### Zsh Plugins Not Loading

- Run `chezmoi apply --refresh-externals` to download plugins
- Check `~/.oh-my-zsh/custom/plugins/` contains the plugins
- Restart shell: `exec zsh`

## 📝 Customization

### Adding Your Own Aliases

Edit `~/.zshrc` via chezmoi:
```bash
chezmoi edit ~/.zshrc
# Add your aliases
chezmoi apply
```

### Adding More SSH Hosts

Edit SSH config:
```bash
chezmoi edit ~/.ssh/config
# Add new host entries
chezmoi apply
```

### Platform-Specific Customizations

Use chezmoi templates in any file:
```bash
{{- if eq .chezmoi.os "darwin" }}
# macOS-specific config
{{- else if eq .chezmoi.os "linux" }}
# Linux-specific config
{{- end }}
```

---

*Built with ❤️ using chezmoi, modern CLI tools, and cross-platform best practices*
