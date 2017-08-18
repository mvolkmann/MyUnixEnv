#!/usr/local/bin/fish
# Configuration for the Friendly Interactive Shell (fish)

# Avoid adding the same thing to PATH
# each time an interactive shell is created.
#if status --is-interactive
if status --is-login
  echo running .config/fish/config.fish
  # If not already in PATH, add $HOME/bin.
  if not contains $HOME/bin $PATH
    set PATH $HOME/bin $PATH
  end
end


# Disable start/stop output control so
# ctrl-s can be used in Vim to save and
# ctrl-q can be used by unimpaired plugin.
stty -ixon

# Suppress the default greeting of
# "Welcome to fish, the friendly interactive shell"
set fish_greeting ''

#---------------------------------------------------------------------------
# Abbreviations
#---------------------------------------------------------------------------

# For git
abbr --add br git branch
abbr --add ci git commit -av
abbr --add co git checkout
abbr --add log git log
abbr --add nr npm run
abbr --add status git status

#---------------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------------

alias bigfiles "find . -type f -size +1000k -exec ls -lk {} \; | awk '{print \$5, \$9}' | sort -nr +1 | head"
alias bigdirs 'du -sk * | sort -nr | head'

alias cddropbox 'cd $DROPBOX_DIR'
alias cdelm 'cd $PROGRAMMING_DIR/languages/Elm'
alias cdjava 'cd $JAVA_DIR'
alias cdjavascript 'cd $JAVASCRIPT_DIR'
alias cdjs 'cd $JAVASCRIPT_DIR'
alias cdlanguages 'cd $LANGUAGES_DIR'
alias cdmaritz 'cd $MARITZ_DIR'
alias cdmyoci 'cd $MYOCI_DIR'
alias cdnode 'cd $JAVASCRIPT_DIR/Node.js'
alias cdnotes 'cd ~/MyUnixEnv/notes'
alias cdoci 'cd $OCI_DIR'
alias cdprogramming 'cd $PROGRAMMING_DIR'
alias cdrga 'cd $RGA_DIR'
alias cdsett 'cd $SETT_DIR'
alias cdtraining 'cd $TRAINING_DIR'
alias cdvim 'cd $PROGRAMMING_DIR/Tools/Vim'

# Git aliases
# Note that fish uses parens in place of backticks to execute sub-commands.
alias pull "git pull origin (git rev-parse --abbrev-ref HEAD)"
alias push 'git push origin (git rev-parse --abbrev-ref HEAD)'
alias pushn 'git push --no-verify origin (git rev-parse --abbrev-ref HEAD)'
alias sha 'git rev-parse HEAD'
# status report from git commits
alias sr 'git log --author="Volkmann" --branches --no-merges --since="8 days ago" --pretty=format:"%cd %s" | tac'

# Ask for confirmation before overwriting or deleting files.
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"

# For a nicely formatted dump of LD_LIBRARY_PATH ...
alias eld "echo LD_LIBRARY_PATH :; echo -n '   ';echo \$LD_LIBRARY_PATH |sed 's/:/\n   /g'"

# Code printing (fancy two columns)
alias ens "enscript --borders --columns=2 --fancy-header --landscape --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp"
alias ens1 "enscript --borders --fancy-header --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp -L63"

alias findcss 'find3 css'
alias findhtml 'find3 html'
alias findhtml1 'find-depth-1 html'
alias findjava 'find3 java'
alias findjs 'find3 js'
alias findjs2 'find4 js'
alias findjson 'find3 json'
alias findless 'find3 less'
alias findscss 'find3 scss'

# ESLint aliases
alias esl 'clear; eslint -f codeframe **/*.js'
# Fix ESLint issues in a JavaScript file, including adding missing semicolons.
# ex. fixsemi some-name.js
alias fixsemi "eslint --fix --rule 'semi: [2, always]'"
# Fix ESLint issues in a JavaScript file, including removing unnecessary semicolons.
# ex. fixnosemi some-name.js
alias fixnosemi "eslint --fix --rule 'semi: [2, never]'"

# Goes to root directory of current git repo.
alias cdgitroot 'cd (git rev-parse --git-dir); cd ..'

# Display directories and executables in different colors.
#alias ls 'ls --color=tty'
alias ls 'ls -G'

# See MySQLNotes.txt for steps to start mysqld, the daemon.
alias mysql /usr/local/mysql/bin/mysql
alias mysqladmin /usr/local/mysql/bin/mysqladmin

# Shows all paths in $PATH on separate lines.
alias showpath 'printf "%s\n" $PATH'

alias sortedpath "ruby -e 'puts ENV[\"PATH\"].split(File::PATH_SEPARATOR).sort'"

