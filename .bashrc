#!/bin/bash
echo running .bashrc

# This doesn't work on Mac, but does on RPi.
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
# Single quotes delay evaluation until each time prompt is output.
# Do this in /root/.bashrc too.
export PS1='\W\$ ' # sets bash shell prompt
#export PS1='\[\e[0;35m\]\h:\[\e[0;36m\]\w\[\e[0;32m\]$(__git_ps1 " [%s]")\[\e[m\]$ '
#export PS1='\[\e[0;36m\]\W\[\e[0;32m\]$(__git_ps1 " [%s]")\[\e[m\]$ '

#---------------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------------

alias bigfiles="find . -type f -size +1000k -exec ls -lk {} \; | awk '{print \$5, \$9}' | sort -nr +1 | head"
alias bigdirs="du -sk * | sort -nr | head"

alias cdangular='cd $JAVASCRIPT_DIR/AngularJS'
alias cdbmx='cd $BMX_DIR'
alias cddropbox='cd $DROPBOX_DIR'
alias cdjava='cd $JAVA_DIR'
alias cdjavascript='cd $JAVASCRIPT_DIR'
alias cdjug='cd $JAVA_DIR/JUG'
alias cdjq='cd $JQUERY_DIR'
alias cdjs='cd $JAVASCRIPT_DIR'
alias cdlanguages='cd $LANGUAGES_DIR'
alias cdmaritz='cd $MARITZ_DIR'
alias cdmyoci='cd $MYOCI_DIR'
alias cdnode='cd $JAVASCRIPT_DIR/Node.js'
alias cdoci='cd $OCI_DIR'
alias cdprogramming='cd $PROGRAMMING_DIR'
alias cdruby='cd $RUBY_DIR'
alias cdsett='cd $SETT_DIR'
alias cdtb='cd $TB_DIR'

alias cdtraining='cd $TRAINING_DIR'

# Ask for confirmation before overwriting or deleting files.
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# For a nicely formatted dump of LD_LIBRARY_PATH ...
alias eld="echo LD_LIBRARY_PATH :; echo -n '   ';echo \$LD_LIBRARY_PATH |sed 's/:/\n   /g'"

# Code printing (fancy two columns)
alias ens="enscript --borders --columns=2 --fancy-header --landscape --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp"
# --printer='LaserJet 1300n'"

alias findcss="find3 css"
alias findhtml="find3 html"
alias findjava="find3 java"
alias findjs="find3 js"
alias findless="find3 less"

# Display directories and executables in different colors.
#alias ls='ls --color=tty'
alias ls='ls -G'

# See MySQLNotes.txt for steps to start mysqld, the daemon.
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# Traceur for ES6
alias es6='traceur --experimental'

# For a nicely formatted dump of any path delimited with colons ...
# To use this enter "echo $PATH | nicepath".
alias nicepath="tr ':' '\n'"

# This is just like nicepath, but used when the path is delimited with spaces.
alias nicepathspaces="sed 's/ /\n   /g'"

alias sortedpath="ruby -e 'puts ENV[\"PATH\"].split(File::PATH_SEPARATOR).sort'"

#complete -C complete-ant-cmd.pl ant build.sh

# For Maritz earnPOWER
alias cdclient='cd $EP_DIR'
alias cdfeature='cd $EP_DIR/content/common/feature'
alias rs='mvn tomcat7:run'
alias rrs='mvn clean tomcat7:run'

#----------------------------------------------------------------------------

function setTitle {
  # Mac OS X Terminal
  echo -ne "\e]2;$@\a\e]1;$@\a";
}
typeset -fx setTitle
alias st=setTitle
