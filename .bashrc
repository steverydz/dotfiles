# Load aliases
if [ -f ~/.aliases ]; then
  [ -r ~/.aliases ] && source ~/.aliases
fi

# Custom bash prompt
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
CYAN="\[\033[0;36m\]"
RESET="\033[m"

function parse_git_dirty {
  if [ -d .git ]; then
    [[ -z $(git status --porcelain) ]] || echo "*"
  fi
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[$GREEN\]\u \[$RESET\]\[$RESET\]\[$CYAN\]\w\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" \[$RESET\]\")\[$RED\]\$(parse_git_branch)\[$RESET\] "

# Load nvm and nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=$HOME/.virtualenvs
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh