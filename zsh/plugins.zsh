P_ROOT="$ZSH_ROOT/plugins"

[ -d $P_ROOT/zsh-completions ] && fpath+=$P_ROOT/zsh-completions/src

[ -f $P_ROOT/bookmark.zsh ] && source $P_ROOT/bookmark.zsh

[ -f $P_ROOT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
source $P_ROOT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# [ -f $P_ROOT/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
# source $P_ROOT/zsh-autosuggestions/zsh-autosuggestions.zsh

# [ -f $P_ROOT/zsh-history-substring-search/zsh-history-substring-search.zsh ] && \
# source $P_ROOT/zsh-history-substring-search/zsh-history-substring-search.zsh
