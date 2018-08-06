# Go Programming Language Notes

## Overview

Go was conceived by Robert Griesemer, Rob Pike, and Ken Thompson,
all working at Google, starting in September 2007.
About a year later Russ Cox and Ian Taylor joined the team.

Go was officially announced in November 2009.
Go 1.0 was released in March 2012.
Currently (as of August 2018) the latest version is
Go 1.10 which was released in February 2016.
The third beta release of Go 1.11 was released in August 2018.

- goals (many are in comparison to languages like C++ and Java)

  - address software issues at Google
  - simplicity, indicated by having a small specification
    and fewer features compared to other programming languages
  - safety in terms of memory utilization
  - readability
  - faster software development
  - faster build times
  - have a less cumbersome type system that provides type inference
    and use composition instead of type hierarchies
  - provide garbage collection
  - support parallel computation, taking advantage of multi-core computers
  - support concurrent execution and communication
  - enable easier dependency analysis
  - make it easier to write tools that analyze and process the code

- simplicity and performance are major goals
  so many features found in other programming languages
  are not present in Go
  - ex. generic types
- originally designed to be a systems programming language,
  but most developers use C, C++, or Rust for that
- does not compete with scripting languages like
  JavaScript, Perl, Python, and Ruby
- currently the most common uses are for
  the server side of web applications and dev ops tooling

The primary Go compiler and runtime are implemented in Go and assembler.

## Go Lineage

Many previous programming languages inspired the design of Go.
![Go Lineage](go-lineage.png)

## Characteristics

- compiled
- statically typed
- high performance
- provides type inference
- performs garbage collection
- supports asynchronous processing with lightweight threads via goroutines
- provides communication between goroutines using channels
- supports networking operations
- supports concurrency
- supports JSON marshalling and unmarshalling
- minimal support for object-oriented programming
  - through structs with methods
- no builtin support for functional programming
  - for example, no builtin map, filter, and reduce functions for arrays
  - hard to implement due to lack of generics
- supports composition, but not inheritance of types
- no equivalent of the ternary operator found in other languages

## Reasons to use

- performance
- asynchronous support with goroutines and channels
- type safety
- relatively small language that is easy to learn (May 9, 2018 spec. is 78 pages)
- network library

## Reasons to use C/C++/Rust

- Is Rust mature enough to be considered along side C and C++?
- currently there are more developers with C and C++ experience than Go experience
- C and C++ libraries are currently more mature than Go libraries
- Go does not support pointer arithmetic
- Go provides garbage collection and does not allow control of
  memory allocation/deallocation this is needed for real-time guarantees
- you object to community standards for Go like using gofmt to format code

## Largest Issues

- lack of a standardized approach for handling package versions
  used by a library or application
  - leading contenders are vgo and dep
- lack of support for generic types
  - needed for truly functional programming
    with generic functions like `map`, `filter`, and `reduce`
- lack of support for immutable data types
  - needed to provide guarantees that prevent accidental data mutations
- arrow functions
  - would provide more concise syntax and
    are expected in functional programming languages

## Annoyances

- gofmt uses tabs for indentation which is bad for printing code
- can't have single line if statements
- no ternary operator
- no destructuring of arrays or structs (like in JavaScript)
- no support for generic types when prevents functional programming
- syntax for defining methods on structs is messy
- forces some names to be all uppercase
  - includes ID, JSON, and URL
- GOPATH environment variable must be changed when switching between projects
- in struct values a comma is required after the last field
  if the closing brace is on a new line

## Notable Things Implemented in Go

- Docker - assembles container-based systems
  (open source version is now called "Moby")
- Kubernetes - production-grade container scheduling and management
  <http://kubernetes.io>
- Revel - full-stack web framework <https://github.com/revel/revel>
- InfluxDB - scalable datastore for metrics, events, and real-time analytics
  <https://github.com/influxdata/influxdb>
- many more you have probably not heard of

## Resources

- "The Go Programming Language Specification": <https://golang.org/ref/spec>
- "A Tour of Go": <https://tour.golang.org/>
  - built on "The Go Playground"
  - can use on web or download and run locally
  - when used on web
    - uploads code to golang.org servers and displays result
    - uses latest stable version of Go
- "How to Write Go Code": <https://golang.org/doc/code.html>
  - free, online resource
  - "demonstrates the development of a simple Go package and introduces the go tool"
- "Effective Go": <https://golang.org/doc/effective_go.html>
  - free, online "book"
- "The Go Playground": <https://play.golang.org/>
  - can enter and test code online
  - can share code with others, but not sure how long they are retained
- "The Go Play Space" at <https://goplay.space/>
  - a better alternative to "The Go Playground"
  - provides syntax highlighting, configurable indentation,
    use of Fira Code font, auto-indenting, help on double-click,
    ability to highlight lines (useful when sharing snippets),
    and more
- "Go Time" podcast: <https://changelog.com/gotime>
- GoDoc: <https://godoc.org>
  - "hosts documentation for Go packages on Bitbucket, GitHub,
    Launchpad and Google Project Hosting"
  - can search for a package and see its documentation
- Awesome Go: <https://awesome-go.com>
  - "A curated list of awesome Go frameworks, libraries and software"
- Gophers Slack channel: <https://invite.slack.golangbridge.org/>
- Golang Weekly: <https://golangweekly.com/>
  - "a weekly newsletter about the Go programming language"
- GopherCon 2015: Robert Griesemer - The Evolution of Go:
  <https://www.youtube.com/watch?v=0ReKdcpNyQg>
- Go Walkthrough: <https://medium.com/go-walkthrough>
  - "A series of walkthroughs to help you understand the Go standard library better"
  - seems to have stopped after seven, with the last in September 2016
- list of companies using Go: <https://github.com/golang/go/wiki/GoUsers>
  - includes Adobe, AgileBits (1Password), Bitbucket, CircleCI, CloudFlare,
    Cloud Foundry, Comcast, Dell, DigitalOcean, Docker, Dropbox, eBay,
    Facebook, General Electric, GitHub, GitLab, Google, Heroku, Honeywell,
    IBM, Intel, Lyft, Medium, Mesosphere, MongoDB, Mozilla, Netflix,
    New York Times, Oracle, Pinterest, Pivotal, Rackspace, Reddit,
    Riot Games, Shutterfly, Slack, Square, Stripe, Tumblr, Twitch, Twitter,
    Uber, VMware, Yahoo

## Editor Support

- this is a partial list
- Atom
  - Go-Plus package
- Eclipse
  - GoClipse plugin
- Emacs
  - go-mode.el
  - go-playground
  - GoFlyMake
- GoLand from JetBrains
  - standalone editor and plugin for IDEA
- Sublime Text
  - GoSublime plugin
  - Golang Build
- Vim
  - vim-go plugin
- VS Code
  - Go extension from Microsoft
    - alphabetizes imports
    - runs "gofmt" on code
    - and much more (DOCUMENT MORE)

## Installing

- approach #1
  - browse <https://golang.org/dl/>
  - download a platform-specific installer
  - double-click to run it
- approach #2 (Mac-only)
  - `brew install go`
