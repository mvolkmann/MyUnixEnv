# Nushell Config File

$env.config.edit_mode = "vi"

$env.DOCUMENTS_DIR = $'($nu.home-dir)/Documents'
$env.BLOG_DIR = $'($env.DOCUMENTS_DIR)/blog'
$env.DEV_DIR = $'($env.DOCUMENTS_DIR)/dev'
$env.OCI_DIR = $'($env.DOCUMENTS_DIR)/oci'
$env.PROJECTS_DIR = $'($env.DOCUMENTS_DIR)/projects'
$env.TRAINING_DIR = $'($env.DOCUMENTS_DIR)/training'

$env.DB_DIR = $'($env.DEV_DIR)/db'
$env.MONGO_DIR = $'($env.DB_DIR)/mongo'
$env.POSTGRES_DIR = $'($env.DB_DIR)/postgres'
$env.SQLITE_DIR = $'($env.DB_DIR)/sqlite'

$env.FLUTTER_DIR = $'($env.DEV_DIR)/flutter-projects'
$env.REACT_DIR = $'($env.DEV_DIR)/react'
$env.SVELTE_DIR = $'($env.DEV_DIR)/svelte'

$env.LANG_DIR = $'($env.DEV_DIR)/lang'
$env.CSS_DIR = $'($env.LANG_DIR)/css'
$env.DART_DIR = $'($env.LANG_DIR)/dart'
$env.GO_DIR = $'($env.LANG_DIR)/go'
$env.HTML_DIR = $'($env.LANG_DIR)/html'
$env.JAVA_DIR = $'($env.LANG_DIR)/java'
$env.MICRONAUT_DIR = $'($env.JAVA_DIR)/micronaut'
$env.JS_DIR = $'($env.LANG_DIR)/js'
$env.DENO_DIR = $'($env.JS_DIR)/deno'
$env.NODE_DIR = $'($env.JS_DIR)/node'
$env.PYTHON_DIR = $'($env.LANG_DIR)/python'
$env.RUST_DIR = $'($env.LANG_DIR)/rust'
$env.SVELTE_DIR = $'($env.DEV_DIR)/svelte'
$env.SWIFT_DIR = $'($env.LANG_DIR)/swift'
$env.TS_DIR = $'($env.LANG_DIR)/ts'

# PATH modifications
#$env.PATH = ($env.PATH | prepend '/opt/homebrew/bin')
#$env.PATH = ($env.PATH | prepend $'($nu.home-dir)/bin')
#$env.PATH = ($env.PATH | append $'($nu.home-dir)/.cargo/bin')
#$env.PATH = ($env.PATH | append $'($env.DEV_DIR)/google-cloud-sdk/bin')

# Other environment variables
$env.GITHUB_USER = 'mvolkmann'

# cd aliases
alias cdblog = cd $env.BLOG_DIR
alias cdcss = cd $env.CSS_DIR
alias cddart = cd $env.DART_DIR
alias cddb = cd $env.DB_DIR
alias cddeno = cd $env.DENO_DIR
alias cddev = cd $env.DEV_DIR
alias cdempowerme = cd $'($env.PROJECTS_DIR)/EmpowerMe-Apple-Health'
alias cdevergreen = cd $'($env.PROJECTS_DIR)/evergreen/evergreen-ui'
alias cdflutter = cd $env.FLUTTER_DIR
# Goes to root directory of current git repo.
#alias cdgitroot = 'cd (git rev-parse --git-dir | str trim); cd ..'
alias cdgo = cd $env.GO_DIR
alias cdhtml = cd $env.HTML_DIR
alias cdjava = cd $env.JAVA_DIR
alias cdjs = cd $env.JS_DIR
alias cdlang = cd $env.LANG_DIR
alias cdmongo = cd $env.MONGO_DIR
alias cdnode = cd $env.NODE_DIR
alias cdnotes = cd ~/MyUnixEnv/notes
alias cdoci = cd $env.OCI_DIR
alias cdpostgres = cd $env.POSTGRES_DIR
alias cdprojects = cd $env.PROJECTS_DIR
alias cdpython = cd $env.PYTHON_DIR
alias cdrust = cd $env.RUST_DIR
alias cdsqlite = cd $env.SQLITE_DIR
alias cdsvelte = cd $env.SVELTE_DIR
alias cdswift = cd $env.SWIFT_DIR
alias cdtalks = cd $'($env.TRAINING_DIR)/talks'
alias cdtraining = cd $env.TRAINING_DIR
alias cdts = cd $env.TS_DIR

# Deno aliases
alias dfmt = deno fmt
alias dlint = deno lint --unstable
alias drun = deno run

# Find files aliases
alias findcss = find3 css
alias findhtml = find3 html
alias findhtml1 = find-depth-1 html
alias findjava = find3 java
alias findjs = find3 js*
alias findjs2 = find4 js*
alias findjson = find3 json
alias findscss = find3 scss
alias findsvelte = find3 svelte
alias findswift = find3 swift
alias findts = find3 ts*

# Git aliases
alias add = git add
alias br = git branch
alias ci = git commit -av
alias co = git checkout
alias cob = git checkout -b
alias graph = git log --graph --oneline
alias log = git log
alias pull = git pull origin (git rev-parse --abbrev-ref HEAD)
alias push = git push origin (git rev-parse --abbrev-ref HEAD)
alias pushn = git push --no-verify origin (git rev-parse --abbrev-ref HEAD)
alias rmb = ~/bin/rmb
alias sha = git rev-parse HEAD
alias status = git status
# status report from git commits
#alias sr = git log --author="Volkmann" --branches --no-merges --since="8 days ago" --pretty=format:"%cd %s" | tac

# Ask for confirmation before overwriting or deleting files.
alias cp = cp -i
alias mv = mv -i
alias rm = rm -i

# MySQL aliases
# See MySQLNotes.txt for steps to start mysqld, the daemon.
alias mysql = /usr/local/mysql/bin/mysql
alias mysqladmin = /usr/local/mysql/bin/mysqladmin

# PostgreSQL aliases
alias pgstart = pg_ctl -D /usr/local/var/postgres start
alias pgstop = pg_ctl -D /usr/local/var/postgres stop -m fast

# Other aliases
alias cls = clear
# Kill the process listening on a given port.
alias klp = kill-listening-process
alias nr = npm run
alias py = python3
alias python = python3

def --env cdgitroot [] {
  cd (git rev-parse --git-dir | str trim)
  cd ..
}

# Starship initialization is generated with: starship init nu | save --force ~/.cache/starship/init.nu
source ~/.cache/starship/init.nu

