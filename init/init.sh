#! /usr/bin/env bash

DOTFILES_ROOT=$(dirname "$(dirname "$(readlink -fm "$0")")")

ln -s "$DOTFILES_ROOT"/conf/gemrc "$HOME"/.gemrc
ln -s "$DOTFILES_ROOT"/conf/taskrc "$HOME"/.taskrc
ln -s "$DOTFILES_ROOT"/conf/nanorc "$HOME"/.nanorc
ln -s "$DOTFILES_ROOT"/conf/youtube-dl "$HOME"/youtube-dl.conf
ln -s "$DOTFILES_ROOT"/conf/wgetrc "$HOME"/.wgetrc
ln -s "$DOTFILES_ROOT"/conf/tmux.conf "$HOME"/.tmux.conf.local
ln -s "$DOTFILES_ROOT"/conf/alacritty "$HOME"/.config/alacritty
ln -s "$DOTFILES_ROOT"/packages/tmux.gpakosz/.tmux.conf "$HOME"/.tmux.conf
ln -s "$DOTFILES_ROOT"/packages/diff-so-fancy/diff-so-fancy "$HOME"/bin/diff-so-fancy
ln -s "$DOTFILES_ROOT"/packages/PathPicker/fpp "$HOME"/bin/fpp

##################
# Prepend to file
##################

prepend () {
  local FILE=$1
  local CONTENT=$2
  if [[ -f $FILE ]]; then
    printf "%s\n\n$(cat "$FILE")" "$CONTENT" > "$FILE"
  else
    echo "$CONTENT" > "$FILE"
  fi
}

##################
# Add zsh configs
##################

prepend "$HOME"/.zshrc \
"export ZSH=$DOTFILES_ROOT/packages/ohmyzsh
export DOTFILES_ROOT=$DOTFILES_ROOT
source '$DOTFILES_ROOT/conf/zshrc'"

##################
# Add Git configs
##################
GITCONFIG_FILE=$HOME/.gitconfig

prepend "$GITCONFIG_FILE" \
"[include]
  path = $DOTFILES_ROOT/git/gitconfig"

# Rename master to main in git
cp -r /usr/share/git-core/templates ~/Templates/git.git
echo 'ref: refs/heads/main' > ~/Templates/git.git/HEAD
git config --global init.templateDir "$HOME/Templates/git.git"

##################
# Apt configuration
##################
sudo ln -s "$DOTFILES_ROOT"/conf/apt.conf /etc/apt/apt.conf.d/00-my.conf

##################
# Install fzf (we use git submodules for fzf)
##################
exec "$DOTFILES_ROOT"/packages/fzf/install

##################
# Install tmux (we use git submodules for tmux)
##################
pushd $DOTFILES_ROOT/packages/tmux
sh autogen.sh
./configure && make
sudo make install
popd