- create a "go" directory in your home directory
  - GOPATH is set to this by default
  - to use another directory, set GOPATH to it
    - to set GOPATH to current directory
      - in Bash shell, `export GOPATH=`pwd`
      - in Fish shell, `set -x GOPATH (pwd)`

## Alternative Go Implementations

- gccgo <https://gcc.gnu.org/onlinedocs/gccgo/>
  - GNU compiler for Go
- gopherjs <https://github.com/gopherjs/gopherjs>
  - compiles Go to JavaScript
- llgo <https://github.com/go-llvm/llgo>
  - LLVM-based compiler for Go
- mgo? - can't find this, but heard it mentioned on "Go Time" podcast
  - for small processors like Arduino?
- WASM support coming soon
  - <https://react-etc.net/entry/webassembly-support-lands-in-go-language-golang-wasm-js>

## Syntax Highlights

Semicolons are not required,
but can be used to place multiple statements on the same line.

Types follow parameters, separated by a space.

Top-level names (not declared inside a function)
are exported (made visible outside their package)
if their names start uppercase.

A Go source file contains a package clause,
followed by zero or more import declarations,
followed by zero or more top-level declarations.

A top-level declaration is a declaration of a
constant, type, variable, function, or method.
These declarations can be intermixed in any order.

Control statements like `if` and `for` cannot appear outside of functions.

Outside of functions, every statement begins with a keyword.
This precludes the `:=` operator from being used outside of functions.

## Package Initialization

Initialization of top-level variables that require logic,
not just a literal values or results of function calls,
must be done in `init` functions.
A package can have any number of `init` functions
in any of its source files.
These functions are run in the order they appear,
and alphabetically by source file name within a package.
The `init` functions of all imported packages
are run before those of a given package.
All the `init` functions of all imported packages are run
before the `main` function of a application is run.

## Tooling

- `go` command has many sub-commands
- most commonly used commands

  - `go help [command|topic]`
    - outputs help
    - run with no argument to see a list of commands and topics
  - `go doc {package} [function|type]`
    - outputs brief documentation for a given package, constant, function, or type
    - ex. `go doc json`
    - `godoc {pkg}` (no space) outputs even more documentation
      - add `-src` to see source code
    - to get documentation on a single member of a package
      add a space and the name after the package name
      - ex. `godoc math/Rand Int31`
  - `go fix {file-or-directory-path}`
    - "finds Go programs that use old APIs and rewrites them to use newer ones."
    - "After you update to a new Go release,
      fix helps make the necessary changes to your programs."
  - `go get {pkg1} {pkg2} ...`
    - downloads and installs packages and their dependencies
  - `go build`
    - builds an executable for the package in the current directory
      that includes everything needed to run
      and places it in the current directory
    - the executable can be moved anywhere
    - Go tools do not need to be installed in order to execute the result
  - `go install {pkg-name}`
    - builds a package and installs it in $GOBIN which must be set
    - can omit pkg-name if if the package directory
  - `go clean -i {pkg-name}`
    - deletes the executable for the package from $GOBIN
    - can omit pkg-name if if the package directory
  - `go run {file-name}.go`
    - runs a program without producing an executable
  - `go test`
    - runs all the tests in the current package?
  - `go generate`

    - creates or updates Go source files
    - TODO: learn more about this

  - `go version`
    - outputs the version of Go that is installed
    - to get this in code, call `runtime.Version()`

Many sub-commands support the `-race` flag which
adds detection and reporting of data races.
These include `test`, `run`, `build`, and `install`.

## Code Formatting

- gofmt tool
  - uses tabs for indentation and spaces for alignment

## VS Code Go Extension

- provides auto complete of functions in packages
  and members of the current package
- hover over a name to see information about it in a popup
- ctrl-click (cmd-click) a name to jump to its definition,
  even names from a standard library package
- after typing the opening ( of a function call
  a popup describing the expected arguments appears
- invalid argument types are described in the PROBLEMS tab
- can find all references to a function by right-clicking and selected "Find All References"
- by default, when changes are saved
  - runs golint on the package of the `.go` file
  - runs go build on the application
  - runs go vet on all `.go` files in the project
- add user setting `"go.inferGopath": true,`
  - "will try to infer the GOPATH from the path of the workspace
    i.e. the directory opened in vscode. It searches upwards in the
    path for the src directory, and sets GOPATH to one level above that."
- "Go:" command Palette commands
  - "Add Import" displays a list of standard library packages
    - select one to add it
    - alphabetizes all current imports
  - "Browse Packages" displays a drop-down list of standard library packages
    - select one to see a list of files in the package
    - select a file to view the source code
  - "Current GOPATH" shows current GOPATH in a popup in lower right
  - "Generate Interface Stubs" is supposed to generate method stubs for
    all the methods in a given interface for a given receiver type,
    but I haven't been able to get it to work
  - "Generate Unit Tests for File" generates a `_test.go` file for the current file
    that provides a good starting point for implementing tests
  - "Run on Go Playground" loads current file into the web-based Go Playground
    where it can be run by pressing the "Run" button
  - "Test Function At Cursor" runs only the test function under the cursor
    - cursor must be over a test function, not the function to be tested
  - "Test File" runs all tests for the current file
  - "Test Package" runs all tests for the current package
  - "Test All Packages in Workspace" runs all tests under the `src` directory
    - includes running tests for all installed packages
- for a description of how this extension can use GOPATH see
  <https://github.com/Microsoft/vscode-go/wiki/GOPATH-in-the-VS-Code-Go-extension>

## Standard Library Packages

- Go provides many packages in the "standard library"
- to see a list of them, browse <https://golang.org/pkg/>
- highlights include
  - bufio - implements buffered I/O with Reader and Writer types
  - builtin - not a real package, but a place to document
    builtin constants, variables, functions, and types
  - container.list - implements doubly linked lists
  - database - defines interfaces implemented by database-specific drivers
  - encoding - defines interfaces for reading and writing
    various data formats such as csv, json, and xml
  - errors - defines `New` function to create error structs with a string
    description and a method to get those strings from an error struct
  - flag - implements command-line flag parsing
  - fmt - implements formatted I/O similar to C's `printf` and `scanf`
  - go - sub-packages implement all the standard go tooling
    such as source file parsing to ASTs and code formatting
  - html - implements functions to parse and create HTML
  - image - implements functions to parse (decode) and create (encode) images
  - io - implements functions to read and write buffers and files
  - log - implements simple logging
  - math - implements many math functions
  - mime - encodes and decodes multimedia formats
  - net - implements network I/O including TCP and UDP
  - net/http - implements functions to send and listen for HTTP and HTTPS requests
  - os - provides access to operating system functionality
    like that provided by UNIX shell commands
    - exposes the constants PathSeparator ('/' on UNIX)
      and PathListSeparator (':' on UNIX)
  - os/exec - runs external (operating system) commands
  - path - implements functions for working with UNIX-style file paths and URLs
  - reflect - implements run-time reflection to work with types determined at run-time
  - sort - implements functions for sorting slices and other collections
  - strconv - implements conversions to and from string representations of primitive types
  - strings - implements many functions on strings
    - includes `Contains`, `HasPrefix`, `HasSuffix`, `Index`, `Join`,
      `Repeat`, `Split`, `ToLower`, `ToTitle`, `ToUpper`, and `Trim`
    - defines `Builder`, `Reader`, and `Replacer` types
  - sync - provides synchronization primitives such as mutual exclusion locks
    - typically will use channels and `select` instead
  - testing - supports automated tests run by `go test`
    - quick sub-package implements fuzz testing
  - text - provides functions for parsing text,
    writing tabbed columns, and data-driven templates
  - time - provides functions to measure and display time and dates
  - unicode - provides functions for working with Unicode characters
  - also see "sub-repositories" that are part of the Go project,
    but maintained outside the main repository

## Community Packages

- to see a list of them with links to documentation,
  browse one of these
  - <https://godoc.org/>
  - <https://go-search.org/>
  - <https://github.com/golang/go/wiki/Projects>

## Getting Started

The initial file must contain:

```go
package main

func main() {
  ...
}
```

Each package can only have one `.go` file that defines a `main` function.
It is reasonable, but not required, to name this file `main.go`.

To run a Go program without building an executable,
enter `go run file-name.go`.

To build an executable in the current directory, enter `go build`.
This names the executable it creates using the name of the directory that
contains the `.go` file that contains the `main` function.

To execute it, enter `./file-name`.

To delete the local executable, enter `go clean`.

To build an executable and install it in the $GOBIN directory,
enter `go install`.
Assuming `$GOBIN` is listed in the `PATH` environment variable,
this can be executed by just entering the executable name.

To delete the installed executable, enter `go clean -i`.

## Important Environment Variables

- GOARCH
  - target architecture to use when compiling
- GOBIN
  - where packages are installed
- GOOS
  - target operating system when compiling
- GOPATH
  - where source files are located
  - change this when switching projects?
- GOROOT
  - what Go tools are installed

## Names

- Go requires some variable, function, and struct field names to be all uppercase
- includes ID, JSON, and URL

## Comments

- same a C
- `/* ... */` for multi-line comments
  - primarily used for the comment at the top of a package
    and to temporarily comment out sections of code
- `//` for single-line comments
  - used for all other kinds of comments,
    even those above functions

## Zero Values

Every type as a "zero value" which is the value it takes on when it is not initialized.

| Type            | Zero Value                                                      |
| --------------- | --------------------------------------------------------------- |
| bool            | false                                                           |
| number          | 0                                                               |
| rune            | 0                                                               |
| string          | ""                                                              |
| array           | array of proper length where all elements have their zero value |
| slice           | empty slice with length 0 and capacity 0                        |
| map             | empty map                                                       |
| struct          | struct where all fields have their zero value                   |
| all other types | nil                                                             |

