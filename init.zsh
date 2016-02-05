function load () {
	for script in "$@"
	do
		source ~/.kito/$script.zsh
	done
}

load zsh
load exports aliases functions
load rbenv
load plugins

if [[ -d ~/.kito/my ]]; then
  for file in ~/.kito/my/*.zsh; do
    source $file
  done
fi

source ~/.kito/k-theme.zsh

unset -f load
