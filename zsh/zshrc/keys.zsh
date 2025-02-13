bindkey -v

bindkey '^[[H' beginning-of-line  # home
bindkey '^[[F' end-of-line        # end
bindkey '^[[1;5C' forward-word    # C-right
bindkey '^[[1;5D' backward-word   # C-left

bindkey '^?' backward-delete-char # backspace
bindkey '^[[3~' vi-delete-char    # delete

bindkey '^P' down-line-or-history
bindkey '^N' up-line-or-history
bindkey '^R' history-incremental-search-backward

export KEYTIMEOUT=1