## Variables

Variables in Go have the following characteristics:

- mutable unless defined with `const`
- block-scoped within functions, so those in
  inner scopes can shadow those in outer scopes
- names must start with a letter and
  can contain letters, digits, and underscores
- local to their package unless name starts uppercase

Go distinguishes between declaring, initializing, and assigning variables.

Variables that are declared outside of functions have package scope
which means they are accessible by all files in the package,
but not outside the package.
However, giving them a name that starts uppercase makes them
accessible anywhere the package is imported.

Variables outside of functions must be declared with a `var` statement.
This accepts a type and/or initial value. Examples include:

```go
var name string // defaults to zero value for the type
var name = "Mark"
var name string = "Mark"
```

While both a type and initial value can be provided,
that is redundant since the type can be inferred from the value
and some editor plugins/extensions will warn about this.

Multiple variables can be declared with one `var` statement.

```go
var name, age = "Mark", 57 // must initialize all
var (
  name string = "Mark"
  age number // not initializes, so will use zero value
)
```

When multiple consecutive variables have the same type,
the type can be omitted from all but the last.
For example, these are equivalent:

```go
var n1 string, n2 string, a1 int8, a2 int8, a3 int8
var n1, n2 string, a1, a2, a3 int8
```

Variables that are declared inside a function are local to that function.
There are two ways to declare variables inside a function.
One is to use a `var` statement just like when outside a function.
Another is to use the `:=` shorthand operator which does not allow a
type to be specified and instead infers it from the value on the right.
For example, `name := "Mark"`.

Multiple variables can be declared with one `:=` operator.
For example, `name, age := "Mark", 57`.

It is an error to attempt to declare a variable that has already been declared,
whether is with a `var` statement or using the `:=` operator.

Variables that have already been declared can be assigned new values
with the `=` operator. For example, `name = "Tami"`.
Multiple variables can be assigned with one `=` operator.
For example, `name, age = "Tami", 56`.

It is an error to attempt to assign to a variable that has not been defined.

The `:=` operator is particularly useful for capturing function return values.

There is an exception to the rule that existing variables cannot be re-declared.
As long as at least one variable on the left of `:=` has not yet been declared,
the other variables can already exist.
A common use case is when the variable `err` is used
to capture possible errors from a function call.

Functions can return an number of values.
Sometimes the caller is only interested in a subset of them.
The variable "\_" can be used to discard a specific return value.

## Constants

- defined with `const` keyword
- must be initialized to a primitive literal or an expression
  that can be computed at compile-time and results in a primitive value
- ex. const BLACKJACK = 21

## Operators

- arithmetic: `+`, `-`, `\*`, `/`, `%` (mod)
- arithmetic assignment: `+=`, `-=`, `\*=`, `/=`, `%=`
- increment: `++`
- decrement: `--`
- assignment: `=` (existing variable), `:=` (new variable)
- comparison: `==`, `!=`, `<`, `<=`, `>`, `>=`
  - arrays are compared by comparing their elements
  - structs are compared by comparing their fields
  - slices, maps, and functions cannot be compared
- logical: `&&` (and), `||` (or), `!` (not)
- bitwise: `&`, `|`, `^`, `&^` (bit clear)
- bitwise assignment: `&=`, `|=`, `^=`, `&^=`
- bit shift: `<<`, `>>`
- bit shift assignment: `<<=`, `>>=`
- channel direction: `<-`
- variadic parameter: `...paramName`
- slice spread: `sliceName...`
- pointer creation: `&varName`
- pointer dereference: `\*pointerName`
- block delimiters: `{ }`
- expression grouping: `( )`
- function calling: `fnName(args)`
- create array: `[elements]`
- struct member reference: `structName.memberName`
- statement separator: `;`
- array element separator: `,`
- define label: `someLabel:` (see `goto` keyword)

## Keywords

- `break` - breaks out of a `for` loop, `select`, or `switch`
- `case` - used in a `select` or `switch`
- `chan` - channel type
- `const` - declares a constant
- `continue` - advances to the next iteration of a for loop
- `default` - the default case in a `select` or `switch`
- `defer` - defers execution of a given function until the containing function exits
  - TODO: When is this useful? Why not move the call to the end of the function?
- `else` - part of an `if`
- `fallthrough` - used as last statement in a `case` to execute code in next `case`
- `for` - only loop syntax; C-style (init, condition, and post) or just condition
- `func` - defines a named or anonymous function
- `go` - precedes a function call to execute it asynchronously as a goroutine
- `goto` - jumps to a given label (see `:` operator)
- `if` - for conditional logic; also see `else`
- `import` - imports all the exports in given package(s)
  - see "Packages" section for more detail
- `interface` - defines a set of methods
  - defines a type where all implementing structs are compatible
  - structs do not state the interfaces they implement,
    they just implement all the methods
- `map` - type for a collection of key/value pairs where the keys and values can be any type
- `package` - specifies the package to which the current source file belongs
- `range` - used in a `for` loop to iterate over a string, array, slice, map, or receiving channel
- `return` - terminates the containing function and returns zero or more values
- `select` - chooses from a set of channel send or receive operations; see "Select" section
- `struct` -
- `switch` - similar to other languages; see "Switch" section
- `type` -
- `var` -

## Pointers

- hold the address of a variable or `nil
- `*Type` is the type for a pointer to a value of type `Type`
- to get the address of a variable
  - myPtr = &myVar
  - cannot get the address of a constant
- to create a value can get a pointer to it
  - `myPtr := new(type)`
  - another way is `var myThing type; myPtr := &myThing`
    - note that the assembly code generate for these is identical
- to get the value at a pointer
  - myValue = \*myPtr
- to modify the value at a pointer
  - \*myPtr = newValue
- pointer arithmetic is not supported

```go
var ptr *person // initialized to nil
ptr = &person // pointer to previously created person struct
var name1 = (*ptr).name
var name2 = ptr.name // shorthand for above, automatically dereferenced
```

## Output

- supported by the "fmt" package

```go
import "fmt"
fmt.Println(expression)
```

## If Statement

- parentheses are not needed around the condition being tested
- braces around body are required
- ex.

  ```go
  if x > 7 {
    ...
  } else {
    ...
  }
  ```

- can include a single initialization statement before the condition

  - the scope of the variable is the if statement,
    including the else block if present

  ```go
  if y := x * 2; y < 10 {
    ...
  }
  ```

## Switch Statement

- similar to other languages
- can switch on expressions of any type
- braces around body are required
- case values can be literal values or expressions
- case blocks do not fall through by default so `break` is not needed
- can use `fallthrough` to get this
- ex.

  ```go
  switch name {
    case "Mark":
      // handle Mark
    case "Tami":
      // handle Tami
    default:
      // handle all other names
  }
  ```

- omit expression after `switch` to run the first `case` block that evaluates to true

  - ex.

    ```go
    switch {
      case name == "Mark":
        // handle Mark
      case age < 20:
        // handle youngsters
      default:
        // handle all other cases
    }
    ```

- to switch on the type of an expression

  ```go
  switch value := expression.(type) {
    case int, float:
      // handle int or float
    case string:
      // handle string
    default:
      // handle all other types
  }
  ```

  - the variable `value` will have the actual type
  - `value :=` can be omitted if not needed
  - expression can be an interface type and
    the actual type can be type that implements the interface

## For Statement

- the only looping statement
- braces around body are required
- can use `break` and `continue` inside
- syntax is `for init; cond; post { ... }`
  - no parentheses are allowed
  - note that the three parts are separated by semicolons
  - the "init" and "post" parts, if present, must be a single statement,
    but multiple variables can be assigned in a single statement
- ex.

  ```go
  for i := 0; i < 10; i++ {
    ...
  }
  ```

- init and post are optional

  - so a while loop in other languages looks like this in go

  ```go
  for ; i < 10; {
    ...
  }
  ```

  - or drop the semicolons because when only one part is present it is assumed to be the condition

  ```go
  for i < 10 {
    ...
  }
  ```

  - omit the condition for an endless loop

  ```go
  for {
    ...
  }
  ```

## Strings

- immutable sequences of bytes representing UTF-8 characters
- literal values are delimited with double quotes or back-ticks (to include newlines)
- to declare and initialize, `name := "Mark"`
- to retrieve a character, `char := name[index]`
- it iterate over, `for _, char := range name { ... }`
- can concatenate with the `+` and `+=` operators
- the `string` type has no methods
- the standard library package `strings` provides
  many functions for operating on strings
  - ex. to split a string on whitespace characters
    ```go
    s := "This is a test."
    words := strings.Fields(s)
    for _, word := range words {  
      fmt.Println(word) // outputs "This", "is", "a", and "test."
    }
    ```

## Structs

- a collection of fields defined with the `struct` keyword
- field values can have any type,
  including other structs nested to any depth
- often will want to define a type name for a struct
- use the dot operator to get and set fields
- can be anonymous (less common) or assigned to a type (more common)
- anonymous struct example

  ```go
  var me = struct{
    name string
    age int8
  }{
    "Mark",
    57,
  }
  fmt.Println(me.name) // Mark
  me.age++
  fmt.Println(me.age) // 58
  ```

- struct type example

  ```go
  type person struct {
    name string
    age int8
  }

  var p1 = person{name: "Mark", age: 57} // initialize by field name
  var p2 = person{"Mark", 57} // initialize by field position
  // Uninitialized fields are initialized to their zero value.
  fmt.Println(p1.name) // Mark
  p2.age++

  // Print the struct for debugging.
  // Formatting strings are documented at <https://golang.org/pkg/fmt/>.
  // Can use %v for most things.
  fmt.Printf("%v\n", p2) // just field values: {Mark 58}
  fmt.Printf("%+v\n", p2) // including field names: {name:Mark age:58}
  fmt.Printf("%#v\n", p2) // Go-syntax representation main.person{name:"Mark", age:58}
  ```

- struct names must start uppercase if they
  should be accessible outside the current package
- field names must also start uppercase
  if they should be accessible outside the current package
- there is no support for destructuring like in JavaScript
- if a struct field name is omitted, it is assumed to be the same as the type

  - ex.

  ```go
  package main

  import (
    "fmt"
    "time"
  )

  func main() {
    type myType struct {
      name string // named field
      int // get name from a primitive type
      time.Month // get name from a library type
    }
    //myStruct := myType{name: "Mark", int: 7, Month: time.April}
    myStruct := myType{"Mark", 7, time.April}
    fmt.Printf("name = %v\n", myStruct.name)
    fmt.Printf("int = %v\n", myStruct.int)
    fmt.Printf("Month = %v\n", myStruct.Month)
  }
  ```

To embed a struct within another, include just its name to get a field with the same name or preceded the struct name with a field name. For example,

```go
type address struct {
  street string
  city   string
  state  string
  zip    string
}

