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

Non-basic types include aggregate, reference, and interface types.
Aggregate types include arrays and structs.
Reference types include pointers, slices, maps, functions, and channels.

### Documentation Types

Despite Go not currently supporting generic types,
the following "type" names that are not real types
appear in the Go documentation.

- `Type` - represents a specific type for a given function invocation
- `Type1` - like `Type`, but for a different type
- `ComplexType` - represents a complex64 or complex128
- `FloatType` - represents a float32 or float64
- `IntegerType` - represents any int type

### Builtin Functions

#### Data Structure Functions

- `append(slice []Type, elems ...Type) []Type`\
  appends elements to the end of a slice and returns the updated slice
- `cap(v Type) int`\
  returns the capacity of of a string, array, slice, or map
- `copy(dst, src []Type) int`\
  copies elements from a source slice to a destination slice
  and returns the number of elements copied
- `delete(m map[Type]Type1, key Type)`\
  deletes a key/value pair from a map
- `len(v Type) int`\
  returns the length of a string, array, slice, or map
- `make(t Type, size ...IntegerType) Type`\
  allocates and initializes a slice, map, or channel;\
  If Type is Slice, pass the length, and optional capacity.\
  If Type is Map, optionally specify the number of key/value pairs for which to allocate space.
- `new(Type) *Type`\
  allocates memory for a given type and returns pointer to it

#### Output Functions

- `print(args ...Type)`\
  writes to stderr; useful for debugging
- `println(args ...Type)`\
  like `print`, but adds a newline
- See the `fmt` package to write to stdout.

#### Error Handling Functions

- `panic(v interface{})`\
  stops normal execution of the current goroutine;
  Control cascades upward through the call stack.
  The program is terminated and an error is reported.
  This can be controlled by the `recover` function
  A `panic` is similar to a `throw` in other languages.
- `recover`\
  call inside a deferred function to
  stop the panic sequence and restore normal execution;
  similar to `catch` in other languages
- `error`\
  type that represents an error condition;
  has value `nil` when there is no error

#### Channel Functions

- `close(c chan<-)`\
  closes a channel after the last sent value is received
- `make(Channel, [buffer-capacity])`\
  unbuffered if buffer-capacity is omitted

#### Complex Number Functions

- `complex(real, imag FloatType) ComplexType`\
  creates a complex value from two floating-point values
- `imag(c ComplexType) FloatType`\
  returns the imaginary part of a complex number
- `real(c ComplexType) FloatType`\
  returns the real part of a complex number

### Type Conversions

No type conversions are performed implicitly.
This includes using non-boolean values in a boolean context.

Builtin types can be used as conversion functions.
For example, `f := float32(i)` converts an `int` to a `float32`
and `i := int(f)` converts other numeric types to an `int`,
truncating the fractional part if any.

The `bool` type cannot be used as a function
to convert other basic types to a boolean.
For example, if `n` is a variable that holds an `int`,
`bool(n)` results in a compile-time error
and does not return true or false.
Instead an expression like `n != 0` must be used.

In numeric conversions, if the value is too large to fit
in the target type, the value can be changed.
For example, in `i := 1234; j := int8(i)` the value of `j`
will be -46 because 1234 is too large to fit in an `int8`.

An error will be triggered if the conversion cannot be performed.
For example, attempting to convert a string to an int is an error,
even if the string contains a valid number.

To convert the string representation of a number to a number,
use the `strconv` package. For example,

```go
s := "19"
n, err := strconv.ParseInt(s, 10, 32) // base 10, bitsize 32
```

When a value is held in an interface type,
including the "any" type `interface{}`,
a type assertion can be used to convert it to a non-interface type.
For example, `var f = value.(float32)` converts
a value with an interface type to a `float32`.
This only works if the value actually has a type of `float32`.

### Standard Library Packages

Go provides many packages in the "standard library".
To see a list of them, browse <https://golang.org/pkg/>.
Clicking on a library function displays its source code
which is useful for learning how they work
and seeing examples of good Go code.

Highlights of the standard library include:

- bufio\
  This implements buffered I/O with `Reader` and `Writer` types.
  The `Scanner` type splits input into lines and words.
- builtin\
  This not a real package, just a place to document
  builtin constants, variables, types, and functions.
- container.list\
  This implements doubly linked lists.
- database/sql\
  This defines interfaces implemented by relational database-specific drivers.
  For example, there are drivers for MySQL and PostgreSQL.
- encoding\
  This defines interfaces for reading and writing
  various data formats such as csv, json, and xml.
