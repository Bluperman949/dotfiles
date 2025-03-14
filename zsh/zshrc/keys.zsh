bindkey -v

bindkey '^[[H' beginning-of-line  # home
bindkey '^[[F' end-of-line        # end
bindkey '^[[1;5C' forward-word    # C-right
bindkey '^[[1;5D' backward-word   # C-left

bindkey '^?' backward-delete-char       # backspace
bindkey -M vicmd '^[[3~' vi-delete-char # delete {n}

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# unbind easy accidental presses
bindkey -r '^K' 
bindkey -r '^J' 
bindkey -r '^H' 
bindkey -M vicmd -r '~'

export KEYTIMEOUT=1