type person struct {
  name        string
  address     // home
  workAddress address
}

me := person{
  name: "Mark Volkmann",
  address: address{
    street: "123 Some Street",
    city:   "St. Charles",
    state:  "MO",
    zip:    "63304",
  },
  workAddress: address{
    street: "123 Woodcrest Executive Drive",
    city:   "Creve Coeur",
    state:  "MO",
    zip:    "63141",
  },
}
```

- empty structs
  - written as `struct{}`
  - do not take up memory
  - ideal for values in maps used to represent sets,
    rather than boolean which does take up space

## Methods

- methods can be associated with any type
  - particularly useful for types that implement interfaces
  - otherwise can just write functions that take a value of the type as an argument
- cannot overload methods to create different implementations
  for different parameter types
- an instance of the type is referred to as the "receiver" for the method
- the syntax for defining a method is
  `func (receiver-info) name(parameter-list) (return-types) { body }`
  - note that there are three sets of parentheses
    if the method has more than one return value
- to call a method, add a dot, method name, and argument list
  after a variable that holds a value
- ex.

  ```go
  // Add a method to the type "pointer to a person struct".
  // Note how the receiver and its type appear
  // in parentheses before the method name.
  func (p *person) birthday() {
    p.age++
  }

  p := person{name: "Mark", age: 57}
  (&p).birthday() // invoked on a pointer to a struct
  p.birthday() // invoked on a struct
  fmt.Printf("%#v\n", p) // main.person{name:"Mark", age:58}
  ```

- in the previous example the receiver is a pointer to a struct
- allows the method to modify the struct and avoids making a copy of the struct
  - for these reasons, most methods take a pointer
- when the receiver is a type value and not a pointer to a type value
  the method receives a copy and cannot modify the original
- when a function has a parameter with a pointer type,
  it must be passed a pointer
- when a method has a pointer receiver,
  it can be invoked on a pointer to a struct or a struct
  - if invoked on a struct, it will automatically
    pass a pointer to the struct to the method
- can also add methods to primitive types if a type alias is created

  - otherwise get "cannot define new methods on non-local type"

  ```go
  type number int

  func (receiver number) double() number {
    return receiver * 2
  }

  var n number = 3
  // or could use: n := number(3)
  fmt.Println(n.double())
  ```

## Arrays

- indexes are zero-based
- have a fixed length
- declare with `[length]type`
  - ex. `var rgb [3]int`
  - placing the square brackets BEFORE the type comes from Algol 68
  - if anything other than a single integer is inside []
    it is a slice (see the "Slices" section)
- can initialize with values in curly braces
  - ex. `rgb := [3]int{100, 50, 234}`
- can get the value at an index
  - ex. `fmt.Println(rgb[1])`
- can change the value at an index
  - ex. `rgb[1] = 75`
- get length with `len(myArr)`
- for an array, `cap(myArr)` returns the same
- array elements can be arrays
- to iterate over the elements in an array

  ```go
  for index, value := range myArr {
    ...
  }
  ```

## Slices

- a view into an array with a variable length
- indexes are zero-based
- the zero value is nil (This seems wrong!)
- a distinct type from arrays
  - [3]int is an array
  - []int is a slice
  - functions that take an argument that is a slice cannot be passed an array
  - many functions prefer slices over arrays
  - nearly always you should create slices instead of arrays
- can create a slice by specifying the
  start (inclusive) and end (exclusive) indexes of an array
  - ex. `mySlice := myArr[start:end]`
  - if `start` is omitted, it defaults to 0
  - if `end` is omitted, it defaults to the array length
  - so `myArr[:]` creates a slice over the entire array
- modifying elements of a slice modifies the underlying array
- multiple slices on the same array see the same data
- `len(mySlice)` returns the number of elements it contains (length)
- `cap(mySlice)` returns the number of elements in the underlying array (capacity)
- a slice literal creates a slice and an underlying array
  - ex. `mySlice := []int{}` creates a slice where length and capacity are 0
  - ex. `mySlice := []int{2, 4, 6}` creates a slice where length and capacity are 3
  - looks like an array literal, but without a specified length
  - can also specify values at specific indices
    - ex. `mySlice := []int{2: 6, 1: 4, 0: 2}` is the same as the previous example
    - ex. `mySlice := []int{3: 7, 0: 2}` creates a slice where
      length and capacity are 4 (one more than the highest specified index)
- to append new elements to a slice
  - `mySlice = append(mySlice, 8, 10)`
    - appends the values 8 and 10
  - if the underlying array is too small,
    a larger array is automatically allocated
    (doubling the current capacity)
    and the returned slice will refer to it
  - cannot append to arrays which is a reason why slices are used more
- `make` function
  - can be used to create a slice and underlying array
    where the length and capacity are set
    without specifying initial elements
    - avoids reallocating space when elements are added later
      which is somewhat inefficient
  - if it is anticipated that many elements will be appended later,
    try to estimate the largest size needed at the start
    and use `make` to create the slice
  - ex. `mySlice := make([]int, 5)`
    - creates an underlying array of size 5
      and a slice of length 5 and capacity of 5
  - ex. `mySlice := make([]int, 0, 5)`
    - creates an underlying array of size 5 and
      a slice with initial length 0 and initial capacity of 5
- the most common ways to create a slice are to use
  a slice literal or the `make` function
- manually creating an array and then creating a slice over it
  is far less common
- to change the view of a slice into its underlying array,
  recreate it with different bounds
  - ex. `mySlice = mySlice[newStart:newEnd]`
- slice elements can be slices (multidimensional slices)

```go
ticTacToe := [][]string{
  []string{" ", " ", " "},
  []string{" ", " ", " "},
  []string{" ", " ", " "}}
  // If the last } is placed on a new line then a
  // comma is required at the end of the previous line.
}
ticTacToe[1][2] = "X"
```

- to use all the elements in a slice as separate arguments to a function
  follow the variable name holding the slice with an ellipsis
- slice of structs example

  ```go
  type person struct {
    name string
    age  int8
  }

  func main() {
    // Note how we do not need to precede each struct with "person".
    people := []person{{"Mark", 57}, {"Jeremy", 31}}
    fmt.Printf("%#v\n", people)
    // []main.person{main.person{name:"Mark", age:57}, main.person{name:"Jeremy", age:31}}
  }
  ```

## Maps

- collections of key/value pairs where keys and values can be any type
- a map type looks like `map[keyType]valueType`
  - ex. `var myMap map[string]int`
- two ways to create
  `myMap := make(map[keyType]valueType)`
  or
  `myMap := map[keyType]valueType{k1: v1, k2: v2, ...}`
- to add a key/value pair, `myMap[key] = value`
- to get the value for a given key, `value := myMap[key]`
- to get the value for a given key and verify that the key was present,
  as opposed to just getting the zero value because it wasn't

  ```go
  value, found := myMap[key]
  if found { ... }
  ```

- to delete a key/value pair, `delete(myMap, key)`
- to iterate over, `for key, value := range myMap { ... }`
- supports concurrent reads, but not concurrent writes
  or a concurrent read and write
  - can avoid with channels or mutexes

## Concurrency

- see Goroutines, Channels, and Select

## Goroutines

- a lightweight thread of execution managed by the Go runtime
- to create one, proceed any function call with `go`
  - arguments are evaluated in the current goroutine
  - function execution occurs in the new goroutine
- without using `go` the call is synchronous
- with using `go` the call is asynchronous
- the `main` function runs in a goroutine
- to get the number of currently running goroutines,
  call `runtime.NumGoRoutine()`
- to get the number of CPUs in the computer,
  call `runtime.NumCPU()`
  - may be useful to decide at runtime how many goroutines to start
- goroutines share memory, so access should be synchronized
- `time.Sleep(duration)` pauses the current goroutine for the given duration
  - duration is in nanoseconds (1 nanosecond = 1,000,000 milliseconds)

## Channels

Channels are "pipes" that connect concurrent goroutines.

- can send values to them and receive values from them
- to create a channel, `myChannel := make(chan type)`
  where type is a real type like `string`
- by default values can be sent to and received from channels
- to make a channel that
- to send a value to a channel, `myChannel <- value`
  - by default, blocks until the channel retrieves it (unbuffered)
- to receive a value from a channel, `value := <-channel`
  - by default, blocks until the channel sends it (unbuffered)
- a channel can be closed by passing it to the `close` function

  - a channel should only be closed by a sending goroutine,
    not be a receiving goroutine
  - a channel should only be closed when only a single goroutine sends to it
  - once a channel has been closed, a panic will be triggered
    if there is an attempt to send to it or close it again
  - when reading from a channel, a second return value
    indicates whether the channel is still open
    - ex. `data, open = <-myChannel`
  - see <https://go101.org/article/channel-closing.html>
    for details and more options

- channel direction

  - the type `chan` can both send and receive values
  - when a channel is passed to a function,
    the argument type can state that the function
    will only write to or read from the channel
    - to only write, use `chan<- type`
    - to only read, use `<-chan type`
    - can pass a read/write channel to a function
      that accepts a read-only or write-only channel,
      but not vice-versa
  - ex.

    ```go
    package main

    import "fmt"

    func writer(c chan<- int) { // only writes
      c <- 2
      c <- 7
    }

    func reader(c <-chan int) { // only reads
      n := <-c
      fmt.Println("got", n)
      n = <-c
      fmt.Println("got", n)
    }

    func main() {
      c := make(chan int) // works buffered or not
      go writer(c) // runs in a new goroutine
      reader(c) // runs in current goroutine
    }
    ```

- buffered channels

  - senders block if the buffer is full
  - receivers block if the buffer is empty
  - to create, add buffer size as second argument to make
    - ex. `myChannel := make(chan string, 5)`
    - there is probably no way to create a buffered channel without a size limit

- can iterate over channel values with a `for` loop

  - ex.

  ```go
  package main

  import "fmt"

  func getWords(c chan string) {
    c <- "alpha"
    c <- "beta"
    c <- "gamma"
    close(c)
  }

  func main() {
    c := make(chan string)
    go getWords(c)
    // This loop terminates when the channel is closed
    // without explicitly checking for that.
    for word := range c {
      fmt.Println(word)
    }
  }
  ```

````
- can use an additional, non-data channel to synchronize goroutine execution

  - to wait for a goroutine to complete, do something like this
    - this is a good approach when the receiving code gets data
      from multiple channels and there needs to be a way to know
      when to stop trying to receive data from any of them

  ```go
  import "time"

  func myAsync(done chan<- bool) { // can send, but not receive
    // Do some asynchronous thing.
    time.Sleep(time.Second * 3)
    // When it completes, do this:
    done <- true
  }

  done := make(chan bool, 1)
  go myAsync(done)
  <-done
  ```

  - senders can close a channel
    - not required
    - only close when receivers need to be notified that no more values will be sent
    - sending a value to a closed channel will trigger a panic
  - receivers can determine if the channel is closed
    by capturing a second return value that is a boolean
    indicating whether the channel is open
  - ex.

    ```go
    package main

    import "fmt"

    func getNumbers(start int, c chan<- int) {
      for n := start; n < 10; n += 2 {
        c <- n
      }
      close(c)
    }

    func main() {
      c1 := make(chan int)
      c2 := make(chan int)

      go getNumbers(1, c1) // odd numbers
      go getNumbers(2, c2) // even numbers

      n := 0
      moreEvens, moreOdds := true, true

      for {
        select {
        case n, moreOdds = <-c1:
          if moreOdds {
            fmt.Println(n, moreOdds)
          }
        case n, moreEvens = <-c2:
          if moreEvens {
            fmt.Println(n, moreEvens)
          }
        }
        if !moreEvens && !moreOdds {
          break
        }
      }
    }
    ```

## Select

- can wait on multiple channels
- blocks until one of the channels is ready
  unless the `select` contains a `default` block
  which is run if none of the channels are ready
- chooses randomly if multiple channels are ready
- when using `break` in a `select` `case` that is inside a `for` loop,
  to jump out of the loop add a label before the loop and break to it

  - alternatively use `return` to exit the containing function

  - ex.

    ```go
    c1 := make(chan string)
    c2 := make(chan string)

    go func() {
      time.Sleep(1 * time.Second)
      c1 <- "one"
    }()
    go func() {
      time.Sleep(2 * time.Second)
      c2 <- "two"
    }()

    for i := 0; i < 2; i++ {
      select {
      case msg1 := <-c1:
        fmt.Println("received", msg1)
      case msg2 := <-c2:
        fmt.Println("received", msg2)
      }
    }
    ```

## Functions

- defined with `func` keyword

```go
func myFunctionName(p1 t1, p2 t2, ...) returnType(s) {
  ...
}
```

- act as closures over all in-scope variables
- arguments are passed by value so copies are made of arrays, slices, and structs
- to avoid creating copies of structs, arrays, and slices,
  pass and accept pointers
- parameters cannot be optional
- cannot specify default values for parameters
- cannot overload functions to create different implementations
  for different parameter types
- can assign a function to a variable and
  call the function using that variable
  - ex. `fn := someFunction; fn()`
- can pass functions to a function
- can return functions from a function

- anonymous functions have the same syntax, but omit the name

  - ex. `func(v int) int { return v * 2 }`

- parameter types
  - when consecutive parameters have the same type,
    can omit the type from all but the last
  - ex. `func foo(p1 int, p2 int, p3 string, p4 string)`
    is equivalent to `func foo(p1, p2 int, p3, p4 string)`
- variadic functions
  - to accept a variable number of arguments
    precede last argument type with an ellipsis
  - ex.
    ```go
    func log(args ...any) {
      fmt.Println(args)
    }
    ```
- spreading a slice
  - to pass all the elements in a slice as separate arguments
    follow the argument with an ellipsis
  - ex. `log(mySlice...)`
- can return zero or more values

  - when there is more than one return value, the types
    must be surrounded by parentheses and separated by commas
    - why are parentheses required?
    - the return types are already guaranteed to be
      between the closing ) of the parameter list
      and the opening { of the code block

  ```go
  func GetStats(numbers []int) (int, float32) {
    sum := 0
    for _, number := range numbers {
      sum += number
    }
    average := float32(sum) / float32(len(numbers))
    return sum, average
  }

  func main() {
    sum, avg := GetStats(someNumbers)
  }
  ```

- named return values

  - if names are given to return types,
    a "naked return" will return them
  - ex.

    ```go
    func mult(n int) (times2, times3 int) {
      times2 = n * 2
      times3 = n * 3
      //return times2 times3 // don't need to specify return values
      return
    }

    // In some other function
    n2, n3 := mult(3) // n2 is 6 and n3 is 9
    ```

  - seems bad for readability

- deferred functions
  - inside a function, function calls preceded by `defer`
    will have their arguments evaluated,
    but will not execute until the containing function exits
  - all deferred calls are placed on a stack and
    executed in the reverse order from which they are evaluated
  - typically used for resource cleanup such as closing files that
    must occur regardless of the code path taken in the function

## Interfaces

- an interface defines a set of methods
- any type can implement an interface, even primitive types
- types do not state the interfaces they implement,
  they just implement all the methods
- when a value is assigned to a variable or parameter with an interface type,
  if its type does not implement all the interface methods then an error
  will be reported that identifies one of the missing methods
- calling a method on a variable with an interface type
  calls the method on the underlying type
- if a value has not be assigned to the variable,
  calling a method on it results in an error
- an interface with no methods, referred to as the "empty interface",
  matches every type
  - can give this a name using `type any interface{}`
- ex.

  ```go
  package main
  import "fmt"
  import "math"

  type geometry interface {
    area() float64
    name() string
  }

  type rect struct {
    width, height float64
  }
  func (r rect) area() float64 {
    return r.width * r.height
  }
  func (r rect) name() string {
    return "rect"
  }

  type circle struct {
    radius float64
  }
  func (c circle) area() float64 {
    return math.Pi * c.radius * c.radius
  }
  func (c circle) name() string {
    return "circle"
  }

  func printArea(g geometry) {
    fmt.Println("area =", g.area())
  }

  func main() {
    r := rect{width: 3, height: 4}
    c := circle{radius: 5}
    var g geometry
    //printArea(g) // panic: runtime error: invalid memory address or nil pointer dereference
    g = r
    printArea(g)
    g = c
    printArea(g)
  }
  ```

- a type assertion verifies that an interface variable refers to a specific type
  - ex. `myShape := g.(Rectangle)`
  - triggers a runtime panic if it does not
    - when using `go run` this won't happen if there are compile errors
      since the code will never run
- a type test determines whether an interface variable refers to a specific type

  - ex. `myShape, ok := g.(circle)`
  - `ok` will be set to `true` or `false` to indicate whether `g` refers to a `circle`
  - a panic will not be triggered

- `fmt` package defines the `Stringer` interface

  - defines one method named `String`
  - many packages check whether values implement this interface
    in order to convert values to strings
  - define the `String` method on a type to control this conversion
  - ex.

  ```go
  type person struct {
    name string
    age int8
  }

  // Note how the receiver is a person struct, not a pointer to one.
  func (p person) String() string {
    return fmt.Sprintf("%v is %v years old.", p.name, p.age)
  }

  me := person{"Mark", 57}
  fmt.Println(me)
  ```

- interfaces can be nested to add the methods of one interface to another

  - ex.

  ```go
  package main

  type shape2d interface {
    area() float32
  }

  type shape3d interface {
    shape2d
    volume() float32
  }

  type box struct {
    d float32
    h float32
    w float32
  }

  // Implements shape2d interface.
  // Accepting a pointer so a copy is not made.
  func (b *box) area() float32 {
    return b.w * b.h
  }

  // Implements shape3d interface.
  func (b *box) volume() float32 {
    return b.area() * b.d
  }

  func main() {
    myBox := box{d: 2, h: 3, w: 4}
    fmt.Println("area =", myBox.area())
    fmt.Println("volume =", myBox.volume())
  }
  ```

## Builtin Constants

- listed as being in a package named "builtin" for documentation purposes,
  but no such package actually exists
- boolean literals `true` and `false`
- `iota` - an untyped int whose value is zero
  - TODO: when is this typically used?

## Builtin Variables

- listed as being in a package named "builtin" for documentation purposes,
  but no such package actually exists
- `nil` - the zero value for a pointer, channel, func, interface, map, or slice

## Documentation Types

- these types appear in documentation, but are not real types
- `Type` - represents a specific type for a given function invocation
- `Type1` - like `Type`, but for a different type than it
- `ComplexType` - represents a complex64 or complex128
- `FloatType` - represents a float32 or float64
- `IntegerType` - represents any int type

## Builtin Types

- `bool` - values are the builtin constants `true` and `false`
  - can use with the operators &&, ||, and !
- `byte` - alias for uint8
- `complex64` and `complex128` - complex numbers
- `float32` and `float64` floating-point numbers
- `int`, `int8`, `int16`, `int32`, `int64` - signed integers
  - `int` is at least 32 bits
    - 32 bits on 32-bit systems
    - 64 bits on 64-bit systems
- `uint`, `uint16`, `uint32`, `uint64` - unsigned integers
  - `uint` is at least 32 bits
- `uintptr` - holds any kind of pointer
- `rune` - alias for int32; used for unicode characters
  that range in size from 1 to 4 bytes
  - literal values are surrounded by '
- `string` - a sequence of 8-bit bytes, not unicode characters
  - literal values are surrounded by " or `
  - "" strings cannot contain newlines and can contain escape sequences like \n
  - '' strings can contain newline characters
  - indexed from zero
  - to get the 3rd character, `str[2]`

