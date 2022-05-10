# zsh config
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

bindkey '^R' history-incremental-search-backward

# Exports
export EDITOR='vim'
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH=~/dotfiles/bin:$PATH

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color'
alias pjson='python -mjson.tool'
alias dud='du -d 1 -h'
alias dush='du -sh .'

running_linux() {
  uname -a | grep -qi linux
}

if running_linux; then
  eval `keychain --eval --quiet --quick --agents ssh`
  add_all_ssh_keys() {
    ssh-add ~/.ssh/id_rsa
  }
  alias ssh="(ssh-add -l > /dev/null || add_all_ssh_keys ) && ssh"
fi

# Custom Functions

pg_schema() {
  pg_dump -s $1 > schema.sql
}

pcd() {
  cd ~/prog/personal/$1
}

scd() {
  cd ~/prog/sl/$1
}

tentimes() {
  for i in {1..10}; do "$@"; done
}

hundredtimes() {
  for i in {1..100}; do "$@"; done
}
