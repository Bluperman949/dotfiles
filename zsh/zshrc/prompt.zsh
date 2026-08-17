autoload -Uz promptinit
promptinit
eval "$(starship init zsh | sed "s/''/\"/g")"
