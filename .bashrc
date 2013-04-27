#!/bin/bash
#echo running .bashrc

# Source global definitions.
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Sets the bash shell prompt.
# This overrides the setting in /etc/bashrc.
# \h outputs the host name.
# \W outputs the working directory.
# \w outputs the full working directory.
# \$ outputs # if superuser (like root), $ otherwise.
# Single quotes delay evaluation until each time prompt is output.
# Do this in /root/.bashrc too.
#export PS1='\W\$ ' # sets bash shell prompt
#export PS1='\[\e[0;35m\]\h:\[\e[0;36m\]\w\[\e[0;32m\]$(__git_ps1 " [%s]")\[\e[m\]$ '
export PS1='\[\e[0;36m\]\W\[\e[0;32m\]$(__git_ps1 " [%s]")\[\e[m\]$ '

#---------------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------------

alias bigfiles="find . -type f -size +1000k -exec ls -lk {} \; | awk '{print \$5, \$9}' | sort -nr +1 | head"
alias bigdirs="du -sk * | sort -nr | head"

alias cdbmx='cd $BMX_DIR'
alias cdclojure='cd $CLOJURE_DIR'
alias cdcoffeescript='cd $COFFEESCRIPT_DIR'
alias cdcss='cd $CSS_DIR'
alias cdjava='cd $JAVA_DIR'
alias cdjavascript='cd $JAVASCRIPT_DIR'
alias cdjug='cd $JAVA_DIR/JUG'
alias cdjq='cd $JQUERY_DIR'
alias cdjs='cd $JAVASCRIPT_DIR'
alias cdlanguages='cd $LANGUAGES_DIR'
alias cdmyoci='cd $MYOCI_DIR'
alias cdnode='cd $JAVASCRIPT_DIR/Node.js'
alias cdprogramming='cd $PROGRAMMING_DIR'
alias cdruby='cd $RUBY_DIR'
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

complete -C complete-ant-cmd.pl ant build.sh

#----------------------------------------------------------------------------

function setTitle {
  # Mac OS X Terminal
  echo -ne "\e]2;$@\a\e]1;$@\a";
}
typeset -fx setTitle
alias st=setTitle
