function running_osx() {
  uname -a | grep -qi darwin
}

function running_linux() {
  uname -a | grep -qi linux
}

#
# Set up ssh keys
#
if running_linux; then
  eval `keychain --eval --quiet --quick --agents ssh`
  function add_all_ssh_keys() {
    ssh-add ~/.ssh/id_rsa
  }
  alias ssh="(ssh-add -l > /dev/null || add_all_ssh_keys ) && ssh"
fi


#
# Ignore duplicates and lines that start with spaces in bash history
#
HISTCONTROL=ignorespace:ignoredups

# Erlang history
export ERL_AFLAGS="-kernel shell_history enabled"

#
# vi command prompt
#
set -o vi

#
# Homebrew
#
if command -v sw_vers &>/dev/null; then
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
fi

#
# Colorful terminal
#
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
alias grep='grep --color'


#
# Prompt
#
NO_C='\[\033[00m\]'
GREEN='\[\033[00;32m\]'
BLUE='\[\033[00;34m\]'
YELLOW='\[\033[00;33m\]'
GITBRANCH='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\ \(\\\\\1\)/`'

PS1="$GREEN\u@\h$NO_C:[$BLUE\w$YELLOW$GITBRANCH$NO_C]\$ "

#
# Export
#
export AUTOFEATURE=true
export EDITOR='vim'
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

#
# Alias
#
if command -v lsb_release &>/dev/null ; then
  distribution=$(lsb_release -i)
  if [[ "$distribution" =~ Ubuntu ]]; then
    alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'
  fi
fi
alias dotfiles='cd ~/dotfiles'
alias rake='bundle exec rake'
alias cucumber='bundle exec cucumber'
alias rspec='bundle exec rspec'
alias cap='bundle exec cap'
alias pjson='python -mjson.tool'
alias dud='du -d 1 -h'
alias dush='du -sh .'
alias adb-screenshot='adb shell screencap -p | sed 's/\r$//' > screen.png'

if running_linux; then
  alias open='xdg-open'
fi

#
# Git autocomplete
#
source ~/dotfiles/git-complete.sh

#
# For custom scripts
#
export PATH=~/dotfiles/bin:$PATH

#
# Custom cds
#
_complete() {
  local cur folders opts temp
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  folders=`ls -p ~/prog/${1}`
  folders=`echo $folders | tr '/' " "`
  read -r -a folders <<< "${folders}"

  opts=""

  for i in "${!folders[@]}"; do
    folder=${folders[$i]}
    temp=`ls -p ~/prog/${1}/${folder}`
    temp=`echo $temp | tr '/' " "`
    read -r -a temp <<< "${temp}"

    opts+="${folder}/ "
    for i in "${!temp[@]}"; do
      opts+="${folder}/${temp[$i]} "
    done
  done

  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
  return 0
}

_scd() {
  _complete sl
}
scd() {
  cd ~/prog/sl/$1
}
complete -F _scd scd

complete -F _scd sl

_srcd() {
  _complete src
}
srcd() {
  cd ~/prog/src/$1
}
complete -F _srcd srcd

_pcd() {
  _complete personal
}
pcd() {
  cd ~/prog/personal/$1
}
complete -F _pcd pcd

complete -F _pcd pp

battery() {
  upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | cut -d : -f2 | sed -e 's/^[ \t]*//'
}

pg_schema() {
  pg_dump -s $1 > schema.sql
}

function tentimes() {
  for i in {1..10}; do "$@"; done
}

function hundredtimes() {
  for i in {1..100}; do "$@"; done
}
