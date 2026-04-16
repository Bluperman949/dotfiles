alias show='~/.dotfiles/zsh/scripts/show.sh'
alias bh='~/.dotfiles/zsh/scripts/bhelp.sh'
alias listen='~/.dotfiles/zsh/scripts/listen.sh'

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lss='ls -lAhGS --color=always'
alias la='ls -A --color=always'
alias cu='cd ..'
alias tree='tree -Ca -I .git --filelimit=40'

alias p='sudo pacman'

alias gitpush='git push --set-upstream origin'
alias gitt='git status'
alias gmit='git commit -m '
alias gog='git-graph -m simple -n 40'
alias gogl='git-graph -m simple'
alias gogh="git log --format='%H %s' -n 10"

alias py='python'
alias gw='./gradlew'
alias zb='zig build'
alias zbl='zig build -l'

alias vconf='cd ~/.config/nvim; nvim'
alias lndot='~/.dotfiles/lndot.sh'

alias findfont="fc-list ':' file | grep -i"
alias alsamixer='alsamixer -BMV capture'
