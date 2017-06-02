#!/bin/bash
echo running .bashrc

# This doesn't work on Mac, but does on Raspberry Pi.
#xmodmap ~/.xmodmap

# Source global definitions.
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Disable start/stop output control so
# ctrl-s can be used in Vim to save and
# ctrl-q can be used by unimpaired plugin.
stty -ixon

# Sets the bash shell prompt.
# This overrides the setting in /etc/bashrc.
# \h outputs the host name.
# \W outputs the working directory.
# \w outputs the full working directory.
# \$ outputs # if superuser (like root), $ otherwise.
# Black=0;30       Dark Gray=1;30
# Red=0;31         Light Red=1;31
# Green=0;32       Light Green=1;32
# Brown=0;33       Yellow=1;33
# Blue=0;34        Light Blue=1;34
# Purple=0;35      Light Purple=1;35
# Cyan=0;36        Light Cyan=1;36
# Light Gray=0;37  White=1;37
# 0 resets to default
# Single quotes delay evaluation until each time prompt is output.
# Do this in /.bashrc too?
export PS1='\[\033[1;34m\]\w\[\033[1;33m\]$(__git_ps1)\[\033[0m\]\n🏃  '

#---------------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------------

alias bigfiles="find . -type f -size +1000k -exec ls -lk {} \; | awk '{print \$5, \$9}' | sort -nr +1 | head"
alias bigdirs='du -sk * | sort -nr | head'

alias cddropbox='cd $DROPBOX_DIR'
alias cdjava='cd $JAVA_DIR'
alias cdjavascript='cd $JAVASCRIPT_DIR'
alias cdjs='cd $JAVASCRIPT_DIR'
alias cdlanguages='cd $LANGUAGES_DIR'
alias cdmaritz='cd $MARITZ_DIR'
alias cdmyoci='cd $MYOCI_DIR'
alias cdnode='cd $JAVASCRIPT_DIR/Node.js'
alias cdnotes='cd ~/MyUnixEnv/notes'
alias cdoci='cd $OCI_DIR'
alias cdprogramming='cd $PROGRAMMING_DIR'
alias cdrga='cd $RGA_DIR'
alias cdsett='cd $SETT_DIR'
alias cdtraining='cd $TRAINING_DIR'
alias cdvim='cd $PROGRAMMING_DIR/Tools/Vim'

# Git aliases
alias br='git branch'
alias ci='git commit -av'
alias co='git checkout'
alias log='git log'
alias pull='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias push='git push origin `git rev-parse --abbrev-ref HEAD`'
alias pushn='git push --no-verify origin `git rev-parse --abbrev-ref HEAD`'
alias sha='git rev-parse HEAD'
alias status='git status'
# status report from git commits
alias sr='git log --author="Volkmann" --branches --no-merges --since="8 days ago" --pretty=format:"%cd %s" | tac'

# Ask for confirmation before overwriting or deleting files.
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# For a nicely formatted dump of LD_LIBRARY_PATH ...
alias eld="echo LD_LIBRARY_PATH :; echo -n '   ';echo \$LD_LIBRARY_PATH |sed 's/:/\n   /g'"

# Code printing (fancy two columns)
alias ens="enscript --borders --columns=2 --fancy-header --landscape --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp"
alias ens1="enscript --borders --fancy-header --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp -L63"

alias findcss='find3 css'
alias findhtml='find3 html'
alias findhtml1='find-depth-1 html'
alias findjava='find3 java'
alias findjs='find3 js*'
alias findjs2='find4 js*'
alias findjson='find3 json'
alias findless='find3 less'
alias findscss='find3 scss'

# ESLint aliases
alias esl='clear; eslint -f codeframe **/*.js'
# Fix ESLint issues in a JavaScript file, including adding missing semicolons.
# ex. fixsemi some-name.js
alias fixsemi="eslint --fix --rule 'semi: [2, always]'"
# Fix ESLint issues in a JavaScript file, including removing unnecessary semicolons.
# ex. fixnosemi some-name.js
alias fixnosemi="eslint --fix --rule 'semi: [2, never]'"

# Goes to root directory of current git repo.
alias cdgitroot='cd `git rev-parse --git-dir`; cd ..'

# Display directories and executables in different colors.
#alias ls='ls --color=tty'
alias ls='ls -G'

# See MySQLNotes.txt for steps to start mysqld, the daemon.
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# For a nicely formatted dump of any path delimited with colons ...
# To use this enter "echo $PATH | nicepath".
alias nicepath="tr ':' '\n'"

# This is just like nicepath, but used when the path is delimited with spaces.
alias nicepathspaces="sed 's/ /\n   /g'"

alias sortedpath="ruby -e 'puts ENV[\"PATH\"].split(File::PATH_SEPARATOR).sort'"

#complete -C complete-ant-cmd.pl ant build.sh

# Kill the process listening on a given port.
alias klp="kill-listening-process"

# For React Native
alias rna="react-native run-android"
alias rni="react-native run-ios"

# For Web Components and Polymer
alias pe='clear; eslint -f codeframe *.html demo/*.html test/*.html'
alias pew='clear; esw -w *.html demo/*.html test/*.html'
alias pl='clear; polylint demo/index.html'
alias plr='clear; livereload "*.html, demo/*.html, test/*.html"'
alias pso='clear; polymer serve -o'

# For Monsanto Capacity Planning
# Run "mvn install" before running "apiserver".
alias apiserver='java -jar target/capacity-ontap-api.war --spring.profiles.active=local,sample'
alias cdapi='cd ~/Monsanto/launchpad-api'
alias cdui='cd ~/Monsanto/launchpad-ui'
alias cos='~/Monsanto/bin/capacity-ontap-server'
alias dockup='cd ~/Monsanto/capacity-ontap-api; docker-compose up -d'
alias dockdown='cd ~/Monsanto/capacity-ontap-api; docker-compose down'
alias dockin='docker exec -it capacity-api /bin/bash'
alias pgstart='pg_ctl -D /usr/local/var/postgres start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -m fast'
#alias psqlin='psql -Ucapacity_ontap_api_admin -dpostgres'
alias psqlin='docker exec -it capacity-api psql -Ucapacity_ontap_api_admin -dcapacity_ontap'
alias swagger='open http://localhost:8080/swagger-ui.html'
alias uiserver='cd ~/Monsanto/capacity-ontap-ui; npm run local'

#----------------------------------------------------------------------------

function setTitle {
  # Mac OS X Terminal
  echo -ne "\e]2;$@\a\e]1;$@\a";
}
typeset -fx setTitle
alias st=setTitle

#source ~/.nvm/nvm.sh

export PATH="$HOME/.yarn/bin:$PATH"

if [[ -f $HOME/secret.sh ]]; then
  source $HOME/secret.sh
fi
if [[ -f $HOME/secrets/local.env ]]; then
  source $HOME/secrets/local.env
fi
