#!/usr/local/bin/fish
# Configuration for the Friendly Interactive Shell (fish)

# Avoid adding the same thing to PATH
# each time an interactive shell is created.
if status --is-login
  echo running .config/fish/config.fish

  # If not already in PATH, add /usr/local/bin.
  if not contains /usr/local/bin $PATH
    set -x PATH /usr/local/bin $PATH
  end

  # If not already in PATH, add $HOME/bin.
  if not contains $HOME/bin $PATH
    set -x PATH $HOME/bin $PATH
  end
end

# Disable start/stop output control so
# ctrl-s can be used in Vim to save and
# ctrl-q can be used by unimpaired plugin.
stty -ixon

# Suppress the default greeting of
# "Welcome to fish, the friendly interactive shell"
set -U fish_greeting ''

#---------------------------------------------------------------------------
# Abbreviations
#---------------------------------------------------------------------------

# For Go

abbr --add grm go run main.go

# For git
abbr --add add git add
abbr --add br git branch
abbr --add ci git commit -av
abbr --add co git checkout
abbr --add cob git checkout -b
abbr --add graph git log --graph --oneline
abbr --add hrepl stack ghci # starts Haskell REPL
abbr --add hrun stack runghc # runs a Haskell program
abbr --add log git log
abbr --add status git status

# For Kubernetes
abbr --add kapp kubectl apply -f
abbr --add kdel kubectl delete
abbr --add kdesc kubectl describe
abbr --add kget kubectl get
abbr --add klogs kubectl logs

# For npm
abbr --add nr npm run

# For React Native
abbr --add rn react-native

# For Rust
abbr --add cc cargo clippy
abbr --add cr cargo run
abbr --add ct cargo test

# Ask for confirmation before overwriting or deleting files.
abbr --add cp 'cp -i'
abbr --add mv 'mv -i'
abbr --add rm 'rm -i'

#---------------------------------------------------------------------------
# Environment Variables
#---------------------------------------------------------------------------

# Is this needed?
set -x SHELL /usr/local/bin/fish

set -x SHELL_ICON 🐠

set -x EDITOR (which code)

if test -e $HOME/secret.sh
  . $HOME/secret.sh
end
if test -e $HOME/secrets/local.env
  # TODO: Why doesn't "." work in place of "bash" here?
  bash $HOME/secrets/local.env
end

# Commonly used directory prefixes.
# When a variable is set in config.fish with no scope switch,
# it defaults to global.
set -x DOCUMENTS_DIR $HOME/Documents
set -x DROPBOX_DIR $HOME/Dropbox
set -x OCI_DIR $DOCUMENTS_DIR/oci
set -x PROGRAMMING_DIR $DOCUMENTS_DIR/programming
set -x DATABASES_DIR $PROGRAMMING_DIR/databases
set -x LANGUAGES_DIR $PROGRAMMING_DIR/languages
set -x CSS_DIR $LANGUAGES_DIR/CSS
set -x DENO_DIR $JAVASCRIPT_DIR/deno
set -x HTML_DIR $LANGUAGES_DIR/html
set -x JAVA_DIR $LANGUAGES_DIR/java
set -x JAVASCRIPT_DIR $LANGUAGES_DIR/javascript
set -x MICRONAUT_DIR $JAVA_DIR/Micronaut/micronaut-1.0.0.M2
#set -x MONGODB_DIR=$DATABASES_DIR/MongoDB
set -x NU_DIR $PROGRAMMING_DIR/nushell
set -x PYTHON_DIR $LANGUAGES_DIR/Python
set -x REACT_DIR $JAVASCRIPT_DIR/react
set -x RUST_DIR $LANGUAGES_DIR/rust
set -x SETT_DIR $OCI_DIR/SETT
set -x SVELTE_DIR $JAVASCRIPT_DIR/svelte
set -x TRAINING_DIR $DOCUMENTS_DIR/training
set -x TYPESCRIPT_DIR $LANGUAGES_DIR/typescript

# AsciiDoc settings
set -x XML_CATALOG_FILES '/usr/local/etc/xml/catalog'

# bat settings (better version of cat command)
set -x BAT_PAGER myless

# Clojure settings
#set -x CLOJURE_HOME $LANGUAGES_DIR/clojure/clojure-1.2.1
#set -x CLOJURE_HOME /opt/clojure-1.5.1 # for RPi
#alias clj 'java -cp $CLOJURE_HOME/clojure-1.5.1.jar clojure.main'

# Deno settings
set -x PATH $PATH $HOME/.deno/bin
alias dfmt 'deno fmt'
alias dlint 'deno lint --unstable'
alias drun 'deno run'

# Git settings
set -x GITHUB_USER mvolkmann
#set -x GITHUB_PASS ?

# Go settings
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $GOBIN

# grep settings
# This setting may interfere with fink scripts!
#set -x GREP_OPTIONS '--color=ALWAYS'

