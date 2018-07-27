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
- minimal support for object-oriented programming
  - through structs with methods
- no support for functional programming
  - for example, no builtin map, filter, and reduce functions for arrays

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

## Code Formatting

- gofmt tool
  - uses tabs for indentation and spaces for alignment

## VS Code Go Extension

- may need to
  - set GOPATH environment variable and restart VS Code before installing this
  - run `go get -u github.com/mdempsky/gocode`
  - run `go get -u golang.org/x/lint/golint`
  - set GOPATH to ~/go
  - create a `bin` subdirectory
  - set GOBIN to $GOPATH/bin
  - add $GOBIN to PATH
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
- can define multiple variables with one `var`

  ```go
  var (
    alpha = 1
    beta = 2
  )
  ```

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
  - nil for pointers and slices
  - TODO: What is the zero value for an array? An empty array?

## Constants

- defined with `const` keyword
- must be initialized
- ex. const BLACKJACK = 21

## Pointers

- hold the address of a variable or `nil
- to get the address of a variable
  - myPtr = &myVar
- to get the value at a pointer
  - myValue = \*myPtr
- to modify the value at a pointer
  - \*myPtr = newValue

## Output

- supported by the "fmt" package

```go
import "fmt"
fmt.Println(expression)
```

## If Statement

- parentheses are not required around the condition being tested
- ex.

  ```go
  if x > 7 {
  } else {
  }
  ```

## Switch Statement

## For Statement

- the only looping statement
- syntax is `for init; cond; post { ... }`
- ex.

  ```go
  for i: 0; i < 10; i++ {
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

## Structs

## Arrays

- indexes are zero-based
- have a fixed length
- declare with `[length]type`
  - ex. `var rgb [3]int`
- can initialize with values in curly braces
  - ex. `rgb := [3]int{100, 50, 234}`
- can get the value at an index
  - ex. `fmt.Println(rgb[1])`
- can change the value at an index
  - ex. `rgb[1] = 75`
- array elements can be arrays
- to iterate over the elements in an array

  ```go
  for index, value := range myArr {
    ...
  }
  ```

## Slices

- a view into an array with a variable length
- create by specifying the start (inclusive) and end (exclusive) indexes of an array
  - ex. `mySlice = myArr[start:end]`
  - if `start` is omitted, it defaults to 0
  - if `end` is omitted, it defaults to the array length
  - so `myArr[:]` creates a slice over the entire array
- modifying elements of a slice modifies the underlying array
- multiple slices on the same array see the same data
- a slice literal creates a slice and an underlying array
  - ex. `mySlice = []int{2, 4, 6}`
- `len(mySlice)` returns the number of elements it contains (length)
- `cap(mySlice)` returns the number of elements in the underlying array (capacity)
- to extend a slice, recreated it with different bounds
  - ex. `mySlice = mySlice[newStart:newEnd]`
- the zero value is nil
- `make` function
  - can create a "dynamically-sized array"
  - ex. `mySlice := make([]int, 5)`
    - creates an underlying array of size 5
      and a slice of length 5 and capacity of 5
  - ex. `mySlice := make([]int, 0, 5)`
    - creates an underlying array of size 5
      and a slice of length 0 and capacity of 5
  - to expand the size of the slice
    `mySlice = mySlice[newStart:newEnd]`
- slice elements can be slices
- to append new elements to a slice
  - this is where it really gets dynamic!
  - `mySlice = append(mySlice, 8, 10)`
  - appends the values 8 and 10
  - if the underlying array is too small,
    a larger array is automatically allocated
    and the returned slice will refer to it
    - since this can be inefficient, try to
      estimate the largest size needed at the start

## Maps

- to iterate over the key/value pairs in a map

  ```go
  for key, value := range myMap {
    ...
  }
  ```

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

- anonymous functions have the same syntax, but omit the name
  - ex. `func(v int) int { return v * 2 }`

## Not Functional

- Go doesn't support functional programming out of the box
- can simulate some features like this

  ```go
  type intToIntFn = func(int) int

  func mapOverInts(arr []int, fn intToIntFn) []int {
    result := make([]int, len(arr))
    for i, v := range(arr) {
      result[i] = fn(v)
    }
    return result
  }

  rgb := [3]int{100, 50, 234}
  double := func(v int) int { return v * 2 }
  log(mapOverInts(rgb[:], double))
  ```

## Packages

## Concurrency
