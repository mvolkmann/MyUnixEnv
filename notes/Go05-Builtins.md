## Builtins

The builtin constants, variables, and functions
provided by Go are listed as being in a package
named "builtin" for documentation purposes,
but no such package actually exists.

The following sections describe each of the provided builtins.

### Builtin Constants

The provided constants include
the boolean literals `true` and `false`, and `iota`.

`iota` is not actually a constant.
It is a global counter that is set to zero
at the beginning of every `const` definition,
which is the only place it can be used.

The value of `iota` is incremented by one after each line in the
`const` definition, except for blank lines and comment lines.
It is typically used to define enumerated values.
The last expression involving `iota` is repeated for subsequent
constant values, but uses an incremented value of `iota`.
For example:

```go
const (
  red   = iota // 0
  green        // 1
  blue         // 2
)

const (
  north = iota + 1 // iota = 0, 0 + 1 = 1
  south            // iota = 1, 1 + 1 = 2
  east             // iota = 2, 2 + 1 = 3
  west             // iota = 3, 3 + 1 = 4
)

const (
  t1 = iota * 3 // iota = 0, 0 * 3 = 0
  t2            // iota = 1, 1 * 3 = 3
  t3            // iota = 2, 2 * 3 = 6
)

const (
  _        = iota             // iota = 0, ignore first value
  kb int64 = 1 << (10 * iota) // iota = 1, 1 shifted left 10 places, 1024
  mb                          // iota = 2, 1 shifted left 20 places, 1048576
  gb                          // iota = 3, 1 shifted left 30 places, 1073741824
)

// Silly example
const (
  apple  = 9        // iota = 0
  banana = 8        // iota = 1
  cherry = iota + 3 // iota = 2, value = 2 + 3 = 5
  date              // iota = 3, value = 3 + 6 = 6
)
```

### Builtin Variables

There is only one provided variable, named `nil`.
This is the zero value for a
pointer, channel, func, interface, map, or slice.
For example,
the current value of all the variables below is nil.

```go
var ptr *string         // pointer

var c chan string       // channel

type stringToString func(string) string
var f stringToString    // function

var i error             // interface

var m map[string]string // map

var s []string          // slice
```

### Builtin Types

Go defines the following builtin "basic types".

- `bool`\
  The only values are the builtin constants `true` and `false`.
  These can use with the operators `&&`, `||`, and `!`.
- `byte`\
  This is an alias for the type `uint8`.
- `complex64` and `complex128`\
  These are used to represent complex numbers
  with a specified number of bits.
- `float32` and `float64`\
  These are used to represent floating-point numbers
  with a specified number of bits.
  `float64` is preferred in most cases.
- `int`, `int8`, `int16`, `int32`, `int64`:
  These are used to represent signed integers
  with a specified number of bits.
  The type `int` is at least 32 bits.
  Its size is based on the word size of the host platform,
  32 bits on 32-bit systems and
  64 bits on 64-bit systems.
  `int` is preferred in many cases.
- `uint`, `uint16`, `uint32`, `uint64`\
  These are used to represent unsigned integers
  with a specified number of bits.
  The type `uint` is at least 32 bits.
- `uintptr`\
  This type can hold any kind of pointer.
- `rune`\
  This is an alias for `int32`.
  It is used for unicode characters
  that range in size from 1 to 4 bytes.
  Literal values of this type are surrounded by single quotes.
- `string`\
  This is a sequence of 8-bit bytes, not Unicode characters.
  However, the bytes are often used to represent Unicode characters.

Go defines the type `error` to represent an error condition.
Variables of this type have the value `nil` when there is no error.

Non-basic types include aggregate, reference, and interface types.
Aggregate types include arrays and structs.
Reference types include pointers, slices, maps, functions, and channels.

### Documentation Types

Despite Go not currently supporting generic types,
the following "generic type" names that are not real types
appear in the Go documentation.

- `Type` - represents a specific type for a given function invocation
- `Type1` - like `Type`, but for a second type
- `ComplexType` - represents a complex64 or complex128
- `FloatType` - represents a float32 or float64
- `IntegerType` - represents any integer type

### Builtin Functions

#### Data Structure Functions

- `append(slice []Type, elems ...Type) []Type`\
  This appends elements to the end of a slice and returns the updated slice.
- `cap(v Type) int`\
  This returns the capacity of of a string, array, slice, or map.
- `copy(dst, src []Type) int`\
  This copies elements from a source slice to a destination slice
  and returns the number of elements copied.
- `delete(m map[Type]Type1, key Type)`\
  This deletes a key/value pair from a map.