#complete -C complete-ant-cmd.pl ant build.sh

# Kill the process listening on a given port.
alias klp "kill-listening-process"

# For React Native
alias rna="react-native run-android"
alias rni="react-native run-ios"

# For Web Components and Polymer
alias pe 'clear; eslint -f codeframe *.html demo/*.html test/*.html'
alias pew 'clear; esw -w *.html demo/*.html test/*.html'
alias pl 'clear; polylint demo/index.html'
alias plr 'clear; livereload "*.html, demo/*.html, test/*.html"'
alias pso 'clear; polymer serve -o'

# For Monsanto
alias cdapi 'cd ~/Monsanto/launchpad-api'
alias cdui 'cd ~/Monsanto/launchpad-ui'
alias pgstart 'pg_ctl -D /usr/local/var/postgres start'
alias pgstop 'pg_ctl -D /usr/local/var/postgres stop -m fast'

#---------------------------------------------------------------------------
# Environment Variables
#---------------------------------------------------------------------------

# Is this needed?
set SHELL /usr/local/bin/fish

if test -e $HOME/secret.sh
  . $HOME/secret.sh
end
if test -e $HOME/secrets/local.env
  # TODO: Why doesn't "." work in place of "bash" here?
  bash $HOME/secrets/local.env
end

# Commonly used directory prefixes.
set DOCUMENTS_DIR $HOME/Documents
set DROPBOX_DIR $HOME/Dropbox
set OCI_DIR $DOCUMENTS_DIR/oci
set PROGRAMMING_DIR $DOCUMENTS_DIR/programming
set DATABASES_DIR $PROGRAMMING_DIR/databases
set LANGUAGES_DIR $PROGRAMMING_DIR/languages
set CSS_DIR $LANGUAGES_DIR/CSS
set HTML_DIR $LANGUAGES_DIR/html
set JAVA_DIR $LANGUAGES_DIR/java
set JAVASCRIPT_DIR $LANGUAGES_DIR/javascript
#set MONGODB_DIR=$DATABASES_DIR/MongoDB
set SETT_DIR $OCI_DIR/SETT
set TRAINING_DIR $DOCUMENTS_DIR/training

# AsciiDoc settings
set XML_CATALOG_FILES '/usr/local/etc/xml/catalog'

# Clojure settings
#set CLOJURE_HOME $LANGUAGES_DIR/clojure/clojure-1.2.1
#set CLOJURE_HOME /opt/clojure-1.5.1 # for RPi
#alias clj 'java -cp $CLOJURE_HOME/clojure-1.5.1.jar clojure.main'

# Git settings
set GITHUB_USER mvolkmann
#set GITHUB_PASS ?

# grep settings
# This setting may interfere with fink scripts!
#set GREP_OPTIONS '--color=ALWAYS'

# HTTP server to serve files in current directory
alias serve 'python -m SimpleHTTPServer 8080'

# Java settings
set JAVA_HOME '/usr/libexec/java_home'

# JavaScript settings
set JS_CMD node
set JS_DIR $LANGUAGES_DIR/javascript

# Maven settings
#set MAVEN_HOME $JAVA_DIR/Maven/apache-maven-3.3.9
#set M2_HOME $MAVEN_HOME
#set PATH $PATH $MAVEN_HOME/bin
#set MAVEN_OPTS '-Xms1024m -Xmx2048m -XX:PermSize=1024m -XX:MaxPermSize=2048m'

# Monsanto settings
set POSTGRES_DB launchpad
set POSTGRES_USER launchpad
set POSTGRES_PASSWORD launchpad
set NODE_ENV local
alias pgl 'psql -d launchpad'

# MongoDB settings
#set PATH $PATH $MONGODB_DIR/mongodb-osx-x86_64-2.4.3/bin

# MySQL settings
#set PATH $PATH /usr/local/mysql-5.0.51a-osx10.5-x86/bin

# Node.js settings
set NODE_PATH . /usr/local/lib/node_modules # Mocha needs this
set PATH $PATH $NODE_DIR/deps/v8/tools
#function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

# React Native settings
set ANDROID_HOME /usr/local/opt/android-sdk
set GRADLE_OPTS '-Dorg.gradle.daemon=true'

# Subversion settings
set SVN_PREFIX svn+ssh://oci-svn/education/training/tracks

# Tomcat settings
#set TOMCAT_HOME $JAVA_DIR/Tomcat/apache-tomcat-7.0.41
#set BASEDIR $TOMCAT_HOME
#set CATALINA_HOME $TOMCAT_HOME

# Vim settings
set fish_key_bindings fish_vi_key_bindings
