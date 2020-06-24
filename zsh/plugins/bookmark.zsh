export BOOKMARK_FILE="$HOME/.bookmarks"

[[ ! -f $BOOKMARK_FILE ]] && touch $BOOKMARK_FILE

function mark() {
  case $1 in
    -l )
      cat $BOOKMARK_FILE
      ;;
    -r )
      if [[ -z $2 ]]; then
        marks_to_delete=$(cat $BOOKMARK_FILE | fzf -m --bind=ctrl-o:accept,ctrl-t:toggle --tac)
        if [[ -n ${marks_to_delete} ]]; then
          while read -r line; do
            sed -i --follow-symlinks "\#${line}#d" $BOOKMARK_FILE
          done <<< "$marks_to_delete"
        fi
      else
        sed -i "\#^$2:#d" $BOOKMARK_FILE
      fi
      ;;
    * )
      echo $1:$(pwd) >> $BOOKMARK_FILE
      ;;
  esac
}

function jump() {
  local index jumpline bookmarks
  bookmarks=$(cat $BOOKMARK_FILE)
  if [[ -z $1 ]]; then
    jumpline=$(echo $bookmarks | fzf --bind=ctrl-o:accept --tac)
  else
    index=$(echo $bookmarks | grep -i "^.*$1.*:")
    if [ $(echo $index | wc -l) -eq 1 ]; then
      jumpline=$index
    else
      jumpline=$(echo $bookmarks | fzf --select-1 --bind=ctrl-o:accept --tac --query=$1)
    fi
  fi
  if [[ -n ${jumpline} ]]; then
    jumpdir=$(echo $jumpline | cut -d: -f2)
    cd ${jumpdir} && \
    sed -i --follow-symlinks "\#${jumpline}#d" $BOOKMARK_FILE && \
    echo ${jumpline} >> $BOOKMARK_FILE
  fi
  zle && zle reset-prompt
}

zle -N jump
bindkey '^g' jump

alias j=jump
