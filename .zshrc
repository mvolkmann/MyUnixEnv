# cd aliases
alias cdblog="cd $BLOG_DIR"
#alias cdbook="cd $TRAINING_DIR/htmx/PragmaticBookshelf/mvhtmx/Book"
alias cdbook="cd $BOOK_DIR"
alias cdcss="cd $CSS_DIR"
alias cddb="cd $DB_DIR"
alias cddev="cd $DEV_DIR"
alias cdepic="cd $PROJECTS_DIR/EpicGames"
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
alias cdprag="cd $TRAINING_DIR/htmx/PragmaticBookshelf"
alias cdprojects="cd $PROJECTS_DIR"
alias cdprolog="cd $PROLOG_DIR"
alias cdpython="cd $PYTHON_DIR":w
alias cdrust="cd $RUST_DIR"
alias cdsmalltalk="cd $SMALLTALK_DIR"
alias cdsqlite="cd $SQLITE_DIR"
alias cdsvelte="cd $SVELTE_DIR"
alias cdswift="cd $SWIFT_DIR"
alias cdtalks="cd $TRAINING_DIR/talks"
alias cdtraining="cd $TRAINING_DIR"
alias cdts="cd $TS_DIR"
alias cdwc="cd $WEB_COMPONENTS_DIR"
alias cdwrec="cd $WREC_DIR"
alias cdzig="cd $ZIG_DIR"

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

# Prolog aliases
alias ciao="$HOME/.ciaoroot/v1.22.0-m5/build/bin/ciao"
alias scry="$PROLOG_DIR/scryer-prolog/target/release/scryer-prolog"

# Warp aliases
alias cb="clear blocks"

# Other aliases
alias bd="bun dev"
alias codexcli="/Applications/Codex.app/Contents/Resources/codex"
codexapp() {
  open -na "Codex" --args --cwd "$PWD"
}
alias cls="clear"
alias fixsf="fix-swift-format"
# Generate Book PDF
alias gb="./rake clean screen"
# Kill the process listening on a given port.
alias klp="kill-listening-process"
alias nr="pnpm run"
#alias nri="rm -rf node_modules package-lock.json && npm install"
alias nri="rm -rf node_modules package-lock.json pnpm-lock.json && pnpm install"
alias python="python3"
alias py="python3"
alias v="nvim"
alias vim="nvim"

function cdgitroot() {
  cd `git rev-parse --git-dir`
  cd ..
}

# Pretty path where each directory is on its own line.
function ppath() {
  echo $PATH | tr : '\n'
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

# For Lua
alias love="/Applications/love.app/Contents/MacOS/love"

# For ODBC
export DYLD_LIBRARY_PATH="$(brew --prefix)/lib"

# For pnpm
alias npm="pnpm"
export PATH=$PATH:$HOME/Library/pnpm
export PNPM_HOME="/Users/volkmannm/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# Starship prompt
#eval "$(starship init zsh)"

# Ruby
export PATH="$RUBY_PATH:$PATH"
export PATH="$(ruby -r rubygems -e 'puts Gem.bindir'):$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# See https://github.com/junegunn/fzf/wiki/examples#changing-directory.

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
    -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# bun completions
[ -s "/Users/volkmannm/.bun/_bun" ] && source "/Users/volkmannm/.bun/_bun"

# This runs the nri alias in each subdirectory of the current directory
# that contains a package.json file.
nris() {
  local dir
  for dir in ./*(/); do
    [[ -f "$dir/package.json" ]] || continue
    echo
    echo "running nri in ${dir:t} ..."
    (
      cd "$dir" || exit 1
      nri
    )
  done
}

PROMPT='$ '
RPROMPT=''
