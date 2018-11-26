## Standard Library

### Builtins

The builtin constants, variables, and functions provided by Go
are listed as being in the standard library package "builtin"
for documentation purposes, but no such package actually exists.

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

#### Command-line Flags

The standard library package `flags` supports
documenting and parsing command-line flags for an application.
Each flag is described by a type, name,
default value, and documentation string.
The type can be any builtin primitive type
or a user-defined type (using `flag.Var`).

For example, here is a simple application
in a file named `flag-demo.go` that outputs a
range of integer values with a given string prefix.

```go
package main

import (
  "flag"
  "fmt"
)

// These pointers will be set after flag.Parse is called.
// There are flag functions for all the primitive data types.
var minPtr = flag.Int("min", 1, "minimum value")
var maxPtr = flag.Int("max", 10, "maximum value")
var prefixPtr = flag.String("prefix", "", "prefix")

func main() {
  flag.Parse(
  // TODO: If dereferencing prefixPtr was done in each
  // TODO: loop iteration, would Go optimize it out?
  prefix := *prefixPtr
  for i := *minPtr; i <= *maxPtr; i++ {
    fmt.Printf("%s%d\n", prefix, i)
  }
}
```

To build this, enter `go build`.

To get help on the flags,
enter `./flag-demo --help` which outputs:

```text
Usage of ./flags:
  -max int
        maximum value (default 10)
  -min int
        minimum value (default 1)
  -prefix string
        prefix
```

Flag names are preceded by a single dash,
followed by `=` or a space, and a value.

To run this, enter one of the following lines:

```text
./flag-demo -min 3 -max 5 -prefix foo
./flag-demo -min=3 -max=5 -prefix=foo
```

both of which output

```text
foo3
foo4
foo5
```

TODO: Discuss any type checking that is performed on the values.

#### Formatting

The standard library package `fmt` defines many functions
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

#### Linked Lists

The standard library package `container/list` defines the types
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
  Name   string
  Wins   int
  Losses int
}

func main() {
  // Create an empty, doubly-linked list.
  teams := list.New()

  // Add elements to the list.
  // Team records are from 11/24/2018.
  firstPlace := teams.PushFront(Team{"Chiefs", 9, 2})
  lastPlace := teams.PushBack(Team{"Raiders", 2, 8})
  teams.InsertBefore(Team{"Broncos", 4, 6}, lastPlace)
  teams.InsertAfter(Team{"Chargers", 7, 3}, firstPlace)

  for team := teams.Front(); team != nil; team = team.Next() {
    fmt.Println(team.Value.(Team).Name) // Chiefs, Chargers, Broncos, Raiders
  }
}
```

#### Logging

The standard library package `log` provides functions
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

#### Regular Expressions

The standard library package `regexp` defines functions
and the type `Regexp` for working with regular expressions.

The regular expression syntax supported by this package
is mostly the same as that supported by Perl.
For details on the syntax, see
<https://golang.org/s/re2syntax>.

The easiest way to determine if text matches a regular expression
is to use the functions `MatchString` and `Match`.
Both return a `bool` indicating whether there is a match.
These differ in how they obtain the text to be tested.
For example:

```go
package main

import (
  "fmt"
  "io/ioutil"
  "log"
  "regexp"
)

func main() {
  text := "FooBarBaz"
  matched, err := regexp.MatchString("Bar", text)
  fmt.Println(matched, err) // true nil
  matched, err = regexp.MatchString("^Foo", text)
  fmt.Println(matched, err) // true nil
  matched, err = regexp.MatchString("Baz$", text)
  fmt.Println(matched, err) // true nil
  matched, err = regexp.MatchString("bad[", text)
  fmt.Println(matched, err) // false error parsing regexp: missing closing ]

  // The file haiku.txt contains:
  // Out of memory.
  // We wish to hold the whole sky,
  // but we never will.
  bytes, err := ioutil.ReadFile("haiku.txt")
  if err != nil {
    log.Fatal(err)
  }
  matched, err = regexp.Match("whole sky", bytes)
  fmt.Println(matched, err) // true nil
}
```

For regular expressions that will be used multiple times,
it is more efficient to create a Regexp object
so the regular expression is parsed only once.
The functions `Compile` and `CompilePOSIX`
take a string and return a pointer to a `Regexp` and an error.
A non-nil error is returned if the string
cannot be parsed as a regular expression.
The functions `MustCompile` and `MustCompilePOSIX`
are similar, but panic instead of returning an error.

The `POSIX` variants restricts the regular expression syntax
and use "leftmost-longest" matching. For details, see
<https://golang.org/pkg/regexp/#CompilePOSIX>.

For example:

```go
  // Panics if the regular expression cannot be parsed.
  // Note how backslashes for character classes
  // must be escaped with a second backslash.
  bingoRE := regexp.MustCompile("^[BINGO]\\d{1,2}$")

  // Determine whether a strings matches this regular expression.
  callout := "G57"
  matched = bingoRE.MatchString(callout)
  fmt.Println(matched, err) // true nil
```

To capture matches of specific portions of a regular expression,
surround them with parentheses to define "capture groups".
The method `FindStringSubmatch` returns a slice containing
the full match and the match for each of the capture groups.
For example, the following regular expression
defines capture groups to capture the letter and number
of a Bingo call.

```go
  bingoRE := regexp.MustCompile("^([BINGO])(\\d{1,2})$")
  matches := bingoRE.FindStringSubmatch("G57")
  fmt.Printf("matches = %v\n", matches) // [G57 G 57]