## Builtin Functions

- these are listed as being in a package named "builtin"
  for documentation purposes, but no such package actually exists

### for complex numbers

- `complex` - constructs a complex value from two floating-point values
- `imag(c ComplexType) FloatType` - returns the imaginary part of a complex number
- `real` - returns the real part of a complex number

### for output

- `print(args ...Type)` - writes to stderr;
  useful for debugging; may be dropped from language
- `println(args ...Type)` - like `print` but adds newline
- see `fmt` package to write to stdout

### for data structures

- `append(slice []Type, elems ...Type) []Type` -
  appends elements to the end of a slice and returns the updated slice
- `cap(v Type) int` - returns the capacity of v
- `copy(dst, src []Type) int` - copies elements from a source slice
  to a destination slice and returns the number off elements copied
- `delete(m map[Type]Type1, key Type)` - deletes the element at a key from a map
- `len(v Type) int` - returns the length of v where v is a string, array, slice, or map?
- `make(t Type, size ...IntegerType) Type` -
  allocates and initializes a slice, map, or chan;
  if Type is Slice, pass the length, and optional capacity;
  if Type is Map, optionally specify number of key/value pairs for which to allocate space
- `new(Type) *Type` - allocates memory for a given type and returns pointer to it

### for channels

- `close(c chan<-)` - closes a channel after the last sent value is received
- `make(Channel, [buffer-capacity])` - unbuffered if buffer-capacity is omitted

