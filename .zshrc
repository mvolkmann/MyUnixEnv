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
export PROLOG_DIR=$LANG_DIR/prolog
export RUST_DIR=$LANG_DIR/rust
export SVELTE_DIR=$DEV_DIR/svelte
export SWIFT_DIR=$LANG_DIR/swift
export TS_DIR=$LANG_DIR/ts
export XTRACK_DIR=$PROJECTS_DIR/xtrack

# For Fastlane
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# For Google Cloud Platform (GCP)
export GOOGLE_APPLICATION_CREDENTIALS=$XTRACK_DIR/dev_sa.json

# Other environment variables
export GITHUB_USER=mvolkmann

# PATH modifications
path=("/opt/homebrew/bin" $path)
path=("/opt/homebrew/opt/ruby/bin" $path)
path=("${HOME}/bin" $path)
path=("${HOME}/.local/bin" $path)
path+=("${HOME}/.cargo/bin") # for Rust
path+=("${DEV_DIR}/google-cloud-sdk/bin")

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
alias love="/Applications/love.app/Contents/MacOS/love"

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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/volkmannm/Documents/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/volkmannm/Documents/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/volkmannm/Documents/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/volkmannm/Documents/dev/google-cloud-sdk/completion.zsh.inc'; fi