```

To split a string on a regular expression delimiter,
using the `Regexp` `Split method`. For example:

```go
  text := "ab1c23def456g"
  digitsRE := regexp.MustCompile("\\d+") // matches one or more digits
  parts := digitsRE.Split(text, -1) // -1 to return all parts
  fmt.Printf("parts = %v\n", parts) // [ab c def g]
```

We have just scratched the surface of the `regexp` package.
There are many more methods on the `Regexp` type.

#### Sorting

The standard library package `sort` defines functions and types
that help with sorting slices and custom collections.

To sort slices of primitive values, use the functions
`Ints`, `Float64s`, and `Strings`. For example:

```go
numbers := []int{7, 3, 9, 1}
sort.Ints(numbers)
fmt.Printf("%v\n", numbers) // [1 3 7 9]
```

To determine if a slice of primitive values is already sorted,
use the functions `IntsAreSorted`, `Float64sAreSorted`, and `StringsAreSorted`.

To sort a slice of non-primitive values,
pass the slice and a function for comparing elements
to the `Slice` function. For example:

```go
package main

type Person struct {
  Name string
  Occupation string
}

func main() {
  people := []Person{}
  people = append(people, Person{"Mark", "software engineer"})
  people = append(people, Person{"Tami", "vet receptionist"})
  people = append(people, Person{"Amanda", "nurse"})
  people = append(people, Person{"Jeremy", "IT manager"})

  // This function determines whether
  // the slice element at index1 should come before
  // the slice element at index2 in the sort order.
  less := func(index1, index2 int) bool {
    return people[index1].Name < people[index2].Name
  }
  sort.Slice(people, less)
  for _, person := range people {
    fmt.Printf("%v\n", person) // Amanda, Jeremy, Mark, Tami
  }
}
```

To sort a custom collection, rather than a slice,
implement the methods in the `sort.Interface` interface
for the custom collection type.
These methods include `Len`, `Less`, and `Swap`.
The `Len` method returns the number of elements in the collection.
The `Less` method takes two indexes and returns a `bool`
that indicates whether the element at the first index
comes before the element at the second index in sort order.
The `Swap` method takes two indexes and modifies the collection
so the elements at those indexes are swapped.
Finally, call the `sort.Sort` function to sort the collection.

The `sort.Sort` function performs an unstable sort.
This means that two elements with the same "sort key"
may be in a different order after the sort.
For a stable sort, use `sort.Stable` instead.

For example, this approach can be used to sort a linked list.
The following code sorts the list of `Team` elements
created in the "Doubly Linked List" section above.

```go
package main

import (
  "container/list"
  "fmt"
  "sort"
)

// ListAt returns a pointer to the List Element at a given index.
// This is not an efficient operation for a linked list.
func ListAt(l *list.List, index int) *list.Element {
  len := l.Len()
  if index >= len {
    return nil
  }

  element := l.Front()
  for i := 1; i < index; i++ {
    element = element.Next()
  }
  return element
}

// ListPrint prints the elements of a linked list.
func ListPrint(l *list.List) {
  for element := l.Front(); element != nil; element = element.Next() {
    fmt.Println(element.Value)
  }
}

// Team describes a sports team.
type Team struct {
  Name   string
  Wins   int
  Losses int
}

// ByName is used to sort a linked list of Team object by team name.
type ByName struct {
  teams *list.List
}

// Len returns the length of the linked list of Teams.
func (b ByName) Len() int {
  return b.teams.Len()
}

// Less determines if the Team at one index belongs
// before the Team at another index in the sort order.
func (b ByName) Less(i, j int) bool {
  teams := b.teams
  team1 := ListAt(teams, i).Value.(Team)
  team2 := ListAt(teams, j).Value.(Team)
  return team1.Name < team2.Name
}

// Swap swaps the Teams at the given indexes.
func (b ByName) Swap(i, j int) {
  if i > j {
    i, j = j, i // swap indexes so i < j
  }

  teams := b.teams
  el1 := ListAt(teams, i)
  el2 := ListAt(teams, j)
  el2Next := el2.Next()

  teams.MoveAfter(el2, el1)

  if el2Next == nil {
    teams.MoveToBack(el1)
  } else {
    teams.MoveBefore(el1, el2Next)
  }
}

func main() {
  // Create an empty, doubly-linked list.
  teams := list.New()

  // Add Teams to the list.
  firstPlace := teams.PushFront(Team{"Chiefs", 9, 2})
  lastPlace := teams.PushBack(Team{"Raiders", 2, 8})
  teams.InsertBefore(Team{"Broncos", 4, 6}, lastPlace)
  teams.InsertAfter(Team{"Chargers", 7, 3}, firstPlace)

  sort.Sort(ByName{teams})
  ListPrint(teams) // Broncos, Chargers, Chiefs, Raiders
}
```

In addition to sorting, the `sort` package
provides functions for searching slices.
`SearchInts`, `SearchFloat64s`, and `SearchStrings`
search an already sorted slice of their type for
an element with a given value and return its index.

#### Unicode

The standard library package `unicode` defines
many constants, variables, functions, and types
for testing and converting `rune` values.

Many of the constants define ranges of Unicode characters
used in specific written languages.

Many of the functions take a `rune` and return a `bool`
indicating whether the `rune` is a member of
a particular category of Unicode characters.
These include `IsDigit`, `IsLetter`, `IsLower`, `IsUpper`,
and `IsSpace`.

`IsSpace` determines whether a `rune` represents a whitespace character.
These include the characters space, tab, newline, carriage return,
and the less commonly used characters
formfeed, non-breaking space (NBSP), vertical tab, and next line (NEL).

The functions `ToLower` and `ToUpper`
take a `rune` and return another `rune`.

- TODO: Should you add sections on any other standard library packages?
- TODO: Some are already described in the "Common Tasks" section.
