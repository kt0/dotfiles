export EDITOR=nano
export VISUAL="subl -w"

export PATH="$PATH:/usr/local/sbin"

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH=$PATH:~/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$DOTFILES_ROOT/bin
# export MANPATH="/usr/local/man:$MANPATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# history
export SAVEHIST=1000000

# Nope, I don't want in anyway see analytics in my terminal
export HOMEBREW_NO_ANALYTICS=1
# Nope, brew people, please don't add more shitty options and variables!
export HOMEBREW_NO_AUTO_UPDATE=1

# export GIT_DIFF_OPTS=-u1

export FZF_BASE="$DOTFILES_ROOT"/packages/fzf/
