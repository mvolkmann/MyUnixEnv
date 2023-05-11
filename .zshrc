# Directory environment variables

export DOCUMENTS_DIR=$HOME/Documents
export BLOG_DIR=$DOCUMENTS_DIR/blog
export DEV_DIR=$DOCUMENTS_DIR/dev
export OCI_DIR=$DOCUMENTS_DIR/oci
export PROJECTS_DIR=$DOCUMENTS_DIR/projects
export TRAINING_DIR=$DOCUMENTS_DIR/training

export DB_DIR=$DEV_DIR/db
export MONGO_DIR=$DB_DIR/mongo
export POSTGRES_DIR=$DB_DIR/postgres
export SQLITE_DIR=$DB_DIR/sqlite

export FLUTTER_DIR=$DEV_DIR/flutter-projects
export REACT_DIR=$DEV_DIR/react
export SVELTE_DIR=$DEV_DIR/svelte

export LANG_DIR=$DEV_DIR/lang
export CSS_DIR=$LANG_DIR/css
export DART_DIR=$LANG_DIR/dart
export GO_DIR=$LANG_DIR/go
export HTML_DIR=$LANG_DIR/html
export JAVA_DIR=$LANG_DIR/java
export LUA_DIR=$LANG_DIR/lua
export MICRONAUT_DIR=$JAVA_DIR/micronaut
export JS_DIR=$LANG_DIR/js
export DENO_DIR=$JS_DIR/deno
export NODE_DIR=$JS_DIR/node
export PYTHON_DIR=$LANG_DIR/python
export RUST_DIR=$LANG_DIR/rust
export SVELTE_DIR=$DEV_DIR/svelte
export SWIFT_DIR=$LANG_DIR/swift
export TS_DIR=$LANG_DIR/ts

# For Fastlane
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Other environment variables
export GITHUB_USER=mvolkmann

# PATH modifications
path=("/opt/homebrew/bin" $path)
path=("/opt/homebrew/opt/ruby/bin" $path)
path=("${HOME}/bin" $path)
path=("${HOME}/.local/bin" $path)
path+=("${HOME}/.cargo/bin") # for Rust
path+=("${DEV_DIR}/google-cloud-sdk/bin")

# cd aliases
alias cdarch="cd $PROJECTS_DIR/ArchDesign/ArchDesign"
alias cdblog="cd $BLOG_DIR"
alias cdcss="cd $CSS_DIR"
alias cddart="cd $DART_DIR"
alias cddb="cd $DB_DIR"
alias cddeno="cd $DENO_DIR"
alias cddev="cd $DEV_DIR"
alias cdempowerme="cd $PROJECTS_DIR/EmpowerMe-Apple-Health"
alias cdevergreen="cd $PROJECTS_DIR/evergreen/evergreen-ui"
alias cdflutter="cd $FLUTTER_DIR"
# Goes to root directory of current git repository
# (replaced by cdgitroot function below).
# alias cdgitroot="cd \`git rev-parse --git-dir\`; cd .."
alias cdgo="cd $GO_DIR"
alias cdhtml="cd $HTML_DIR"
alias cdjava="cd $JAVA_DIR"
alias cdjs="cd $JS_DIR"
alias cdlang="cd $LANG_DIR"
alias cdlua="cd $LUA_DIR"
alias cdmongo="cd $MONGO_DIR"
alias cdnode="cd $NODE_DIR"
alias cdnotes="cd ~/MyUnixEnv/notes"
alias cdoci="cd $OCI_DIR"
alias cdpostgres="cd $POSTGRES_DIR"
alias cdprojects="cd $PROJECTS_DIR"
alias cdpython="cd $PYTHON_DIR":w
alias cdrust="cd $RUST_DIR"
alias cdsqlite="cd $SQLITE_DIR"
alias cdsvelte="cd $SVELTE_DIR"
alias cdswift="cd $SWIFT_DIR"
alias cdtalks="cd $TRAINING_DIR/talks"
alias cdtraining="cd $TRAINING_DIR"
alias cdts="cd $TS_DIR"

# Deno aliases
alias dfmt="deno fmt"
alias dlint="deno lint --unstable"
alias drun="deno run"

# Find files aliases
alias findcss='find3 css'
alias findhtml='find3 html'
alias findhtml1='find-depth-1 html'
alias findjava='find3 java'
alias findjs='find3 js*'
alias findjs2='find4 js*'
alias findjson='find3 json'
alias findscss='find3 scss'
alias findsvelte='find3 svelte'
alias findswift='find3 swift'
alias findts='find3 ts*'

# Git aliases
alias add="git add"
alias br="git branch"
alias ci="git commit -av"
alias co="git checkout"
alias cob="git checkout -b"
alias graph="git log --graph --oneline"
alias log="git log"
alias rmb="$HOME/bin/rmb"
alias sha="git rev-parse HEAD"
alias status="git status"

# status report from git commits
alias sr="git log --author="Volkmann" --branches --no-merges --since="8 days ago" --pretty=format:"%cd %s" | tac"

# Ask for confirmation before overwriting or deleting files.
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# MySQL aliases
# See MySQLNotes.txt for steps to start mysqld, the daemon.
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

# PostgreSQL aliases
alias pgstart="pg_ctl -D /usr/local/var/postgres start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -m fast"

# Warp aliases
alias cb="clear blocks"

# Other aliases
alias cls="clear"
alias v="nvim"
alias vim="nvim"

# Kill the process listening on a given port.
alias fixsf="fix-swift-format"
alias klp="kill-listening-process"
alias nr="npm run"
alias py="python3"
alias python="python3"

# JavaScript
export NODE_ENV=development

function cdgitroot() {
  cd `git rev-parse --git-dir`
  cd ..
}

function pull() {
  git pull origin $(git rev-parse --abbrev-ref HEAD)
}

function push() {
  git push origin $(git rev-parse --abbrev-ref HEAD)
}

function pushn() {
  git push --no-verify origin $(git rev-parse --abbrev-ref HEAD)
}

# Lua setup

export LUA_PATH="${HOME}/lua/?.lua;;"

# Starship prompt
eval "$(starship init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# See https://github.com/junegunn/fzf/wiki/examples#changing-directory.

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