### for error handling

- `panic(v interface{})` - stops normal execution of the current goroutine;
  cascades upward through call stack;
  terminates program and reports an error condition;
  can be controlled by the `recover` function
  - similar to `throw` in other languages
- `recover` - call inside a deferred function to
  stop the panic sequence and restore normal execution
  - similar to `catch` in other languages
- `error` - type that represents an error condition
  - has value `nil` when there is no error

## Type Conversions

- no conversions are performed implicitly
- builtin types can be used as conversion functions
- ex. `var f = float32(i)`
- will get an error if conversion cannot be done
  - for example attempting to convert a string to an int
  - will not convert a string containing a valid number to a number
    - use `strconv` package for this
    ```go
    s := "19"
    n, err := strconv.ParseInt(s, 10, 32) // base 10, bitsize 32
    ```

## Packages

- all code is in some package
- all `.go` files must start with a `package` statement and
  the package name must match the name of the directory that holds the file
  - ex. if the file `foo.go` is in a directory named `bar`,
    the first non-comment line in the file must be `package bar`
  - changing a package name requires renaming the directory
    and modifying the `package` statement in all the files
  - why isn't the package name just inferred from the directory name?
- community packages
  - have paths that reflect their repository URL
  - ex. github.com/julienschmidt/httprouter
  - when installed, these use the URL to determine
    their path under the `src` directory
  - avoids path conflicts
- it is recommended that your own packages go in directories that
  reflect their eventual URL should they be publish in the future
  - ex. my packages should be in src/github.com/mvolkmann/my-package-name
  - other packages would import this with
    `import "github.com/mvolkmann/mypkg"`
    and refer to names it exports with a prefix of `mypkg.`
- the `main` function is the starting point of all Go applications
  and must in the `main` package
  - this is the only package that does not need to match the name of the directory
