# Mac antigen file
source $(brew --prefix)/share/antigen/antigen.zsh

# Linking z
source ~/z.sh

# Disabling <<< NORMAL mode indicator
export RPS1="%{$reset_color%}"

# Loading oh-my-zsh's library
antigen use oh-my-zsh

# Bundles from default repo
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle npm
antigen bundle tmux
antigen bundle web-search
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Done loading bundles
antigen apply

# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# Make sure autojump is installed
[[ -s /Users/$HOME/.autojump/etc/profile.d/autojump.sh ]] && source /Users/$HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Setting up CTRL+R functionality
bindkey -v
bindkey '^R' history-incremental-search-backward

alias v=nvim

# Launch tmux
ZSH_TMUX_AUTOSTART=true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cdls() { cd "$@" && ls; }
dka() { docker kill $(docker ps -q) }

# Load theme
eval "$(starship init zsh)"