- errors\
  This defines the `New` function for creating `error` structs with a string
  description and a method to get those strings from an `error` struct.
- flag\
  This implements command-line flag parsing.
- fmt\
  This implements formatted I/O similar to C's `printf` and `scanf`.
- go\
  The sub-packages implement all the standard go tooling
  such as source file parsing to ASTs and code formatting.
- html\
  This implements functions to parse and create HTML.
- image\
  This implements functions to parse (decode) and create (encode) images
  in the GIF, JPEG, and PNG formats.
- io\
  This implements functions to read and write buffers and files.
  The function `io.Copy` copies from a writer to a reader.
- log\
  This implements simple logging.
- math\
  This implements many math functions.
- mime\
  This encodes and decodes multimedia formats.
- net\
  This implements network I/O including TCP and UDP.
- net/http\
  This implements functions to send and listen for HTTP and HTTPS requests.
- os\
  This provides access to operating system functionality
  like that provided by UNIX shell commands.
  It defines the `File` type which supports
  opening, reading, writing, and closing files.
  It exposes the constants `PathSeparator` ('/' on UNIX)
  and `PathListSeparator` (':' on UNIX).
  It provides the function `os.Exit(status)`
  that exits the process with a given status.
- os/exec\
  This runs external (operating system) commands.
- path\
  This implements functions for working with UNIX-style file paths and URLs.
- reflect\
  This implements reflection to work with types determined at run-time.
- sort\
  This implements functions for sorting slices and other collections.
- strconv\
  This implements conversions to and from
  string representations of primitive types.
  For example, `strconv.Atoi` converts a `string` to an `int`
  and `strconv.Itoa` converts an `int` to a `string`.
- strings\
  This implements many functions on strings including
  `Contains`, `HasPrefix`, `HasSuffix`, `Index`, `Join`,
  `Repeat`, `Split`, `ToLower`, `ToTitle`, `ToUpper`, and `Trim`
  It also defines the `Builder`, `Reader`, and `Replacer` types.
- sync\
  This provides synchronization primitives such as mutual exclusion locks.
  Often code will use channels and `select` instead.
- testing\
  This supports automated tests run by `go test`.
  The `quick` sub-package implements fuzz testing.
- text\
  This provides functions for parsing text,
  writing tabbed columns, and data-driven templates.
- time\
  This provides functions to measure and display time and dates.
- unicode\
  This provides functions for working with and testing Unicode characters.

In addition to the standard library, also see "sub-repositories" that are
part of the Go project, but maintained outside the main repository.

### `fmt` Standard Library

The `fmt` standard library defines many functions
for reading and writing formatted messages.

Functions that read have names that start with `Scan`.
Functions that write have names that start with `Print`.

The most commonly used functions in this package include:

- `fmt.Errorf(format string, args ...interface{}) error`\
   This creates an error object containing a formatted message.

- `fmt.Printf(format string, args ...interface{})`\
  This writes a formatted string to stdout.

- `fmt.Println(args ...interface{})`\
  This writes the string representation of each of the arguments
  to stdout, separated by spaces and followed by a newline.

Format strings can contain placeholders that begin with a percent sign.
These are referred to as "verbs". Commonly used verbs include:

- `%d` for decimal values
- `%f` for floating point values,
- `%t` for boolean values
- `%s` for strings,
- `%v` for any value
- `%T` to output the type of a value
- `%*s` to output a string with a number of leading spaces
  (This consumes two values, the number of leading spaces and the string to follow.)

It is common for format strings to end with `\n`
to output a newline character.

For example, to output a number indented by
the number spaces specified in the variable `indent`,

```go
indent := 4
number := 19
fmt.Printf("%*s%d\n", indent, "", number)
```

### Logging

The standard library `log` package provides methods that
help with writing error messages to stderr.

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
predefined constants that identify potential prefixes.

The constants are:

- `Ldate` - yyyy/mm/dd in local time zone
- `Ltime` - hh:mm:ss in local time zone
- `Lmicroseconds` - hh:mm:ss.microseconds
- `Llongfile` - full-file-path:line-number
- `Lshortfile` - file-name.file-extension:line-number
- `LUTC` - use UTC instead of local time zone for dates and times
- `LstdFlags` - same as `Ldate | Ltime`; default flag value

`log.Panic(message)` outputs a line
containing the date, time, and message,
followed by a line containing "panic:" and the message again,
followed by a stack trace,
and exits with a status code of 2.

To write messages that include a file name and line number,
write a function like the following and call it from other functions.

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

- TODO: ADD MORE!:
