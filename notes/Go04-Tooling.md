## Tooling

### `go` Command

The `go` command has many sub-commands.
The most commonly used sub-commands are summarized below.

- `go help [command|topic]`\
  This outputs help on a given command or topic.
  Run this with no arguments to see a list of commands and topics.
- `go doc {package} [constant|function|type]`\
  This outputs brief documentation for a given package
  or a constant, function, or type in a package.
  For example, `go doc json` where `json` is a standard library package
  and `go doc strings Trim` where `strings` is a package
  and `Trim` is a function exported by that package.
- `godoc {package} [constant|function|type]`\
  This is similar to the `go doc` command, but outputs even more documentation.
  Add `-src` to see source code for a package.
  To get documentation on a single member of a package,
  add a space and the name after the package name.
  For example, `godoc strings Trim`.
  TODO: Discuss using as a local web server.
- `go env`\
  This prints the values of all Go-related environment variables
  such as `GOARCH`, `GOOS`, `GOPATH`, and `GOROOT`.
  It also accepts arguments that are the names of specific
  environment variables whose values should be listed.
- `go fix {file-or-directory-path}`\
  This "finds Go programs that use old APIs and rewrites them to use newer ones."
  "After you update to a new Go release,
  `fix` helps make the necessary changes to your programs."
  TODO: Were there any fixes needed for Go 1.11?
- `go get {pkg1} {pkg2} ...`\
  This downloads and installs packages and their dependencies.
- `go list`\
  This outputs the import path of the current directory
  if the current contains at least one `.go` file.
- `go build`\
  This builds an executable for the package in the current directory
  that includes everything needed to run
  and places it in the current directory.
  The executable can be moved anywhere.
  Go tools do not need to be installed in order to execute the resulting file.
- `go install {pkg-name}`\
  This builds a given package and installs it in `GOBIN` which must be set. TODO: Really?
  It also builds all the dependencies of the package,
  and recursively all of their dependencies.
  If run from the package directory, the package name can be omitted.
- `go clean -i {pkg-name}`\
  This deletes the executable for the package from `GOBIN`.
  If run from the package directory, the package name can be omitted.
- `go run {file-name}.go`\
  This runs a program without producing an executable.
- `go test`\
  This runs all the tests in the current package.
  To run tests in multiple packages,
  cd to the `GOPATH` directory and
  specify a space-separated list of package paths.
  TODO: Is there a way to run all the tests without listing all the packages?
- `go generate`\
  This generates Go source files based on special comments in other source files.
  The comments specify a generator to use which must be installed.
  The generated code typically defines functions in the same package
  that satisfy an interface used by the code containing the comment.
  For example, `//go:generate stringer -type=Color` where `Color` is an enumeration type.
  This generates a `String` function that takes an integer constant
  and returns its string name.
  For example, `String(2)` might return "yellow".
  TODO: TRY THIS TO VERIFY.
- `go version`\
  This outputs the version of Go that is installed.
  To get the version in code, call `runtime.Version()`.
- `go vet`\
  This "examines Go source code and reports suspicious constructs,
  such as Printf calls whose arguments do not align with the format string.
  It "uses heuristics that do not guarantee all reports are genuine problems,
  but it can find errors not caught by the compilers."

Many `go` sub-commands support the `-race` flag which
adds detection and reporting of data races.
These include `test`, `run`, `build`, and `install`.

There are many Go tools that are not sub-commands of the `go` command.
Some of the more popular ones include:

- `gofmt`\
  This formats code in the standard format.
  It uses tabs for indentation and spaces for alignment.
  It also alphabetizes imports.
  The arguments can be file paths or directory paths
  to process all the `.go` files in the directories.
  By default, the formatted code is written to stdout.
  To overwrite the files, include the `-w` flag.
- `golint`\
  This is a linter for `.go` files that just focuses on coding style.
  Unlike `gofmt` which corrects some issues, `golint` just reports them.
- `gometalinter`\
  This concurrently runs many other Go tools
  and collects and reports their output.
  For a list of supported tools, see
  <https://github.com/alecthomas/gometalinter#supported-linters>.
  `golint` is one of the supported tools.
