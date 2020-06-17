alias -g L="| less"
alias -g G="| grep"
alias -g W="| wc -l"

alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias gst='git status'

alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# use coreutils `ls` if possible…
hash gls >/dev/null 2>&1 || alias gls="ls"

# Detect which `ls` flavor is in use
if gls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# ls options: F = put `/` after folders, h = byte unit suffixes, color! (even with piping to awk)
alias ls='CLICOLOR_FORCE=1 gls -Fh ${colorflag} --group-directories-first'

# List ALL files (colorized() in long format, show permissions in octal
alias la="ls -l | awk '
{
  k=0;
  for (i=0;i<=8;i++)
    k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));
  if (k)
    printf(\"%0o \",k);
  printf(\" %9s  %3s %2s %5s  %6s  %s %s %s\n\", \$3, \$6, \$7, \$8, \$5, \$9,\$10, \$11);
}'"

# List only directories
alias lsd='ls -l | grep "^d"'

# `cat` with beautiful colors. requires Pygments installed.
#                  sudo easy_install -U Pygments
# alias c='pygmentize -O style=monokai -f console256 -g'
alias c='colorize'


# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias dig="dig +nocmd any +multiline +noall +answer"

alias time=/usr/bin/time

alias no="2>/dev/null"
alias proxy="env https_proxy=http://localhost:8124 http_proxy=http://localhost:8124"
alias proxyon="export https_proxy=http://localhost:8124 && export http_proxy=http://localhost:8124"
alias proxyoff="unset https_proxy && unset http_proxy"

alias tasks="task list"

alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# alias nano='`brew --prefix nano`/bin/nano'

alias cat='bat --style=grid'
alias preview="fzf --preview 'bat --color \"always\" {}'"

# alias pip=pip3
alias python=python3
alias mux=tmuxinator
