
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
#!/bin/bash
#echo running .bash_profile

unset COLUMNS # to prevent ps from truncating lines
set noclobber

# Files to ignore in filename completion.
export FIGNORE='.o:.swp'

# Look for libraries in standard places.
export LD_LIBRARY_PATH=.:$HOME/lib:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH

#-------------------------------------------------------------------------

# Commonly used directory prefixes.

export DOCUMENTS_DIR=$HOME/Documents

export DROPBOX_DIR=$HOME/Dropbox
export EP_DIR=$HOME/gm-earnpower-client
export OCI_DIR=$DOCUMENTS_DIR/oci
export PROGRAMMING_DIR=$DOCUMENTS_DIR/programming
export DATABASES_DIR=$PROGRAMMING_DIR/databases
export LANGUAGES_DIR=$PROGRAMMING_DIR/languages
export CSS_DIR=$LANGUAGES_DIR/CSS
export HTML_DIR=$LANGUAGES_DIR/html
export JAVA_DIR=$LANGUAGES_DIR/java
export JAVASCRIPT_DIR=$LANGUAGES_DIR/javascript
export MARITZ_DIR=$OCI_DIR/clients/Maritz
#export MONGODB_DIR=$DATABASES_DIR/MongoDB
export REACT_DIR=$JAVASCRIPT_DIR/react
export RGA_DIR=$OCI_DIR/clients/RGA
export SETT_DIR=$OCI_DIR/SETT
export TRAINING_DIR=$DOCUMENTS_DIR/training

# Ant settings
export ANT_HOME=$JAVA_DIR/Ant/apache-ant-1.8.2
export PATH=$ANT_HOME/bin:$PATH

# AsciiDoc settings
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# coreutils settings
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Clojure settings
#export CLOJURE_HOME=$LANGUAGES_DIR/clojure/clojure-1.2.1
#export CLOJURE_HOME=/opt/clojure-1.5.1 # for RPi
#alias clj="java -cp $CLOJURE_HOME/clojure-1.5.1.jar clojure.main"

# Deno settings
source /usr/local/etc/bash_completion.d/deno.bash

# Git settings
. ~/bin/git-completion.bash
#export PATH=$PATH:/usr/local/git/bin
export GITHUB_USER=mvolkmann
#export GITHUB_PASS=

# Go settings
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# grep settings
# This setting may interfere with fink scripts!
#export GREP_OPTIONS="--color=ALWAYS"

# HTTP server to serve files in current directory
alias serve="python -m SimpleHTTPServer 8080"

# Java settings
export JAVA_HOME=$(/usr/libexec/java_home)

# JavaScript settings
export JS_CMD=node
export JS_DIR=$LANGUAGES_DIR/javascript

# ls colors
# First character is directory color; E is bold blue.
# Defaults are directory=e(blue), symbolic link=f(magenta), executable=b(red).
export LSCOLORS=Exfxcxdxbxegedabagacad

# Maven settings
#export MAVEN_HOME=$JAVA_DIR/maven/apache-maven-3.1.0
export MAVEN_HOME=$HOME/programming/tools/maven/apache-maven-3.3.9
export M2_HOME=$MAVEN_HOME
export PATH=$PATH:$MAVEN_HOME/bin
#export MAVEN_OPTS="-Xms1024m -Xmx2048m -XX:PermSize=1024m -XX:MaxPermSize=2048m"

# Monsanto settings
export POSTGRES_DB=launchpad
export POSTGRES_USER=launchpad
export POSTGRES_PASSWORD=launchpad
export NODE_ENV=local
alias pgl='psql -d launchpad'

# MongoDB settings
#export PATH=$PATH:$MONGODB_DIR/mongodb-osx-x86_64-2.4.3/bin

# MySQL settings
export PATH=$PATH:/usr/local/mysql/bin

