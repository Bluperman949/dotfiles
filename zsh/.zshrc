HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle :compinstall filename '/home/chris/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit

bindkey -v
bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[3~' vi-delete-char
bindkey '^[[3~' vi-delete-char
bindkey '^J' down-line-or-history
bindkey '^K' up-line-or-history
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

export FZF_DEFAULT_OPTS='-m --preview="bat {} --color=always --theme=gruvbox-dark --style=header,grid" --no-mouse'
export KEYTIMEOUT=1
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'

alias grep='grep --color=auto'
alias ls='ls --color=auto --hyperlink=auto'
alias lss='ls -lAhGS --color=always'
alias la='ls -A --color=always'
alias install='yay -S'
alias uninstall='yay -Rs'
alias update='yay -Syu'
alias tree='tree -Ca -I .git --filelimit=40'
alias findfont="fc-list ':' file | grep "
alias py='python'
alias alsamixer='alsamixer -BMV capture'
alias nvims="nvim -c 'so ~/.nvimsesh.vim'"
alias gitpush='git push --set-upstream origin'
alias gitt='git status'
alias gmit='git commit -m '
alias gog='git-graph -m simple'

#eval "$(oh-my-posh init zsh -c "~/.config/.omp.json")"
autoload -Uz promptinit
promptinit
eval "$(starship init zsh)"

source ~/.spotify_player.sh
