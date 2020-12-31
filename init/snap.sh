#! /usr/bin/env bash

if (( "$EUID" != 0 ))
  then echo "Please run as root"
  exit
fi

packages=(
  telegram-desktop
  foliate
  snap-store
  discord
  gimp
  inkscape
  peek
  flameshot
  gwenview
  obs-studio
  qogir-themes
)

snap install $packages

snap connect discord:system-observe

echo "Follow instructions on: https://snapcraft.io/obs-studio\n"

echo "Follow instructions on: https://snapcraft.io/qogir-themes\n"
