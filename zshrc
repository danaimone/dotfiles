# Linux antigen file
source ~/antigen.zsh

# Linking z
source ~/z.sh

# Disabling <<< NORMAL mode indicator
export RPS1="%{$reset_color%}"

# Loading oh-my-zsh's library
antigen use oh-my-zsh

# Load theme
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Bundles from default repo
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
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

# Syntax highlighting bundle

# Done loading bundles
antigen apply

spaceship_vi_mode_enable

# Load custom aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

[[ -s /Users/danaimone/.autojump/etc/profile.d/autojump.sh ]] && source /Users/danaimone/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Setting up CTRL+R functionality
bindkey -v
bindkey '^R' history-incremental-search-backward

# Launch tmux
ZSH_TMUX_AUTOSTART=true