- `import`
  - used to import all exported symbols (names that start uppercase) from given packages
  - unused imports are treated as errors
  - circular imports are treated as errors
  - can't import just a subset
  - the strings given to `import` are slash-separated paths
    where the last part is the package name
    - ex. in `import "math/rand"` the package name is "rand"
  - to import one package, `import "pkgName"`
  - to import multiple packages, `import ("pkgName1" "pkgName2" ...)`
  - can alias a package name with `import alias pkgName`
    and then reference exported names with `alias.exportedName`
- will get an error if no symbols from an import are used
- exported names must be referenced with `pkgName.exportedName`
- package implementations must be in a directory whose name matches the package name
- files that define the package must be in that directory,
  but can have any name that ends with `.go`
  - ex. if the package `baz` is defined by files in `$GOPATH/src/foo/bar/baz`
    then it is imported with `import "foo/bar/baz"` and
    the symbols it exports are references with `baz.exportedName` and
    the files that define the package must start with `package baz`
- standard library packages
  - always available and do not need to be installed
  - documented at <https://golang.org/pkg/>
  - import like any other package
- community packages
  - need to be installed, typically using `go get package-name`
  - the string after `import` is the package URL without the <https://> prefix
  - ex. `go get github.com/julienschmidt/httprouter`
    - installs in `$GOPATH/src/github.com/julienschmidt/httprouter`
    - `go get` will install under `$GOPATH/src`
      regardless of the directory from which it is run
    - to use in a .go file, `import "github.com/julienschmidt/httprouter"`
      and refer to the names it exports by preceding the names with `httprouter`

## Error Handling

- exceptions are not supported
- instead functions that may encounter errors have an
  additional return value of type `error` that callers must check

  ```go
  package main
  import (
    "errors"
    "fmt"
  )

  func divide(a, b float32) (float32, error) {
    if b == 0 {
      return 0, errors.New("divide by zero")
    }
    return a / b, nil // no error
  }

  func main() {
    // A common idiom for error checking using
    // the optional assignment of an "if"
    if q, err = divide(7, 0); err == nil {
      fmt.Print(q)
    } else {}
      fmt.Println(err) // prints error message
    }
  }
  ```

  - `error` is an interface that defines the `Error` function
  - can define custom errors that implement the Error method
    to convert to a string

    - ex.

    ```go
    type DivideByZero struct {
      numerator float32
    }

    func (err DivideByZero) Error() string {
      return fmt.Sprintf("tried to divide %v by zero", err.numerator)
    }

    func divide2(a, b float32) (float32, error) {
      if b == 0 {
        return 0, DivideByZero{a}
      }
      return a / b, nil
    }
    ```

## Logging

- the standard library `log` package provides methods that
  help with writing error messages to stderr
  - `log.Fatal(message)` outputs a line containing the date, time, and message,
    and exits with a status code of 1
  - `log.Panic(message)` outputs a line containing the date, time, and message,
    followed by a line containing "panic:" and the message again,
    followed by a stack trace,
    and exits with a status code of 2
- to write messages that include a file name and line number,
  write a function like this and call it from other functions

  ```go
  func logValue(name string, value interface{}) {
    // Passing 1 causes it to get the information
    // from one level higher in the call stack.
    _, file, line, ok := runtime.Caller(1)
    if ok {
      fmt.Printf("%s:%d %s=%v\n", file, line, name, value)
    } else {
      fmt.Printf("%s=%v\n", name, value)
    }
  }
  ```

## Tests

- implement tests in files whose name ends with `_test.go`
- `import "testing"` - a standard package
- write test functions whose names begin with `Test`
- these functions take one argument, `t \*testing.T`
- if a test assertion fails
  - call `t.Error(message)`
  - call `t.Errorf(formatString, values)`
  - can call `t.Fail()`, but that fails with no message
- to log a message in a test
  - call `t.Log(message)`
- "examples" are another way to write test functions
  - example function names begin with `Example`,
    followed by the name of the function or type being tested
    - when testing a method, end the function name with
      the type name followed by an underscore and the method name
  - example functions end with the comment `// Output:`
    followed by comment lines containing the expected output
- also see "benchmark" tests which are only run when the `-bench` flag is used
- ex. in src/statistics.go

  ```go
  package statistics

  func Sum(numbers []int) int {
    sum := 0
    for _, number := range numbers {
      sum += number
    }
    return sum
  }
  ```

- ex. in src/statistics_test.go

  ```go
  package statistics

  import (
    "fmt"
    "testing"
  )

  func TestSum(t *testing.T) {
    nums := []int{1, 2, 3}
    sum := Sum(nums)
    if (sum != 6) {
      t.Error("expected sum to be 6")
    }
  }

  func ExampleSun() {
    nums := []int{1, 2, 3}
    fmt.Println("sum is", Sum(nums))
    // Output:
    // sum is 6
  }
  ```

- run by entering `go test` in the directory of the tests

## Not Functional

- Go doesn't support functional programming out of the box
- can simulate some features like this

  ```go
  type intToIntFn = func(int) int

  func mapOverInts(arr []int, fn intToIntFn) []int {
    result := make([]int, len(arr))
    for i, v := range arr {
      result[i] = fn(v)
    }
    return result
  }

  rgb := [3]int{100, 50, 234}
  double := func(v int) int { return v * 2 }
  log(mapOverInts(rgb[:], double))
  ```

## Stack vs. Heap Memory Allocation

- the spec does not indicate when each is used
- the primary implementation makes some choices
- allocating on the stack is generally faster than the heap
- `new` always allocates on the heap

## Packaging Versioning

Support for package versioning is still an open issue.
The leading contenders are
vgo from Russ Cox at <https://github.com/golang/go/wiki/vgo>
and dep from Sam Boyer at <https://golang.github.io/dep/>.
vgo will be included in Go 1.11.
Note to self: Try vgo!

## Command-Line Arguments

