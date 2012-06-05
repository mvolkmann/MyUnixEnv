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

export PROGRAMMING_DIR=$DOCUMENTS_DIR/programming
export DATABASES_DIR=$PROGRAMMING_DIR/databases
export LANGUAGES_DIR=$PROGRAMMING_DIR/languages
export COFFEESCRIPT_DIR=$LANGUAGES_DIR/coffeescript
export COUCHDB_DIR=$DATABASES_DIR/CouchDB
export HTML_DIR=$LANGUAGES_DIR/html
export JAVA_DIR=$LANGUAGES_DIR/Java
export JAVASCRIPT_DIR=$LANGUAGES_DIR/javascript
export MONGODB_DIR=$DATABASES_DIR/MongoDB/mongodb-osx-x86_64-2.0.1
export NODE_VERSION=0.4.11
export NODE_DIR=$JAVASCRIPT_DIR/node.js/node-v$NODE_VERSION
export JQUERY_DIR=$JAVASCRIPT_DIR/jquery

export GEP_DIR=$DOCUMENTS_DIR/GEP
export APTO_HOME=$GEP_DIR/apto
export DOCTOR_DIR=$GEP_DIR/doctor
export PROTOTYPES_DIR=$GEP_DIR/prototypes
export SANDBOX_DIR=$GEP_DIR/sandboxes/mvolkmann

export TRAINING_DIR=$DOCUMENTS_DIR/OCI/SVN/training

# Ant settings
export ANT_HOME=$JAVA_DIR/Ant/apache-ant-1.8.2
export PATH=$ANT_HOME/bin:$PATH

# Apto settings
export PATH=$PATH:$APTO_HOME/os/osx/bin
export PATH=$PATH:$APTO_HOME/node_modules/.bin

# Clojure settings
export CLOJURE_HOME=$LANGUAGES_DIR/clojure/clojure-1.2.1

# ClojureScript settings
export CLOJURESCRIPT_HOME=$LANGUAGES_DIR/clojurescript
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin

# Developer settings
export PATH=$PATH:/Developer/usr/bin

# FindBugs settings
export FINDBUGS_HOME=${JAVA_DIR}/FindBugs/findbugs-1.3.5

# Git settings
. ~/bin/git-completion.bash
export PATH=$PATH:/usr/local/git/bin

# Google Closure settings
export CLOSURE_BASE_PATH=$JS_DIR/GoogleClosure/closure-library-read-only/closure/goog/

# grep settings
# This setting may interfere with fink scripts!
#export GREP_OPTIONS="--color=ALWAYS"

# Java settings
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5.0/Home
#export PATH=$JAVA_HOME/bin:$PATH

# JavaScript settings
export JS_CMD=node
export JS_DIR=$LANGUAGES_DIR/JavaScript

# MacPorts settings.
export PATH=/opt/local/sbin:$PATH

# MongoDB settings
export PATH=$MONGODB_DIR/bin:$PATH

# MySQL settings
#export PATH=$PATH:/usr/local/mysql-5.0.51a-osx10.5-x86/bin

# NetBeans settings
export NETBEANS_HOME=/Applications/NetBeans

# Node.js settings
export NODE_PATH=.:/usr/local/lib/node_modules:$APTO_HOME/plugins:$APTO_HOME/node_modules
export PATH=$PATH:$NODE_DIR/deps/v8/tools

# Postgres settings
#export PATH=$PATH:$POSTGRES_DIR/bin

# Rhino settings
# To checkout and build latest source,
# cd $RHINO_DIR/latest
# cvs co mozilla/js/rhino
# cd mozilla/js/rhino
# ant jar
export CVSROOT=:pserver:anonymous@cvs-mirror.mozilla.org:/cvsroot
export RHINO_DIR=$JS_DIR/Rhino
export RHINO_HOME=$RHINO_DIR/rhino1_7R3

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

# Tomcat settings
export TOMCAT_HOME=$JAVA_DIR/Tomcat/apache-tomcat-7.0.19
export BASEDIR=$TOMCAT_HOME
export CATALINA_HOME=$TOMCAT_HOME

# Vim settings
#set -o vi # for vi-mode command-line editing
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

export PATH=$HOME/bin:$PATH:/usr/local/bin:/usr/local/sbin

. ~/.bashrc
