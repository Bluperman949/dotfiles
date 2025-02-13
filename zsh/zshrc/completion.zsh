zstyle :compinstall filename '/home/chris/zshrc/completion.zsh'
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