- a slice of the command-line arguments is stored in os.Args
  which is accessible via `import "os"'
- index 0 holds the path to the executable
  which is dynamically created when "go run" is used
- index 1 holds the first command-line-argument
- ex. in file named `greet.go`

  ```go
  package main

  import (
    "fmt"
    "os"
  )

  func main() {
    args := os.Args[1:]
    if len(args) != 2 {
      fmt.Println("usage: greet {first-name} {last-name}")
      os.Exit(1)
    }
    firstName := args[0]
    lastName := args[1]
    fmt.Printf("Hello %s %s!\n", firstName, lastName)
  }
  ```

- to run, enter `go run greet.go Mark Volkmann`
- to build and run, enter `go build greet.go; ./greet Mark Volkmann`

## Readers

- `io` package defines the `Reader` interface
  that has a single method `Read`
  - populates a byte slice and returns the number of bytes read
    or an error (io.EOF if end of stream is reached)
- there are many implementations in the standard library
  including ones for reading from strings, files, and network connections
- to read from a string, see <https://tour.golang.org/methods/21>
- to read from a file

  - the package `io/ioutil` defines a `ReadFile` function
  - ex.

  ```go
  package main

  import (
    "fmt"
    "io/ioutil"
    "log"
  )

  func main() {
    // Read entire file into a newly created byte array.
    bytes, err := ioutil.ReadFile("haiku.txt")
    if err != nil {
      log.Fatal(err)
    } else {
      fmt.Println(string(bytes))
    }
  }
  ```

## Writers

- `io` package defines the `Writer` interface
  that has a single method `Write`
  - writes a byte slide to an underlying data stream
    and returns the number of bytes written or an error
- there are many implementations in the standard library
  including ones for writing to strings, files, and network connections
- to write to a string, see ?
- to write to a file

  - the package `io/ioutil` defines a `WriteFile` function
  - ex.

  ```go
  package main

  import (
    "io/ioutil"
    "log"
  )

  func main() {
    data := []byte("Line #1\nLine #2")
    mode := os.FileMode(0644)
    err := ioutil.WriteFile("new-file.txt", data, mode)
    if err != nil {
      log.Fatal(err)
    }
  }
  ```

- to write data a little at time

  ```go
  package main

  import (
    "fmt"
    "log"
    "os"
  )

  func check(e error) {
    if e != nil {
      log.Fatal(e)
    }
  }

  func writeLine(file *os.File, text string) {
    bytes, err := file.Write([]byte(text + "\n"))
    check(err)
    fmt.Printf("wrote %v bytes\n", bytes)
  }

  func main() {
    var (
      file *os.File
      err error
    )

    file, err = os.Create("out-file.txt")
    check(err)
    defer file.Close()

    writeLine(file, "Line #1")
    writeLine(file, "Line #2")
  }
  ```

## Mutexes

- the `sync` package defines the `Mutex` and `WaitGroup` structs
- using a `Mutex` is one way to prevent concurrent access
  to shared data from multiple goroutines
- to create a mutex, declare a variable of type `sync.Mutex`
  - ex. `var myMutex sync.Mutex`
  - often mutexes are held in the field of a struct
    that requires exclusive access
- to lock a mutex, `myMutex.Lock`
- to unlock a mutex, `myMutex.Unlock`
- a `WaitGroup` can be used to wait for multiple goroutines to complete
- to create a WaitGroup, declare a variable of type `sync.WaitGroup`
  - ex `var wg sync.WaitGroup`
- to increment the number of items in a WaitGroup, `wg.Add(n)`
  - call repeatedly to add more if necessary
- to mark a WaitGroup item as done, `wg.Done()`
- to wait for all items in a WaitGroup to be done, `wg.Wait()`
- ex.

  ```go
  package main

  import (
    "fmt"
    "math/rand"
    "sync"
    "time"
  )

  var mutex sync.Mutex
  var slice = make([]string, 0)
  var wg sync.WaitGroup

  func addString(s string) {
    mutex.Lock() // prevent concurrent access to the slice

    // Generate a random duration from zero to 500 milliseconds.
    duration := time.Duration(rand.Int63n(500)) * time.Millisecond
    fmt.Println("duration =", duration)
    time.Sleep(duration)

    slice = append(slice, s)
    fmt.Println("appended", s)

    mutex.Unlock() // finished using slice
  }

  // This adds a string to the slice a given number of times.
  func addStrings(s string, count int) {
    for n := 0; n < count; n++ {
      addString(s)
    }
    wg.Done() // mark this goroutine as done
  }

  func main() {
    wg.Add(2) // we will create two new goroutines
    go addStrings("X", 5) // starts first goroutine
    go addStrings("O", 3) // starts second goroutine
    wg.Wait() // wait for the two goroutines to be done
    fmt.Printf("%v\n", slice)
  }
  ```

## JSON

- the `encoding/json` package supports marshalling and unmarshalling of JSON
- to marshal data to JSON use the `json.Marshal` function

  - ex.

  ```go
  import "encoding/json"

  // Note that the field names must start uppercase
  // so the json package can see them.
  type person struct {
    Name string
    Age number
  }
  p := person{Name: "Mark", Age: 57}
  jsonData, err := json.Marshal(person)
  // jsonData will have the type []byte.
  // To get a string from it, use string(jsonData).
  ```

- to unmarshal data from JSON use the `json.Unmarshal` function

  - ex.

  ```go
  var p person
  err := json.Unmarshal(jsonData, @p)
  ```

## HTTP Servers

- can test REST service performance using the "RESTful Stress" Chrome extension
- consider using the httprouter package

  - ex.

```go
package main

import (
  "encoding/json"
  "fmt"
  "log"
  "net/http"

  "github.com/julienschmidt/httprouter"
)

type any interface{}

func getImageURL(res http.ResponseWriter, _ *http.Request, params httprouter.Params) {
  imageURL := "http://some-domain/some-image.jpg"
  sendText(res, imageURL)
}

func hello(res http.ResponseWriter, _ *http.Request, params httprouter.Params) {
  fmt.Fprintf(res, "hello, %s!\n", params.ByName("name"))
}

// Can"t just omit the unused parameters.
func index(res http.ResponseWriter, _ *http.Request, _ httprouter.Params) {
  fmt.Fprint(res, "Welcome!\n")
}

func notFound(res http.ResponseWriter, _ *http.Request) {
  fmt.Fprintf(res, "Sorry, I could not find that.")
}

func postFindPerson(res http.ResponseWriter, _ *http.Request, params httprouter.Params) {
  type person struct {
    Name string
    Age number
  }
  output := person{Name: "Mark", Age: 57}
  sendJSON(res, output)
}

func sendJSON(res http.ResponseWriter, obj any) {
  jsonData, err := json.Marshal(obj)
  if err != nil {
    msg := fmt.Sprintf("error marshaling %+v to JSON", obj)
    http.Error(res, msg, http.StatusBadRequest)
  } else {
    res.Header().Set("Content-Type", "application/json")
    res.Write(jsonData)
  }
}

func sendText(res http.ResponseWriter, text string) {
  res.Write([]byte(text))
}

func main() {
  router := httprouter.New()

  router.GET("/", index)
  router.GET("/hello/:name", hello)
  router.GET("/image/:id", getImageUrl)
  router.POST("/person", postFindPerson)

  // To get the file foo.html in the public directory,
  // browse localhost:8080/public/foo.html.
  router.ServeFiles("/public/*filepath", http.Dir("public"))
  router.NotFound = http.HandlerFunc(notFound)

  log.Fatal(http.ListenAndServe(":8080", router))
}
```

## go-watcher

- starts the application in the current directory
- watches all `.go` files in and below current directory and restarts the app if any are modified
- ideal for working on servers such as HTTP servers
- see <https://github.com/canthefason/go-watcher>
- GOPATH must be set to point to the directory containing the `src` directory of the app
- cd to the `src` which should contain one `.go` file
  in the `main` package with a `main` function
- enter `watcher`
  - can also specify command-line arguments to be passed to the app

## SQL Databases

- see <http://go-database-sql.org/> for
  more detail than what is provided here
- can use the standard library `database/sql`
  but also need database-specific drivers
  - to install the MySQL driver, enter `go get github.com/go-sql-driver/mysql`
  - to install the PostgreSQL driver, enter `go get github.com/lib/pq`
  - for other drivers, see <https://github.com/golang/go/wiki/SQLDrivers>
- ex.

  ```go
  package main

  import (
    "database/sql"
    "fmt"
    "log"

    _ "github.com/go-sql-driver/mysql" // anonymous import
  )

  func check(err error) {
    if err != nil {
      log.Fatal(err)
    }
  }

  func main() {
    db, err := sql.Open("mysql",
      "root:root@tcp(127.0.0.1:3306)/tour_of_heroes")
    check(err)
    defer db.Close()

    rows, err := db.Query("select name from hero")
    check(err)
    defer rows.Close()

    var name string
    for rows.Next() {
      err := rows.Scan(&name)
      if err != nil {
        log.Fatal(err)
      }
      log.Println("name =", name)
    }
    err = rows.Err()
    check(err)
  }
  ```

## Calling other languages from Go

- can use the `cgo` tool to create Go packages that call C code
  - see <https://golang.org/cmd/cgo/>
  - the C code can use the Java Native Interface (JNI)
    to call Java code

## Calling Go from other languages

- can use `gobind` to generate language bindings
  for calling Go functions from Java and Objective-C
- can build Go code with the `-buildmode=c-shared` flag
  to create a C shared library (in a shared object binary file)
  that can be used by C, Java, Node, Python, and Ruby code
  - see <https://medium.com/learning-the-go-programming-language/calling-go-functions-from-other-languages-4c7d8bcc69bf>

## Executing Shell Commands

- can execute shell commands using the standard library package `os/exec`
  - may not work in Windows
  - does not work in The Go Playground
- does not create a system shell
- does not expand glob patterns
  - to get this use a command that starts a shell like "bash"
- the `Command` function takes a command name and arguments
  and returns a struct describing the command
- this struct has many methods
  - the `Output` method runs a command,
    waits for it to complete, and returns a byte array
    containing everything the command writes to stdout
  - the `CombinedOutput` method runs a command,
    waits for it complete, and returns a byte array
    containing everything the command writes to stdout and stderr
  - the `Run` method runs a command, waits for it to complete,
    but doesn't capture what it writes to stdout or stderr
  - the `Start` method runs a command, but doesn't wait for it to complete,
    and doesn't capture what it writes to stdout or stderr
    - use the methods `StdinPipe`, `StdoutPipe`, and `StderrPipe` with this
  - the `Wait` method wait for a command that was
    started with the `Start` method to complete
- ex.

  ```go
  package main

  import (
    "fmt"
    "log"
    "os/exec"
  )

  func main() {
    date, err := exec.Command("date").Output()
    if err != nil {
      log.Fatal(err)
    }
    fmt.Printf("date = %s\n", date) // date = Fri Aug  3 13:32:22 CDT 2018
  }
  ```
````
