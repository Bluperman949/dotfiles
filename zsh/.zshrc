HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
zstyle :compinstall filename '/home/chris/.zshrc'
autoload -Uz compinit
compinit

bindkey -v
bindkey "^[[H" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^?" backward-delete-char
bindkey "^[[3~" vi-delete-char
bindkey -a "^[[3~" vi-delete-char

export FZF_DEFAULT_OPTS='-m --preview="bat {} --color=always --theme=gruvbox-dark --style=header,grid" --no-mouse'
export FONTPREVIEW_BG_COLOR='#282828'
export FONTPREVIEW_FG_COLOR='#fbf1c7'
export FONTPREVIEW_PREVIEW_TEXT="the quick brown fox jumped over the lazy dog.\nTHE QUICK BROWN FOX JUMPED OVER THE LAZY DOG!?\n被リげでた回遺ノカヨ針\n!@#$%^&*()_+-={}[]|:;\"\'\\/<>\n\`1234567890~"
export FONTPREVIEW_FONT_SIZE=16
export KEYTIMEOUT=1
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'

alias grep='grep --color=auto'
alias ls='ls --color=auto --hyperlink=auto'
alias lls='ls -lArhG --color=always'
alias la='ls -A --color=always'
alias install='yay -S'
alias uninstall='yay -Rs'
alias update='yay -u'
alias tree='tree -Ca -I .git --filelimit=40'
alias v="nvim +'execute \"normal \<C-p>\"'"
alias findfont="fc-list ':' file | grep "
alias py="python"
alias alsamixer="alsamixer -BMV capture"

#eval "$(oh-my-posh init zsh -c "~/.config/.omp.json")"
autoload -Uz promptinit
promptinit
eval "$(starship init zsh)"

source ~/.spotify_player.sh
