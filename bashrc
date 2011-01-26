#
# Path
#
PATH=$PATH:/var/lib/gems/1.8/bin

#
# Prompt
#
NO_C='\[\033[00m\]'
GREEN='\[\033[00;32m\]'
BLUE='\[\033[00;34m\]'
YELLOW='\[\033[00;33m\]'
GITBRANCH='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\ \(\\\\\1\)/`'

PS1="$GREEN\u@\h$NO_C:[$BLUE\w$YELLOW$GITBRANCH$NO_C]\$ "

# Export
export AUTOFEATURE=true

# Alias
alias bookshare='cd ~/ruby/bookshare/'
alias upgrade='sudo aptitude update && sudo aptitude safe-upgrade'
alias raket='RAILS_ENV=test rake'

