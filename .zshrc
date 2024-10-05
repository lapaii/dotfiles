# Set directory for zinit and its plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it isn't there
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

export GPG_TTY=$(tty)

# Prompt setup
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/mocha.json)"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

# Optimize zinit load time
zinit cdreplay -q

# Keybindings
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[3~' delete-char

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Aliases
alias ls='ls --color'
alias lsa='ls -a --color'
alias clear='clear && catnap'
alias grep='grep --color'
alias code='vscodium'
alias go='cargo-mommy'
alias htop='btop'
alias YAY='yay'

# Paths
export PATH="$HOME/.turso:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
export PATH="$HOME/go/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export GOPATH=$HOME/Documents/code/go/
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin

export CARGO_MOMMYS_ACTUAL="go"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# bun completions
[ -s "/home/lapaii/.bun/_bun" ] && source "/home/lapaii/.bun/_bun"

clear

# fnm
FNM_PATH="/home/lapaii/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/lapaii/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
