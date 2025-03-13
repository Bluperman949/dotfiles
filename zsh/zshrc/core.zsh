HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# fzf
export FZF_DEFAULT_COMMAND='fd -t f'
export FZF_DEFAULT_OPTS="--no-mouse --color=16 --color=border:#32302f
                         --border=rounded --preview-window=border-none
                         --preview='show.sh {}'"
# bat
export BAT_THEME='gruvbox-dark'

# system
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
