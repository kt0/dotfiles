# get gzipped size
function gz () {
  for file in "$@"
  do
    size=$(cat "$file" | wc -c)
    gzipped=$(gzip -c "$file" | wc -c)
    echo "$file: $size, Gzipped: $gzipped, diff: $(($size - $gzipped))"
  done
}

# who is using the laptop's iSight camera?
camerausedby() {
    echo "Checking to see who is using the iSight camera… 📷"
    usedby=$(lsof | grep -w "AppleCamera\|USBVDC\|iSight" | awk '{printf $2"\n"}' | xargs ps)
    echo -e "Recent camera uses:\n$usedby"
}


# turn that video into webm.
# brew reinstall ffmpeg --with-libvpx
webmify(){
  ffmpeg -i $1 -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y $2 $1.webm
}


# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
st() {
  local files
  files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && subl "${files[@]}"
  unset IFS
}

show() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

task() {
  local TASK_PARAMS COMMAND ORIG
  COMMAND="command task"
  ORIG=1
  if [[ -n $1 ]]; then
    case $1 in
      add|annotate|append|count|delete|denotate|edit|modify|list|ls|rm|\
      active|blocked|blocking|completed|list|long|ls|minimal|newest|next|\
      oldest|overdue|ready|recurring|unblocked|waiting )
        ORIG=0
      ;;
    esac
  else
    ORIG=0
  fi
  if [ $ORIG -eq 0 ] && [[ -e ~/.task_params ]]; then
    COMMAND="$COMMAND $(cat ~/.task_params) $@"
  else
    COMMAND="$COMMAND $@"
  fi
  eval $COMMAND
}

gif_to_mp4 () {
  file=$1
  name=${file%.*}
  ffmpeg -i $file -c:v libx264 -pix_fmt yuv420p -movflags +faststart $name.mp4
}

# t () {
#   tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst -L ${1:-2} -aC $2
# }


t () {
  if [[ -n $1 ]]; then
    ssh taskulu-$@
  else
    ssh taskulu-app1
  fi
}

river () {
  if [[ -n $1 ]]; then
    ssh river-$@
  else
    ssh river-staging
  fi
}

# Schedule sleep in X minutes, use like: sleep-in 60
function sleep-in() {
  local minutes=$1
  local datetime=`/bin/date -v+${minutes}M +"%m/%d/%y %H:%M:%S"`
  sudo pmset schedule sleep "$datetime"
}