- `len(v Type) int`\
  This returns the length of a string, array, slice, or map
- `make(t Type, size ...IntegerType) Type`\
  This allocates and initializes a slice, map, or channel.\
  If Type is Slice, pass the length, and optional capacity.\
  If Type is Map, optionally specify the number of key/value pairs for which to allocate space.
- `new(Type) *Type`\
  This allocates memory for a given type and returns pointer to it.

#### Output Functions

- `print(args ...Type)`\
  This writes to stderr; useful for debugging.
- `println(args ...Type)`\
  This is like `print`, but adds a newline at the end.
- To write to stdout, see the `fmt` package.

#### Error Handling Functions

See the earlier section "Error Handling" for more detail on these.

- `panic(v interface{})`\
  This stops normal execution of the current goroutine.\
  It is somewhat like a `throw` in other languages.\
  Control cascades upward through the call stack.\
  When it reaches the top, the program is terminated and an error is reported.\
  This can be controlled by the `recover` function.
- `recover`\
  This should be called inside a deferred function to stop the panic sequence\
  and restore normal execution.
  It is somewhat like a `catch` in other languages.

#### Channel Functions

Channels will be covered in detail in a future article on concurrency.

- `close(c chan<-)`\
  This closes a channel after the last sent value is received.
- `make(Channel, [buffer-capacity])`\
  This creates a channel.\
  The channel is unbuffered if `buffer-capacity` is omitted.

#### Complex Number Functions

- `complex(real, imag FloatType) ComplexType`\
  This creates a complex value from two floating-point values
  that represent the real and imaginary parts.
- `imag(c ComplexType) FloatType`\
  This returns the imaginary part of a complex number.
- `real(c ComplexType) FloatType`\
  This returns the real part of a complex number.

### Type Conversions

No type conversions are performed implicitly.
For example, non-boolean values are not automatically converted
to booleans to allow them to be used in a boolean context.

Many builtin types can be used as conversion functions.
For example, `float32(value)` converts any numeric type to a `float32`
and `int(value)` converts any numeric type to an `int`,
truncating any fractional part.

The `bool` type cannot be used as a function
to convert other basic types to a boolean.
For example, if `n` is a variable that holds an `int`,
`bool(n)` results in a compile-time error
and does not return true or false.
To obtain a boolean value from a number,
use an expression like `n != 0`.

In numeric conversions, if the value is too large to fit
in the target type, the value will be changed.
For example, in `i := 1234; j := int8(i)` the value of `j`
will be -46 because 1234 is too large to fit in an `int8`.

Using the builtin primitive types as conversion functions
will trigger an error if the conversion cannot be performed.
For example, attempting to convert a string to an int is an error,
even if the string contains a valid number.

To convert the string representation of a number to a number,
use the `strconv` package. For example,

```go
s := "19"
i, err := strconv.ParseInt(s, 10, 32) // base 10, bitsize 32

s = "3.14"
f, err := strconv.ParseFloat(s, 65) // bitsize 64
```

When a value is held in an interface type,
including the "any" type `interface{}`,
a type assertion can be used to convert it to a non-interface type.
For example, `var f = value.(float32)` converts
a value with an interface type to a `float32`.
This only works if the value actually has a type of `float32`.
See the earlier section "Type Assertions" for more detail.

### Standard Library Packages

Go provides many packages in the "standard library".
To see a list of them, browse <https://golang.org/pkg/>.
Clicking on a library function displays its source code
which is useful for learning how they work
and seeing examples of good Go code.

Highlights of the standard library include:

- `bufio`\
  This provides functions to perform buffered I/O
  using the types `Reader` and `Writer`.\
  It also provides a `Scanner` type that
  splits input into lines and words.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `builtin`\
  This not a real package, just a place to document
  builtin constants, variables, types, and functions.
- `container/heap`\
  This implements a kind of tree data structure.
- `container/list`\
  This implements doubly linked lists.
  It is described in more detail in the "Doubly Linked List" section below.
- `container/ring`\
  This implements circular lists.
- `database/sql`\
  This defines interfaces implemented by relational database-specific drivers.
  For example, there are drivers for MySQL and PostgreSQL.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `encoding`\
  This defines interfaces for reading and writing
  various data formats such as CSV, JSON, and XML.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `errors`\
  This provides the `New` function that creates `error` values
  that have a string description and
  a method named `Error` to retrieve the description.
  This package was described in more detail
  in the earlier "Error Handling" section.
