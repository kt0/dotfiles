#! /usr/bin/env bash

##################
# Link proxy.pac file in
##################
PACFILE=$HOME/proxy.pac
TARGET_FILE=$DOTFILES_ROOT/extensions/set-pac-from-file/my_pac_script.js
if [[ -f $PACFILE ]]; then
  if [[ -f $TARGET_FILE ]]; then
    echo "Pac symlink already exists: linked to $(readlink -f $TARGET_FILE)"
  else
    ln -s $HOME/proxy.pac $TARGET_FILE
  fi
else
  echo "File not found: $PACFILE"
fi