# Haskell (GHC) settings
#set -x PATH $HOME/.local/bin $PATH

# HTTP server to serve files in current directory
alias serve 'python -m SimpleHTTPServer 8080'

# Java settings
#set -x JAVA_HOME '/Library/Java/JavaVirtualMachines/jdk-13.0.1.jdk/Contents/Home'
set -x JAVA_HOME '/Library/Java/JavaVirtualMachines/jdk-11.0.9.jdk/Contents/Home'

# JavaScript settings
set -x JS_CMD node
set -x JS_DIR $LANGUAGES_DIR/javascript

# ls colors
# First character is directory color; E is bold blue.
# Defaults are directory=e(blue), symbolic link=f(magenta), executable=b(red).
set -Ux LSCOLORS Exfxcxdxbxegedabagacad

# Maven settings
#set -x MAVEN_HOME $JAVA_DIR/Maven/apache-maven-3.3.9
#set -x M2_HOME $MAVEN_HOME
#set -x PATH $PATH $MAVEN_HOME/bin
#set -x MAVEN_OPTS '-Xms1024m -Xmx2048m -XX:PermSize=1024m -XX:MaxPermSize=2048m'

# Micronaut settings
#set -x PATH $PATH $MICRONAUT_DIR/bin

# MongoDB settings
#set -x PATH $PATH $MONGODB_DIR/mongodb-osx-x86_64-2.4.3/bin

# Node.js settings
set -x NODE_OPTIONS --max-old-space-size=2048

# PostgreSQL settings
alias pgstart 'pg_ctl -D /usr/local/var/postgres start'
alias pgstop 'pg_ctl -D /usr/local/var/postgres stop -m fast'
alias pgl 'psql -d demo'

# Python settings
alias pip 'pip3'
alias py 'python3'
alias python 'python3'
alias pipi 'python3 -m pip install'
set PYTHON_VERSION 3.8
set -x PATH /Library/Frameworks/Python.framework/Versions/$PYTHON_VERSION/bin $PATH
set -x PATH $HOME/opt/anaconda3/bin $PATH
set -x PATH $HOME/Library/Python/$PYTHON_VERSION/bin $PATH
set -x PYTHON_DS_STUBS $PYTHON_DIR/data-science-types-0.2.18
set -x PIP_PATH /Library/Frameworks/Python.framework/Versions/$PYTHON_VERSION/lib/python$PYTHON_VERSION/site-packages
set -x PYTHONPATH $PIP_PATH:$PYTHON_DS_STUBS
set -x PYTHONSTARTUP $HOME/startup.py

# React Native settings
#set ANDROID_HOME /usr/local/opt/android-sdk
set -x GRADLE_OPTS '-Dorg.gradle.daemon=true'
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/tools/bin
set -x PATH $PATH $ANDROID_HOME/platform-tools

# Rust settings
set -x PATH $PATH $HOME/.cargo/bin

# Subversion settings
set -x SVN_PREFIX svn+ssh://oci-svn/education/training/tracks

# Tomcat settings
#set -x TOMCAT_HOME $JAVA_DIR/Tomcat/apache-tomcat-7.0.41
#set -x BASEDIR $TOMCAT_HOME
#set -x CATALINA_HOME $TOMCAT_HOME

# Vim settings
set fish_key_bindings fish_vi_key_bindings
set -x VISUAL vim

# VS Code - allows launch from terminal with "code"
set -x PATH $PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

#---------------------------------------------------------------------------
# Aliases
#---------------------------------------------------------------------------

alias bigfiles "find . -type f -size +1000k -exec ls -lk {} \; | awk '{print \$5, \$9}' | sort -nr +1 | head"
alias bigdirs 'du -sk * | sort -nr | head'