- `flag`\
  This provides flag parsing for command-line applications.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `fmt`\
  This provides functions for formatted I/O.
  Many of its functions are similar to C's `printf` and `scanf`.
  This package is described in more detail in the "fmt" section below.
- `go`\
  The sub-packages of this package implement all the standard go tooling
  such as source file parsing to ASTs and code formatting.
  This package was described in more detail
  in the first article in the series.
  Additional detail will be provided in a future article on Go tooling.
- `html`\
  This provides functions to parse and create HTML.
- `image`\
  This provides functions to parse (decode) and create (encode) images
  in the GIF, JPEG, and PNG formats.
- `io`\
  This provides functions to read and write buffers and files.
  The function `io.Copy` copies data from a writer to a reader.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `log`\
  This provides simple logging.
  This package is described in more detail in the "Logging" section below.
- `math`\
  This provides many math functions.
- `mime`\
  This provides functions to encode and decode multimedia formats.
- `net`\
  This provides functions that perform network I/O including TCP and UDP.
- `net/http`\
  This provides functions to send and listen for HTTP and HTTPS requests.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `os`\
  This provides access to operating system functionality
  like that provided by UNIX shell commands.
  It defines the `File` type which supports
  opening, reading, writing, and closing files.
  It defines the constants `PathSeparator` ('/' on UNIX)
  and `PathListSeparator` (':' on UNIX).
  It provides the function `os.Exit(status)`
  that exits the process with a given status.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `os/exec`\
  This provides functions that run external (operating system) commands.
- `path`\
  This provides functions that work with UNIX-style file paths and URLs.
- `reflect`\
  This provides types and functions that support using reflection
  to work with types determined at run-time.
  This package will be described in more detail
  in a future article on reflection in Go.
- `regexp`\
  This provides functions that perform regular expression searches.
  This package is described in more detail
  in the "Regular Expressions" section below.
- `sort`\
  This provides functions that sort slices and other collections.
  This package is described in more detail
  in the "Sorting" section below.
- `strconv`\
  This provides conversions to and from
  string representations of primitive types.
  For example, `strconv.Atoi` converts a `string` to an `int`
  and `strconv.Itoa` converts an `int` to a `string`.
  This package was described in more detail
  in the "Type Conversions" section above.
- `strings`\
  This provides many functions that operate on strings including
  `Contains`, `HasPrefix`, `HasSuffix`, `Index`, `Join`,
  `Repeat`, `Split`, `ToLower`, `ToTitle`, `ToUpper`, and `Trim`
  It also defines the `Builder`, `Reader`, and `Replacer` types.
  This package was described in more detail
  in the earlier "Strings" section.
- `sync`\
  This provides synchronization primitives such as mutual exclusion locks.
  Often code will use channels and `select` instead to achieve this.
  This package will be described in more detail
  in a future article on concurrency in Go.
- `testing`\
  This provides functions and types that
  support automated tests run by `go test`.
  The sub-package `quick` implements fuzz testing.
  This package will be described in more detail
  in a future article on tests in Go.
- `text`\
  This provides functions that parse text,
  write tabbed columns, and support data-driven templates.
  This package will be described in more detail
  in a future article on common tasks in Go.
- `time`\
  This provides functions that measure and display time and dates.
  Use of this package was demonstrated in the
  earlier "Struct Field Encapsulation" section.
- `unicode`\
  This provides functions that work with and test Unicode characters.
  This package is described in more detail
  in the "Unicode" section below.

In addition to the standard library,
also see the "sub-repositories" that are part of the Go project,
but maintained outside the main repository.

The following sections provide examples
of using some of the standard libraries.
These include `strings`, `text/template`, and `time`.

#### `fmt` Standard Library

The `fmt` standard library package defines many functions
that read and write formatted messages.

Functions that read have names that start with `Scan`.
Functions that write have names that start with `Print`.

The most commonly used functions in this package include:

- `fmt.Errorf(format string, args ...interface{}) error`\
   This creates an error value containing a formatted message.

- `fmt.Printf(format string, args ...interface{})`\
  This writes a formatted string to stdout.

- `fmt.Println(args ...interface{})`\
  This writes the string representation of each of the arguments
  to stdout, separated by spaces and followed by a newline.

Format strings can contain placeholders that begin with a percent sign.
These are referred to as "verbs". Commonly used verbs include:

- `%d` for decimal values (includes all the integer types)
- `%f` for floating point values
- `%t` for boolean values to output "true" or "false"
- `%s` for strings
- `%v` for any value
- `%T` to output the type of a value
- `%*s` to output a string with a number of leading spaces\
  This consumes two values, the number of leading spaces and the string to follow.

