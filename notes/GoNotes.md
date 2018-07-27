# Go Programming Language Notes

## Overview

- announced by Google in 2009
- originally designed to be a systems programming language
  - but most developers use C, C++, or Rust for that
- currently the most common uses are for
  the server side of web application and dev ops tooling

## Characteristics

- high performance
- statically typed
- compiled
- provides type inference
- performs garbage collection
- supports networking operations
- supports concurrency

## Reasons to use

- type safety
- performance

## Installing

- browse <https://golang.org/dl/>
- download a platform-specific installer
- double-click to run it
- create a "go" directory in your home directory
  - GOPATH is set to this by default
  - to use another directory, set GOPATH to it

## Syntax

- no semicolons
- types follow parameters
- exported variables and struct members have names that start uppercase
- outside of functions, every line begins with a keyword
  - this explains why the `:=` operator is not allowed outside of functions

## Tooling

- `go` command has many sub-commands
- most commonly used commands
  - `go help [command|topic]`
    - outputs help
    - run with no argument to see a list of commands and topics
  - `go doc {pkg}`
    - outputs documentation for a given package
    - ex. `go doc json`
  - `go get {pkg1} {pkg2} ...`
    - downloads and installs packages and their dependencies
  - `go build {file-name}.go`
    - builds an executable that includes everything needed to run
    - Go tools do not need to be installed in order to execute the result
  - `go install {pkg-name}`
    - builds a package and installs it in the directory in GOBIN
  - `go run {file-name}.go`
    - runs a program without producing an executable
  - `go test`
    - runs all the tests in the current package?
  - `go generate`
    - creates or updates Go source files
    - TODO: learn more about this

## VS Code Go Extension

- why isn't "format on save" working?
- for a description of how this extension can use GOPATH see
  <https://github.com/Microsoft/vscode-go/wiki/GOPATH-in-the-VS-Code-Go-extension>

## Standard Library Packages

- to see a list of them, browse <https://golang.org/pkg/>

## Community Packages

- to see a list of them with links to documentation,
  browse one of these
  - <https://godoc.org/>
  - <https://go-search.org/>
  - <https://github.com/golang/go/wiki/Projects>

## Getting Started

- initial file must contain
  - `package main`
  - `func main() { ... }`
- can run with
  - `go run file-name.go`
  - `go build file-name.go; ./file-name`

## Important Environment Variables

- GOARCH
  - target architecture to use when compiling
- GOBIN
  - where packages are installed
- GOOS
  - target operating system when compiling
- GOPATH
  - where source files are located
- GOROOT
  - what Go tools are installed

## Primitive Types

- bool
  - can use with the operators &&, ||, and !
- byte - alias for uint8
- int int8 int16 int32 int64
- uint uint8 uint16 uint32 uint64 uintptr
- rune - alias for int32; used for unicode
- float32 float64
- complex64 complex128
- string
  - literal values are surrounded by " or `
  - "" strings cannot contain newlines and can contain escape sequences like \n
  - '' strings can contain newline characters
  - indexed from zero
  - to get the 3rd character, `str[2]`
- the size of int, uint, and uintptr are usually
  - 32 bits on 32-bit systems
  - 64 bits on 64-bit systems

## Variables

- mutable unless defined with `const`
- block-scoped
- names must start with a letter and
  can contain letters, digits, and underscores
- local to their package unless name starts uppercase
- can define a variable without initializing
  - `var x int`
  - it's an error if the variable has already been defined
- can define a variable with initial value
  - `var x = 3`
- can do both, but that is redundant
  - `var x int = 3`
- `var` can be used inside or outside of a function
- can assign a value to an already defined variable
  - `x = 4`
  - it's an error if the variable has not already been defined
- `:=` can only be used inside a function
  - defines and initializes a new variable
  - `x := 5` is shorthand for `var x = 5`
  - particularly useful for capturing function return values
    and creating multiple variables in a single line
- the variable "\_" is used to discard a function return value
- uninitialized variables are set to their "zero value"
  - false for bool
  - 0 for numbers
  - "" for strings
  - nil for pointers

## Pointers

- hold the address of a variable or `nil
- to get the address of a variable
  - myPtr = &myVar
- to get the value at a pointer
  - myValue = \*myPtr
- to modify the value at a pointer
  - \*myPtr = newValue

## Output

```go
import "fmt"
fmt.Println(expression)
```

## Structs

## Arrays

- have a fixed length

## Slices

- like an array with a variable length

## Maps

## Channels

## Functions

- defined with `func` keyword
- arguments are passed by value
- to avoid creating copies of structs, arrays, and slices,
  pass pointers

```go
func myFunctionName(args) return-type {
  ...
}
```

## Packages

## Concurrency
