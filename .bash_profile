#!/bin/bash
echo running .bash_profile

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

# Git settings
. ~/bin/git-completion.bash
#export PATH=$PATH:/usr/local/git/bin
export GITHUB_USER=mvolkmann
#export GITHUB_PASS=

# grep settings
# This setting may interfere with fink scripts!
#export GREP_OPTIONS="--color=ALWAYS"

# Java settings
export JAVA_HOME=$(/usr/libexec/java_home)

# JavaScript settings
export JS_CMD=node
export JS_DIR=$LANGUAGES_DIR/javascript

# Maven settings
#export MAVEN_HOME=$JAVA_DIR/maven/apache-maven-3.1.0
export MAVEN_HOME=$HOME/programming/tools/maven/apache-maven-3.3.9
export M2_HOME=$MAVEN_HOME
export PATH=$PATH:$MAVEN_HOME/bin
#export MAVEN_OPTS="-Xms1024m -Xmx2048m -XX:PermSize=1024m -XX:MaxPermSize=2048m"

# MongoDB settings
#export PATH=$PATH:$MONGODB_DIR/mongodb-osx-x86_64-2.4.3/bin

# MySQL settings
#export PATH=$PATH:/usr/local/mysql-5.0.51a-osx10.5-x86/bin

# Node.js settings
export NODE_PATH=.:/usr/local/lib/node_modules # Mocha needs this
export PATH=$PATH:$NODE_DIR/deps/v8/tools

# Postgres settings
#export PATH=$PATH:$POSTGRES_DIR/bin

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

# Subversion settings
export SVN_PREFIX=svn+ssh://oci-svn/education/training/tracks

# Tomcat settings
#export TOMCAT_HOME=$JAVA_DIR/Tomcat/apache-tomcat-7.0.41
#export BASEDIR=$TOMCAT_HOME
#export CATALINA_HOME=$TOMCAT_HOME

# TypeScript settings
export PATH=$PATH:~/programming/typescript/TypeScript/bin

# TypeScript settings
export PATH=$PATH:$LANGUAGES_DIR/TypeScript/ts1.5/bin

# Google Traceur settings
export PATH=$PATH:$JAVASCRIPT_DIR/traceur-compiler-master

# Vim settings
set -o vi # for vi-mode command-line editing
set editing-mode vi # for vi-mode command-line editing and all utilities that use readline
export EDITOR=vim
export VISUAL=vim

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

. ~/.bashrc