It is common for format strings to end with `\n`
to output a newline character.

For example, to output a number indented by
the number spaces specified in the variable `indent`,

```go
indent := 4
number := 19
fmt.Printf("%*s%d\n", indent, "", number)
// outputs "    19" without the quotes
```

#### Logging

The `log` standard library package provides functions
that help with writing error messages to stderr.

By default, `log.Fatal(message)` outputs a line
containing the date, time, and message,
and exits with a status code of 1.

By default, `log.Fatalf(formatString, args)` is similar,
but uses a format string to specify the message string
that includes placeholders for the remaining arguments.

Including the date and time in log messages
is useful in long-running applications
like web servers.

A custom prefix can be added to all messages
produced by the `log` package
by calling `log.SetPrefix(prefix)`.

The date and time can be suppressed
in all messages produced by the `log` package
by calling `log.SetFlags(0)`.
This function takes an integer which is the result of or'ing
predefined constants that identify the desired parts of the prefix.

The constants are:

- `Ldate` - yyyy/mm/dd in local time zone
- `Ltime` - hh:mm:ss in local time zone
- `Lmicroseconds` - hh:mm:ss.microseconds
- `Llongfile` - full-file-path:line-number
- `Lshortfile` - file-name.file-extension:line-number
- `LUTC` - use UTC instead of local time zone for dates and times
- `LstdFlags` - same as `Ldate | Ltime`; the default flags value

`log.Panic(message)` outputs a line
containing the date, time, and message,
followed by a line containing "panic:" and the message again,
followed by a stack trace.
It exits the application with a status code of 2.

To write messages to stdout that include
a file name, line number, name of a variable, and its value,
write a function like the following and call it from other functions.

```go
func logValue(name string, value interface{}) {
  // Passing 1 to runtime.Caller causes it to get the
  // information from one level higher in the call stack.
  _, file, line, ok := runtime.Caller(1)
  if ok {
    fmt.Printf("%s:%d %s=%v\n", file, line, name, value)
  } else {
    fmt.Printf("%s=%v\n", name, value)
  }
}
```

- TODO: Should you add sections on any other standard library packages?
- TODO: Maybe some are already described in the "Common Tasks" section.

#### Doubly Linked Lists

`container/list`\

The `container/list` standard library package defines the types
`List` and `Element` for creating and operating on doubly linked lists.

`Element` objects represent nodes in the `List`.
They are structs that have a `Value` field
with a type of `interface{}` which
allows them to hold a value of any type.

To create a new, empty doubly linked list, use the `List` method `New`.
For example, `myList := list.New()`.

To add an `Element` to a `List`, use the `List` methods
`PushFront`, `PushBack`, `InsertAfter`, and `InsertBefore`.
These take a value of any type and return
the `Element` object they add to the `List`.

To get the length of a `List`, use the `List` method `Len`.

To get the first or last `Element` in a `List`,
use the `List` method `Front` or `Back`.

To add a copy of all the `Element` objects in another `List` to a `List`,
use the `List` methods `PushFrontList` and `PushBackList`.

To move an `Element` object to another location within its `List`, use the
`List` methods `MoveToFront`, `MoveToBack`, `MoveAfter`, and `MoveBefore`.

To remove an `Element` from its `List`, use the `List` method `Remove`.

To remove all the `Element` objects from a `List`,
making it empty, use the `Init` method.

To get the `Element` that comes before or after a given `Element`,
use the `Element` method `Prev` or `Next`.

For example:

```go
package main

import (
  "container/list"
  "fmt"
)

type Team struct {
  name   string
  wins   int
  losses int
}

func main() {
  // Create an empty, doubly-linked list.
  teams := list.New()

  // Add Element objects to the list.
  firstPlace := teams.PushFront(Team{"Chiefs", 9, 2})
  lastPlace := teams.PushBack(Team{"Raiders", 2, 8})
  teams.InsertBefore(Team{"Broncos", 4, 6}, lastPlace)
  teams.InsertAfter(Team{"Chargers", 7, 3}, firstPlace)

  // Iterate through the list.
  for team := teams.Front(); team != nil; team = team.Next() {
    // Note the use of a type assertion to
    // turn the Element Value into a Team object.
    fmt.Println(team.Value.(Team).name)
  }
}
```

#### Regular Expressions

TODO: Add this!

#### Sorting

TODO: Add this!

For example:

```go
  sort.Slice(results, func(i, j int) bool {
    return results[i].ReleaseDate < results[j].ReleaseDate
  })
```

#### Unicode

TODO: Add this!
