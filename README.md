This is a set of files I use to set up a new environment
on Unix, Linux or Mac OS X machines.

Clone this repository, cd to it, and run
git submodule init
git submodule update
/bin/cp -rf * $HOME
/bin/cp -rf .* $HOME
(Using /bin/cp instead of cp avoids the -i flag that may be on an alias for cp.)
