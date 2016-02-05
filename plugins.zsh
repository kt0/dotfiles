local P_ROOT=~/.kito/plugins

[ -d $P_ROOT/zsh-completions ] && fpath+=$P_ROOT/zsh-completions/src

[ -f $P_ROOT/fzf.zsh ] && source $P_ROOT/fzf.zsh
[ -f $P_ROOT/bookmark.zsh ] && source $P_ROOT/bookmark.zsh

[ -f $P_ROOT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
source $P_ROOT/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
