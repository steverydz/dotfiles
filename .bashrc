# Load aliases
if [ -f ~/.aliases ]; then
  [ -r ~/.aliases ] && source ~/.aliases
fi

# Load functions
if [ -f ~/.functions ]; then
  [ -r ~/.functions ] && source ~/.functions
fi

# Custom bash prompt
RED="\[\033[0;31m\]"
GREEN="\[\033[0;92m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
RESET="\033[m"

function parse_git_dirty {
  if [ -d .git ]; then
    if [[ -z $(git status --porcelain) ]]; then
      echo -e '\033[m''\033[031m'"\1"'\033[m'
    else
      echo -e '\033[m''\033[031m'"\1"'\033[m' '\033[0;33m'"*"'\033[m'
    fi
  fi
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/$(parse_git_dirty)/"
}

export PS1="\[$RESET\]\[$RESET\]\[$GREEN\]\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" \[$RESET\]\")\$(parse_git_branch)\[$RESET\] "

# Load nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