alias cdblog 'cd $DOCUMENTS_DIR/blog'
alias cdbook 'cd $SVELTE_DIR/book'
alias cdcangea 'cd $OCI_DIR/clients/Cangea'
alias cdd3 'cd $JAVASCRIPT_DIR/d3'
alias cddeno 'cd $JAVASCRIPT_DIR/deno'
alias cddropbox 'cd $DROPBOX_DIR'
alias cdevergreen 'cd $OCI_DIR/clients/Evergreen'
alias cdeverroot 'cd $OCI_DIR/clients/Purina/EverRoot'
alias cdgo 'cd $PROGRAMMING_DIR/languages/go'
alias cdgop 'cd $GOPATH'
alias cdgopv 'cd $GOPATH/src/github.com/mvolkmann'
alias cdjava 'cd $JAVA_DIR'
alias cdjavascript 'cd $JAVASCRIPT_DIR'
alias cdjs 'cd $JAVASCRIPT_DIR'
alias cdlanguages 'cd $LANGUAGES_DIR'
alias cdmeteor 'cd $JAVASCRIPT_DIR/meteor'
alias cdmyoci 'cd $MYOCI_DIR'
alias cdnode 'cd $JAVASCRIPT_DIR/Node.js'
alias cdnotes 'cd $HOME/MyUnixEnv/notes'
alias cdnu 'cd $PROGRAMMING_DIR/nushell'
alias cdoci 'cd $OCI_DIR'
alias cdphp 'cd /Library/WebServer/Documents'
alias cdprism 'cd $OCI_DIR/lennox-prism'
alias cdprogramming 'cd $PROGRAMMING_DIR'
alias cdpurina 'cd $OCI_DIR/clients/Purina'
alias cdpython 'cd $PYTHON_DIR'
alias cdreact 'cd $JAVASCRIPT_DIR/react'
alias cdrn 'cd $JAVASCRIPT_DIR/react-native'
alias cdrust 'cd $PROGRAMMING_DIR/languages/rust'
alias cdsett 'cd $SETT_DIR'
alias cdsvelte 'cd $JAVASCRIPT_DIR/svelte'
alias cdtalks 'cd $PROGRAMMING_DIR/conferences/talks'
alias cdtraining 'cd $TRAINING_DIR'
alias cdts 'cd $TYPESCRIPT_DIR'
alias cdva 'cd $OCI_DIR/clients/VA'
alias cdvue 'cd $JAVASCRIPT_DIR/vue'
alias cdwasm 'cd $PROGRAMMING_DIR/wasm'
alias cdwwt 'cd $OCI_DIR/clients/WWT'
alias cdxtrack 'cd $OCI_DIR/xtrack'
alias cls 'clear'

# Git aliases
# Note that fish uses parens in place of backticks to execute sub-commands.
alias pull 'git pull origin (git rev-parse --abbrev-ref HEAD)'
alias push 'git push origin (git rev-parse --abbrev-ref HEAD)'
alias pushn 'git push --no-verify origin (git rev-parse --abbrev-ref HEAD)'
alias sha 'git rev-parse HEAD'
# status report from git commits
alias sr 'git log --author="Volkmann" --branches --no-merges --since="8 days ago" --pretty=format:"%cd %s" | tac'

# For a nicely formatted dump of LD_LIBRARY_PATH ...
alias eld "echo LD_LIBRARY_PATH :; echo -n '   ';echo \$LD_LIBRARY_PATH |sed 's/:/\n   /g'"

# Code printing (fancy two columns)
# --margins=left:right:top:bottom values are Postscript points (72 per inch)
alias ens 'enscript --borders --columns=2 --fancy-header --landscape --line-numbers=1 --margins=30::: --mark-wrapped-lines=arrow --pretty-print=cpp'
alias ens1 'enscript --borders --fancy-header --line-numbers=1 --mark-wrapped-lines=arrow --pretty-print=cpp -L63'

alias findadoc 'find3 adoc'
alias findcss 'find3 css'
alias findgo 'find3 go'
alias findhtml 'find3 html'
alias findhtml1 'find-depth-1 html'
alias findjava 'find3 java'
alias findjs 'find3 js'
alias findjs2 'find4 js'
alias findjson 'find3 json'
alias findless 'find3 less'
alias findmd 'find3 md'
alias findpy 'find3 py'
alias findrs 'find3 rs'
alias findrust 'find3 rs'
alias findscss 'find3 scss'
alias findsvelte 'find3 svelte'
alias findts 'find3 ts'
alias findvue 'find3 vue'
alias findwat 'find3 wat'

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

# Shows all paths in $PATH on separate lines.
alias showpath 'printf "%s\n" $PATH'

# Kill the process listening on a given port.
alias klp 'kill-listening-process'

# For React Native
alias rna='react-native run-android'
alias rni='react-native run-ios'

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/Mark/Documents/programming/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/Mark/Documents/programming/google-cloud-sdk/path.fish.inc'; else; . '/Users/Mark/Documents/programming/google-cloud-sdk/path.fish.inc'; end; end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Mark/google-cloud-sdk/path.fish.inc' ]; . '/Users/Mark/google-cloud-sdk/path.fish.inc'; end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/Mark/Documents/OCI/clients/RioTinto/ode-app-metadata-api/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/Mark/Documents/OCI/clients/RioTinto/ode-app-metadata-api/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/Mark/Documents/OCI/clients/RioTinto/ode-app-metadata-api/node_modules/tabtab/.completions/sls.fish ]; and . /Users/Mark/Documents/OCI/clients/RioTinto/ode-app-metadata-api/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/Mark/Documents/OCI/clients/RioTinto/ode-app-metadata-api/node_modules/tabtab/.completions/slss.fish ]; and . /Users/Mark/Documents/OCI/clients/RioTinto/ode-app-metadata-api/node_modules/tabtab/.completions/slss.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/mark/opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


set -gx WASMTIME_HOME "$HOME/.wasmtime"

string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH
# Wasmer
export WASMER_DIR="/Users/mark/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

starship init fish | source
