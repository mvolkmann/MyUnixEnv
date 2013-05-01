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

export BMX_DIR=$DOCUMENTS_DIR/OCI/clients/bioMerieux
export PROGRAMMING_DIR=$DOCUMENTS_DIR/programming
export DATABASES_DIR=$PROGRAMMING_DIR/databases
export LANGUAGES_DIR=$PROGRAMMING_DIR/languages
export COFFEESCRIPT_DIR=$LANGUAGES_DIR/coffeescript
export CSS_DIR=$LANGUAGES_DIR/CSS
export HTML_DIR=$LANGUAGES_DIR/html
export JAVA_DIR=$LANGUAGES_DIR/Java
export JAVASCRIPT_DIR=$LANGUAGES_DIR/javascript
export JQUERY_DIR=$JAVASCRIPT_DIR/jquery
export TB_DIR=$CSS_DIR/TwitterBootstrap
export TRAINING_DIR=$DOCUMENTS_DIR/OCI/SVN/training

# Ant settings
export ANT_HOME=$JAVA_DIR/Ant/apache-ant-1.8.2
export PATH=$ANT_HOME/bin:$PATH

# AsciiDoc settings
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# CoffeeScript settings
export PATH=$PATH:$COFFEESCRIPT_DIR/jashkenas-coffee-script-79492aa/bin

# Clojure settings
export CLOJURE_HOME=$LANGUAGES_DIR/clojure/clojure-1.2.1
export CLOJURE_HOME=/opt/clojure-1.5.1 # for RPi
alias clj="java -cp $CLOJURE_HOME/clojure-1.5.1.jar clojure.main"

# FindBugs settings
export FINDBUGS_HOME=${JAVA_DIR}/FindBugs/findbugs-1.3.5

# Git settings
. ~/bin/git-completion.bash
#export PATH=$PATH:/usr/local/git/bin
export GITHUB_USER=mvolkmann
export GITHUB_PASS=github19

# grep settings
# This setting may interfere with fink scripts!
#export GREP_OPTIONS="--color=ALWAYS"

# Homebrew settings.
# See addition of /opt/local/bin to PATH later.

# Java settings
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home
#export JAVA_HOME=/opt/jdk1.8.0 # for RPi
#export PATH=$PATH:$JAVA_HOME/bin # for RPi

# JavaScript settings
export JS_CMD=node
export JS_DIR=$LANGUAGES_DIR/JavaScript

# JBoss settings
export JBOSS_HOME=$JAVA_DIR/JBoss/jboss-as-7.1.1.Final

# MySQL settings
#export PATH=$PATH:/usr/local/mysql-5.0.51a-osx10.5-x86/bin

# Node.js settings
export NODE_PATH=.:/usr/local/lib/node_modules # Mocha needs this
export PATH=$PATH:$NODE_DIR/deps/v8/tools

# Postgres settings
#export PATH=$PATH:$POSTGRES_DIR/bin

# Ruby settings
export RUBY_DIR=$LANGUAGES_DIR/Ruby
export RUBY_HOME=$RUBY_DIR/ruby-1.8.7-p22
export PATH=$RUBY_HOME:$PATH
#export RUBY_HOME=/usr/local/lib/ruby
#export PATH=/usr/local/bin:$PATH
#export PATH=$PATH:/usr/local/Cellar/ruby/1.9.2-p290/bin
export RUBYOPT=-rubygems
# Tell less not to complain about ANSI escape codes, and run ri.
alias ri='RI="${RI} -f ansi" LESS="${LESS}-f-R" ri'

# Scala settings
export SCALA_HOME=/opt/scala-2.10.1 # for RPi
export PATH=$PATH:$SCALA_HOME/bin

# Tomcat settings
export TOMCAT_HOME=$JAVA_DIR/Tomcat/apache-tomcat-7.0.19
export BASEDIR=$TOMCAT_HOME
export CATALINA_HOME=$TOMCAT_HOME

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

export PATH=$HOME/bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:$PATH

export TERM=xterm-256color

. ~/.bashrc
