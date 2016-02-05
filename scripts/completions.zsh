#! /usr/bin/env zsh

# Generate npm completions
npm completion > .kito/my/completions/_npm

# Move brew completions
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions/_brew
