CURRENT_RUBY="%{$fg[white]%}{%{$fg[red]%}\$(ruby_prompt_info)%{$fg[white]%}}%{$reset_color%}"

PROMPT="%F{green}%2c%F{cyan} >%f "
RPROMPT="\$(git_prompt_status)\$(git_prompt_info) $CURRENT_RUBY %F{green}%D{%L:%M} %F{yellow}%D{%p}%f"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""


ZSH_THEME_GIT_PROMPT_MODIFIED="%F{orange}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}✖ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{cyan}§ "
ZSH_THEME_GIT_PROMPT_AHEAD="%F{cyan}𝝙 "


function git_prompt_status() {
  local INDEX STATUS CHANGED IS_DELETED
  INDEX=$(command git status --porcelain -b 2> /dev/null)
  STATUS=""
  CHANGED=0
  IS_DELETED=0

  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    CHANGED=1
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    CHANGED=1
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    CHANGED=1
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    CHANGED=1
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    CHANGED=1
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    CHANGED=1
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    IS_DELETED=1
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    IS_DELETED=1
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    IS_DELETED=1
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi
  if $(echo "$INDEX" | grep '^## .*diverged' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  fi
  if [ $CHANGED -eq 1 ]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_MODIFIED"
  fi
  if [ $IS_DELETED -eq 1 ]; then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_DELETED"
  fi
  echo $STATUS
}


function rbenv_prompt_info() {
  if [[ -f $(pwd)/.ruby-version ]]; then
    cat $(pwd)/.ruby-version
  else
    echo "$(rbenv version-name)"
  fi
}
