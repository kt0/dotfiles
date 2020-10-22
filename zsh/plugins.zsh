P_ROOT="$ZSH_ROOT/plugins"

fpath+=$P_ROOT/zsh-completions/src

source $P_ROOT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $P_ROOT/zsh-autosuggestions/zsh-autosuggestions.zsh

source $P_ROOT/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
