# ag (The Silver Searcher) Notes

* a tool to quickly find lines in text files that
  contain specific text in and below a given directory
  * lists files where matches were found
    and each matching line number and text
* to install
  * browse https://github.com/ggreer/the_silver_searcher
  * in macOS, `brew install ag`
  * in Windows, download a .zip file from
    https://github.com/k-takata/the_silver_searcher-win32/releases
* to use
  * `ag `*`text`* *`directory-path`*
  * `ag '`*`regex`*`'`&nbsp;*`directory-path`*
  * *`directory-path`* defaults to current directory
* by default searches all text files not specified in `.gitignore`
* can restrict search to files with certain extensions
  * specified with options that each can
    include multiple actual extensions
    * includes --batch, --css, --html, --java, --js, --json,
      --less, --md, --sql, --sass, --ts, and many more
    * to get list, enter `ag --list-file-types`
* example
  * `ag class --js --ts`