# Node.js settings
export NODE_PATH=.:/usr/local/lib/node_modules # Mocha needs this
export PATH=$PATH:$NODE_DIR/deps/v8/tools
function npm-do { (PATH=$(npm bin):$PATH; eval $@;) }

# React Native settings
export ANDROID_HOME=/usr/local/opt/android-sdk
export GRADLE_OPTS="-Dorg.gradle.daemon=true"

# Ruby settings
export RUBY_DIR=$LANGUAGES_DIR/Ruby
export RUBY_HOME=$HOME/.rbenv/versions/1.9.1-p430/bin
export PATH=$RUBY_HOME:$PATH
#export RUBY_HOME=/usr/local/lib/ruby
#export PATH=/usr/local/bin:$PATH
#export PATH=$PATH:/usr/local/Cellar/ruby/1.9.2-p290/bin
export RUBYOPT=-rubygems
# Tell less not to complain about ANSI escape codes, and run ri.
alias ri='RI="${RI} -f ansi" LESS="${LESS}-f-R" ri'

# Rust settings
source "$HOME/.cargo/env"

# Subversion settings
export SVN_PREFIX=svn+ssh://oci-svn/education/training/tracks

# Tomcat settings
#export TOMCAT_HOME=$JAVA_DIR/Tomcat/apache-tomcat-7.0.41
#export BASEDIR=$TOMCAT_HOME
#export CATALINA_HOME=$TOMCAT_HOME

# TypeScript settings
export PATH=$PATH:~/programming/typescript/TypeScript/bin
export PATH=$PATH:$LANGUAGES_DIR/TypeScript/ts1.5/bin

# Vim settings
set -o vi # for vi-mode command-line editing
set editing-mode vi # for vi-mode command-line editing and all utilities that use readline
export EDITOR=vim
export VISUAL=vim

# VS Code - allows launch from terminal with "code"
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# When running multiple bash shells, allow all to write to history
# without overwriting each other.
shopt -s histappend

# Don't retain duplicate commands in history.
export HISTCONTROL=ignoredups

# Show Git information in prompt.
# See https://github.com/matthewmccullough/MatthewsShellConfig
#source ~/.bash_gitprompt

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

#export TERM=xterm-256color-italic
export TERM=xterm-256color

# Indicate that this file has been source
# so .bashrc knows whether it should source this.
export SOURCED_PROFILE=1

# Added for OCI NRG project
export HOST_IP="10.201.200.63"
export DOCKER_IP="172.21.0.1"

# For WWT
export MASTER_API_URI=https://localhost:5001/masterapi
export MASTER_DB_SERVER=localhost
export PROJECT_DB_SERVER=localhost
export SECURITY_TOKEN_ENCRYPTION_KEY=change_me-1234567890-change_me-1234567890
export SECURITY_TOKEN_ISSUER=pwc
export SECURITY_TOKEN_AUDIENCE=pwc
export WHITE_LISTED_URLS='https://localhost:3000'
export LD_LIBRARY_PATH=/usr/local/Cellar/mono-libgdiplus/6.0.5/lib
export MASTER_DB_USER=sa
export MASTER_DB_PASSWORD=Password!
export MASTER_DB_SERVER=localhost
export MASTER_DB_NAME=MasterDB
export GRAPH_API_CLIENT_SECRET='dShP-:h]gm[QxBjA9aUs57ONuXE8T=Jk'
export MASTER_DB_PASSWORD='Password!'
export PROJECT_TOKEN_ENCRYPTION_KEY='kXp2s5v8y/B?E(H+MbQeShVmYq3t6w9z'
export SECURITY_TOKEN_ENCRYPTION_KEY='kXp2s5v8y/B?E(H+MbQeShVmYq3t6w9z'

. ~/.bashrc
export PATH="/usr/local/opt/sqlite/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mark/.sdkman"
[[ -s "/Users/mark/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mark/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mark/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mark/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mark/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mark/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /Users/mark/.config/broot/launcher/bash/br

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
