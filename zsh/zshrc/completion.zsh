zstyle :compinstall filename '/home/chris/zshrc/completion.zsh'
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source <(fzf --zsh)
source "$HOME/.local/share/zsh/fzf-tab/fzf-tab.plugin.zsh"
