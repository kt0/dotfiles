#! /usr/bin/env bash

if (( "$EUID" == 0 ))
  then echo "Don't run as root"
  exit
fi

packages=(
  com.github.tchx84.Flatseal
  org.gtk.Gtk3theme.Breeze
  org.nomacs.ImageLounge
)

flatpak install $packages