- `goimports`\
  This does what `gofmt` does and also
  adds missing imports and removes unused imports.
  In addition, it reorders the imports into two groups,
  standard library packages and all other packages.
- `goreturns`\
  This is does what `goimports` does and also
  adds missing values to `return` statements using
  the zero-values of the corresponding declared return types.
- TODO: Add a description of delve for debugging?

### Editor Support

Many editors and IDEs have support for Go,
often through plugins or extensions.
For example,

- Atom has the Go-Plus package.
- Eclipse has the GoClipse plugin.
- Emacs has many Go plugins that include
  go-mode.el, go-playground, and GoFlyMake.
- GoLand from JetBrains is standalone editor and a plugin for IDEA.
- Sublime Text has the GoSublime plugin and the Golang Build configuration.
- Vim has the vim-go plugin.
  This is a popular options in the Go community.
- VS Code has the Go extension from Microsoft.

### VS Code Go Extension

The VS Code Go extension from Microsoft is very popular in the Go community.

It provides autocomplete of local and imported functions.
Hover over the name of a constant, variable, type, or function
to see information about it in a popup.

To jump to the definition of a name, ctrl-click (cmd-click in macOS) it.
This even works with names defined in standard library packages.

After typing the opening `(` of a function call
a popup describing the expected arguments appears.
Argument values with an invalid types are described in the PROBLEMS tab.

User-defined snippets specific to `.go` files are supported,
but none are predefined. To add them,
select Code...Preferences...User Snippets...Go.
These support numbered placeholders for user-entered text.
For example, you could add these:

```json
{
  "function": {
    "prefix": "fn",
    "body": [
      "func ${1:name}(${2:parameters}) ${3:return-type} {",
      "  ${4:body}",
      "}"
    ]
  },
  "main package/function": {
    "prefix": "main",
    "body": ["package main", "", "func main() {", "  ${1:body}", "}"]
  },
  "print format": {
    "prefix": "pf",
    "body": "fmt.Printf(\"${1:format-string}\\n\", ${2:expressions})"
  },
  "print line": {
    "prefix": "pl",
    "body": "fmt.Println(\"$1\")"
  },-
  "print variable": {
    "prefix": "pv",
    "body": "fmt.Printf(\"${1} = %+v\\n\", ${1})"
  }
}
```

By default, several Go tools are run when changes to `.go` files are saved.
These include `golint`, `govet`, and `goreturns`, all described earlier.

The default value of the "go.formatTool" user setting is `goreturns`.
This can be changed to `goimports` or `gofmt`.

To find all the references to a given function,
right-click its name and select "Find All References".

When viewing a test file, individual test functions can be run by
clicking on the "run test" link that appears above every test function.

VS Code will attempt to infer the correct value for `GOPATH`
if the user setting `"go.inferGopath": true,` is added.
"It searches upwards in the path for the `src` directory,
and sets `GOPATH` to one level above that."

Many commands starting with "Go:" are added to the Command Palette.
These include:
TODO: Verify all of these!

- "Add Import"\
  This displays a list of standard library packages.
  Select one to add an import for it.
- "Browse Packages"\
  This displays a drop-down list containing the standard library packages.
  TODO: Only standard ones?
  Select one to see a list of files in the package.
  Select a file to view the source code.
- "Current GOPATH"\
  This shows the current GOPATH in a popup in lower right.
- "Generate Interface Stubs"\
  TODO: This is supposed to generate method stubs for
  all the methods in a given interface for a given receiver type,
  but I haven't been able to get it to work.
- "Generate Unit Tests for File"\
  This generates a `_test.go` file for the current file
  that provides a good starting point for implementing tests.
- "Run on Go Playground"\
  This loads current file into the web-based Go Playground
  where it can be run by pressing the "Run" button.
- "Test Function At Cursor"\
  This runs only the test function under the cursor.
  The cursor must be over a test function, not the function to be tested.
- "Test File"\
  This runs all tests for the current file.
- "Test Package"\
  This runs all tests for the current package.
- "Test All Packages in Workspace"\
  This runs all tests under the `src` directory,
  including tests for all installed packages.

TODO: Should you describe any other tools? go-wrk and flame graphs from Campoy youtube "Go Tools"
