if status is-interactive
    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config $HOME/.config/ohmyposh/mocha.json | source

    alias ls='ls --color'
    alias lsa='ls -a --color'
    alias clear='clear && catnap'
    alias grep='grep --color'
    alias code='vscodium'
    alias go='cargo-mommy'
    alias htop='btop'
    alias YAY='yay'
    alias YIPPEE='yay'

    export PATH="$HOME/.turso:$PATH"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="$HOME/.cargo/env:$PATH"
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
    export GOPATH="$HOME/Documents/code/go/"
    export PATH="$GOPATH/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export CARGO_MOMMYS_ACTUAL="go"
    export PATH="$HOME/.local/share/fnm:$PATH"

    fnm env | source

    zoxide init fish | source

    catnap
end
