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
export JAVA_HOME=$JAVA_DIR/jdk-21.0.2
# Need this version of Java for Pragmatic Bookshelf work.
#export JAVA_HOME=$HOME/.asdf/installs/java/zulu-11.54.25/zulu-11.jdk/Contents/Home
export LUA_DIR=$LANG_DIR/lua
export JS_DIR=$LANG_DIR/javascript
export DENO_DIR=$JS_DIR/deno
export NODE_DIR=$JS_DIR/node
export PYTHON_DIR=$LANG_DIR/python
export PROLOG_DIR=$LANG_DIR/prolog
export RUST_PATH=$LANG_DIR/rust
export SMALLTALK_DIR=$LANG_DIR/smalltalk
export SVELTE_DIR=$DEV_DIR/svelte
export SWIFT_DIR=$LANG_DIR/swift
export TS_DIR=$LANG_DIR/ts
export VALE_CONFIG_PATH=$HOME/.vale.ini
export WEB_COMPONENTS_DIR=$DEV_DIR/web-components
export WREC_DIR=$WEB_COMPONENTS_DIR/wrec-files/wrec 
export XTRACK_DIR=$PROJECTS_DIR/xtrack
export ZIG_DIR=$LANG_DIR/zig

export BOOK_DIR=$WEB_COMPONENTS_DIR/volkmann2

# For Bun
export BUN_INSTALL="$HOME/.bun"

# For Fastlane
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# For Go
export GOPATH=$HOME/go

# For Google Cloud Platform (GCP)
export GOOGLE_APPLICATION_CREDENTIALS=$XTRACK_DIR/dev_sa.json

# Other environment variables
export GITHUB_USER=mvolkmann

# For Java
export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

# For JavaScript
export NODE_ENV=development

# For Lua
export LUA_PATH="${HOME}/lua/?.lua;;"

# For OCaml
#export OCAMLFORMAT="enable-outside-detected-project=true"
export XDG_CONFIG_HOME=${HOME}/.config/ocaml

# For ODBC
# Perhaps Homebrew takes care of setting this.
#export DYLD_LIBRARY_PATH="$(brew --prefix)/lib"

# For PostgreSQL
export PGDATA="/opt/homebrew/var/postgres"

# For Ruby
export RUBY_PATH=/opt/homebrew/opt/ruby/bin
# This must be done in .zshrc.
#export PATH="$RUBY_PATH:$PATH"

# For Rust
# . "$HOME/.cargo/env"

# For Subversion
export EDITOR=vi
export VISUAL=vi

# For Zig
# export ZIG_PATH="${ZIG_DIR}/zig-macos-aarch64-0.11.0"
export ZIG_PATH="${ZIG_DIR}/zig-macos-aarch64-0.12.0-dev.1571+03adafd80"

# PATH modification
path+=("${HOME}/bin")
path+=("${HOME}/.cargo/bin") # for Rust and Starship
path+=("/opt/homebrew/bin")
path+=("$BUN_INSTALL/bin")
path+=("$GOPATH/bin")
path+=("${ZIG_PATH}")
