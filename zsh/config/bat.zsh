if command -v batcat &> /dev/null; then
  BAT_COMMAND=batcat
  alias bat=batcat
elif command -v bat &> /dev/null; then
  BAT_COMMAND=bat
fi

if [ -v BAT_COMMAND ]; then
  export MANPAGER="sh -c 'col -bx | $BAT_COMMAND -l man -p'"
  alias cat="$BAT_COMMAND --style=grid"
  alias preview="fzf --preview '$BAT_COMMAND --color \"always\" {}'"
fi
