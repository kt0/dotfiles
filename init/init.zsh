#! /usr/bin/env zsh

DIR=$(dirname ${BASH_SOURCE:-$0})
PARENT_DIR="$PWD/$(dirname $DIR)"

ln -s $PARENT_DIR/conf/zshrc $HOME/.zshrc
ln -s $PARENT_DIR/conf/gemrc $HOME/.gemrc
ln -s $PARENT_DIR/conf/taskrc $HOME/.taskrc
ln -s $PARENT_DIR/conf/nanorc $HOME/.nanorc
ln -s $PARENT_DIR/conf/wgetrc $HOME/.wgetrc
ln -s $PARENT_DIR/conf/tmux.conf $HOME/.tmux.conf.local
ln -s $PARENT_DIR/packages/tmux/.tmux.conf $HOME/.tmux.conf

GITCONFIG_FILE=$HOME/.gitconfig

echo """[include]
  path = $PARENT_DIR/git/gitconfig

$(cat $GITCONFIG_FILE)
""" > $GITCONFIG_FILE

# Rename master to main in git
cp -r /usr/share/git-core/templates ~/Templates/git.git
echo 'ref: refs/heads/main' > ~/Templates/git.git/HEAD
git config --global init.templateDir '~/Templates/git.git'

sudo ln -s `pwd`/.kito/conf/apt.conf /etc/apt/apt.conf.d/00-my.conf
