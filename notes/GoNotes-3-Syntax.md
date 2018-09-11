## Syntax Highlights

This section presents some ways that Go syntax differs
from the syntax of other programming languages.

A Go source file contains a package clause,
followed by zero or more import declarations,
followed by zero or more package-level declarations.

A package-level declaration is a declaration of a package
constant, variable, type, function, or method.
All of these begin with a keyword which is one of
`const`, `var`, `type`, or `func`.
These declarations can appear in any order.
Only these can appear outside of functions.
This precludes use of the `:=` operator and
non-declaration statements, like `if` and `for`,
outside of functions.

Package-level names that start uppercase are "exported".
This means that other packages that import their package
can access them.

Types follow variables and parameters, separated by a space.
For example, `var score int8`.

Semicolons are not required, but can be used
to place multiple statements on the same line.

In some languages `string[]` is an array of strings.
In a GraphQL schema, this would be written as `[string]`.
But Go chooses a third option, `[]string`
which was inspired by Algol 68.

## Package Initialization

Initialization of package-level variables that require logic,
not just literal values or results of function calls,
must be done in `init` functions.
A package can have any number of `init` functions
in any of its source files.
These functions are run in the order they appear,
and alphabetically by source file name within a package.

The `init` functions of all imported packages
are run before those of a given package.
All `init` functions of all imported packages are run
before the `main` function of an application is run.

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

Go constants are defined using the `const` keyword.
They must be initialized to a primitive literal or an expression
that can be computed at compile-time and results in a primitive value.
For example, `const HOT = 100`.

## Operators

Go supports the following operators:

- arithmetic: `+`, `-`, `\*`, `/`, `%` (mod)
- arithmetic assignment: `+=`, `-=`, `\*=`, `/=`, `%=`
- increment: `++`
- decrement: `--`
- assignment: `=` (existing variable), `:=` (new variable)
- comparison: `==`, `!=`, `<`, `<=`, `>`, `>=`
  - Arrays are compared by comparing their elements.
  - Structs are compared by comparing their fields.
  - Slices, maps, and functions cannot be compared using these operators.
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

Go supports the following keywords:

- `break` - breaks out of a `for` loop, `select`, or `switch`
- `case` - used in a `select` or `switch`
- `chan` - channel type
- `const` - declares a constant
- `continue` - advances to the next iteration of a for loop
- `default` - the default case in a `select` or `switch`
- `defer` - defers execution of a given function until the containing function exits
- `else` - part of an `if`
- `fallthrough` - used as last statement in a `case` to execute code in next `case`
- `for` - only loop syntax; C-style (init, condition, and post) or just condition
- `func` - defines a named or anonymous function
- `go` - precedes a function call to execute it asynchronously as a goroutine
- `goto` - jumps to a given label (see `:` operator)
- `if` - for conditional logic; also see `else`
- `import` - imports all the exports in given package(s)
  - See the "Packages" section for more detail.
- `interface` - defines a set of methods
  - This defines a type where all implementing structs are compatible.
  - Structs do not state the interfaces they implement,
    they just implement all the methods.
- `map` - type for a collection of key/value pairs where the keys and values can be any type
- `package` - specifies the package to which the current source file belongs
- `range` - used in a `for` loop to iterate over a
  string, array, slice, map, or receiving channel
- `return` - terminates the containing function and returns zero or more values
- `select` - chooses from a set of channel send or receive operations; see "Select" section
- `struct` - a collection of fields that each have a specific type
- `switch` - similar to other languages; see "Switch" section
- `type` - creates an alias for other type
  - This is often used to give a name to a struct or function signature.
- `var` - defines a variable, its type, and optionally an initial value

## Pointers

Pointers hold the address of a variable or `nil`.
Pointer types begin with an asterisk.
`*Type` is the type for a pointer to a value of type `Type`.

To get a pointer to a variable, `myPtr = &myVar`.
It is not possible to get the address of a constant.

To create a value and get a pointer to it in one line,
`myPtr := new(type)`.
Another way to do this which is preferred by many is
`var myThing type; myPtr := &myThing`.
The assembly code generated for these two approaches is identical.

To get the value at a pointer, `myValue = \*myPtr`.

To modify the value at a pointer, `\*myPtr = newValue`.

Pointer arithmetic, as seen in C and C++, is not supported in Go.

Suppose `person` is a struct containing a `name` field
and we have a pointer to that struct in the variable `ptr`.
To get the value of the name field, `var name1 = (*ptr).name`.
This can also be done with shorthand syntax that automatically
dereferences the pointer with `var name2 = ptr.name`.

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

Almost any single statement can precede the condition,
separated from it by a semicolon.
However, typically an assignment statement is used.
The scope of the assigned variable is the if statement,
including the else block if present

```go
if y := x * 2; y < 10 {
  ...
}
```

## Switch Statement

Go's `switch` statement is similar to that in other languages,
but it can switch on expressions of any type.
Braces around body are required.
Case values can be literal values or expressions.
The `case` keyword can be followed by any number of
comma separated expressions. Matching any of them
causes the statements for that case to be executed.
Case blocks do not fall through by default
so `break` statements are not needed.
If it is desirable to fall through from one case to the next,
the `fallthrough` keyword enables this.

A basic `switch` statement looks like:

```go
switch name {
  case "Mark":
    // handle Mark
  case "Tami":
    // handle Tami
  case "Amanda", "Jeremy":
    // handle Amanda or Jeremy
  default:
    // handle all other names
}
```

A switch statement can include an initialization statement
just like an if statement. For example,

```go
switch name := buildName(person); name {
  case "Mark":
    // handle Mark
  case "Tami":
    // handle Tami
  default:
    // handle all other names
}
```

A `switch` statement with no expression executes the
first `case` block whose expression evaluates to true.
For example,

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

To switch on the type of an expression,

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

The variable `value` will hold the actual type.
`value :=` can be omitted if the type is not needed.
`expression` can be an interface type and
the actual type can be type that implements the interface.

## For Statement

The `for` statement is the only looping statement in Go.
Braces around the body are required.
The `break` and `continue` keywords can be used inside the body.
`break` exits the inner-most loop.
`continue` skips the remainder of the body and
continues at the top of the loop, testing the condition again.

The syntax is `for init; cond; post { ... }`.
No parentheses are allowed around the the init, cond, and post portions.
These three parts are separated by semicolons.
The init and post parts, if present, must be single statements,
but multiple variables can be assigned in a single statement.
For example,

```go
for i := 0; i < 10; i++ {
  ...
}
```

The init and post parts are optional, so
a while loop in other languages looks like the following in Go:

```go
for ; i < 10; {
  ...
}
```

The semicolons can be omitted when only the condition is specified.

```go
for i < 10 {
  ...
}
```

For an endless loop, omit the condition.

```go
for {
  ...
}
```

## Strings

Go strings are immutable sequences of bytes representing UTF-8 characters.
Literal values are delimited with double quotes or back-ticks.
When back-ticks are used, the string can include newlines.

An example of declaring and initializing a string
inside a function is `name := "Mark"`.

To get the length of a string, use the `len` function.
For example, `len(name)` returns `4`.

To retrieve a character from a string, `char := name[index]`.

To iterate over the characters in string,

```go
for _, char := range name {
  // Use char here.
}
```

To create a new string by concatenating a string to another,
use the `+` and `+=` operators.
The `string` type has no methods.
The standard library package `strings` provides
many functions for operating on strings.
For example, to split a string on whitespace characters
and print each "word" on a separate line:

```go
s := "This is a test."
words := strings.Fields(s)
for _, word := range words {
  fmt.Println(word) // outputs "This", "is", "a", and "test."
}
```

## `type` Keyword

The `type` keyword defines a new type.
It does not define an alias for an existing type.

For example `type score int` defines the type `score`,
but it cannot be used interchangeably with the type `int`.

```go
type score int
var s score = 1
var i int = 2
sum : = s + i // invalid operation - mismatched types
```

The `type` keyword is most often used to define a type for struct, slice, map, or function.

## Structs

A struct is a collection of fields defined with the `struct` keyword.
Field values can have any type,
including other structs nested to any depth.
A struct cannot inherit from another struct,
but can utilize composition of structs.

Fields are either "public" (accessible in all packages)
or "protected" (accessible in a files within the current package),
never "private" (only accessible in methods of the struct).
But note that the terms "public", "protected", and "private"
are not used when describing Go.

It is often desirable to define a type alias for a struct to
make it easy to refer to in variable and parameter declarations.
Otherwise the struct is anonymous and
can only be referred to where it is defined.

The dot operator is used to get and set fields within a struct.

Here is an example of using an anonymous struct
that is not assigned to a type name:

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

Assigning a type name makes the code cleaner and easier to understand.
For example,

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
// %v can be used for most types.
fmt.Printf("%v\n", p2) // just field values: {Mark 58}
fmt.Printf("%+v\n", p2) // including field names: {name:Mark age:58}
fmt.Printf("%#v\n", p2) // Go-syntax representation main.person{name:"Mark", age:58}
```

Type names must start uppercase if they
should be accessible outside the current package.
Struct field names must also start uppercase
if they should be accessible outside the current package.

There is no support for destructuring like in JavaScript
to extract field values from a struct.

If a struct field name is omitted, it is assumed to be the same as the type.
For example,

```go
package main

import (
  "fmt"
  "time"
)

func main() {
  type age int
  type myType struct {
    name string // named field
    age // get field name from a primitive type
    time.Month // get field name from a library type
  }
  //myStruct := myType{name: "Mark", int: 7, Month: time.April}
  myStruct := myType{"Mark", 7, time.April}
  fmt.Printf("name = %v\n", myStruct.name)
  fmt.Printf("age = %v\n", myStruct.age)
  fmt.Printf("Month = %v\n", myStruct.Month)
}
```

To embed a struct within another,
precede the struct name with a field name or
include just its name to get a field with the same name.
For example,

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

## Sets

Empty structs are useful for representing values in set data structures
because they do not take up memory, unlike boolean values.
They are written as `struct{}`.

The following simple package defines a set data structure for strings.

```go
package set

type empty struct{} // memory-efficient value for sets

// Strings is a set of strings.
type Strings map[string]empty

var present = empty{}

// Add adds a given value to the set.
func (set Strings) Add(value string) {
  set[value] = present
}

// Contains determines if a given value is in the set.
func (set Strings) Contains(value string) bool {
  _, ok := set[value]
  return ok
}

// Remove removes a given value from the set.
func (set Strings) Remove(value string) {
  delete(set, value)
}
```

Here's an example of using this "set" package.

```go
package main

import (
  "fmt"

  "github.com/mvolkmann/set"
)

func main() {
  colorSet := set.Strings{}
  colorSet.Add("red")
  colorSet.Add("yellow")
  colorSet.Add("blue")
  colorSet.Remove("yellow")

  colors := []string{"red", "yellow", "blue"}
  for _, color := range colors {
    if colorSet.Contains(color) {
      fmt.Println("have", color) // prints "red" and "blue"
    }
  }

  fmt.Printf("%+v\n", colorSet) // map[red:{} yellow:{}]
  fmt.Println("length =", len(colorSet))
}
```

A recommended community library that supports many data structures
is "gods" at <https://github.com/emirpasic/gods>.
It supports several kinds of lists, sets, stacks, map, and trees
that hold values of any type.
These collections can hold values of any type,
but using the values typically requires type assertions.

Compare the `gods.HashSet` type to the `set.Strings` type defined above.
For example,

```go
package main

import (
  "fmt"

  "github.com/emirpasic/gods/sets/hashset"
)

func main() {
  set := hashset.New()   // empty
  set.Add(1)             // 1
  set.Add(2, 2, 3, 4, 5) // 3, 1, 2, 4, 5 (random order, duplicates ignored)
  set.Remove(4)          // 5, 3, 2, 1 (random order)
  set.Remove(2, 3)       // 1, 5 (random order)

  fmt.Println("contains 1?", set.Contains(1))          // true
  fmt.Println("contains 1 and 5?", set.Contains(1, 5)) // true
  fmt.Println("contains 1 and 6?", set.Contains(1, 6)) // false

  values := set.Values()
  fmt.Println("values =", values)    // []int{5,1} (random order)
  fmt.Println("empty?", set.Empty()) // false
  fmt.Println("size =", set.Size())  // 2

  // Must use type assertions to operate on values.
  sum := 0
  for _, v := range values {
    sum += v.(int)
  }
  fmt.Println("sum =", sum)

  set.Clear()                        // empty
  fmt.Println("empty?", set.Empty()) // true
  fmt.Println("size =", set.Size())  // 0
}
```

## Methods

Methods are functions that are invoked on a "receiver" value.
They can be associated with any type.
The receiver is an instance of this type.

Methods are particularly useful for types that implement interfaces.
Otherwise we can just write functions that take a value of the type as an argument.

It is not possible to create overloaded methods on a type
to create different implementations for different parameter types.
Methods are distinguished only by the receiver type and their name.

The syntax for defining a method is
`func (receiver-info) name(parameter-list) (return-types) { body }`.
`receiver-info` is a name followed by a type.
Note that there are three sets of parentheses.
If the method has only one return value,
the last pair of parentheses can be omitted.

When there are methods that modify the receiver,
the receiver type should be pointer.

In most programming languages that support methods,
the method body refers to the receiver
using a keyword like `this` or `self`.
In Go the method signature specifies the name
by which the receiver will be referenced.
In the example that follows, the name is `p`.

To call a method, specify the receiver followed by a dot,
the method name, and the argument list.
For example,

```go
// Add a method to the type "pointer to a person struct".
// Note how the receiver and its type appear
// in parentheses before the method name.
func (p *person) birthday() {
  p.age++
}

p := person{name: "Mark", age: 57}
(&p).birthday() // The method can be invoked on a pointer to a person.
p.birthday() // It can also be invoked on a person.
fmt.Printf("%#v\n", p) // main.person{name:"Mark", age:59}
```

In the previous example the receiver is a pointer to a struct.
This allows the method to modify the struct
and avoids making a copy of the struct when it is invoked.
When the receiver is a type value and not a pointer to a type value
the method receives a copy and cannot modify the original.

When a function has a parameter with a pointer type,
it must be passed a pointer
However, when a method has a pointer receiver,
it can be invoked on a pointer to a struct or a struct.
When invoked on a struct, it will automatically
pass a pointer to the struct to the method.

When a type has multiple methods, `golint`
wants all the receivers to have the same name.
However, `golint` does not complain if
some receivers are a pointer and others are values.

Methods can be added to primitive types if a type alias is created.
If an attempt is made to add a method to a built-in type
an error with the message "cannot define new methods on non-local type"
will be triggered.

Here is an example of adding a method to a type alias for the `int` type.

```go
type number int

func (receiver number) double() number {
  return receiver * 2
}

n := number(3) // or could use var n number = 3
fmt.Println(n.double()) // 6
```

It may seem that struct methods should be defined inside the struct.
However, the ability to define methods outside the type definition
is required in order to add methods to non-struct types.
So Go chooses to only support that same approach for all types.

## Arrays

Arrays hold a sequence of values, a.k.a. elements.
The values can be of any type,
including other arrays to create multidimensional arrays.
They have a fixed length and the length is part of their type.
Their indexes are zero-based.

The syntax for declaring an array is `[length]type`.
For example, `var rgb [3]int`.

Placing the square brackets before the type was inspired by Algol 68.

An array can be created with an "array literal".
This uses curly braces to specify initial elements.
For example, `rgb := [5]int{100, 50, 234}`.
This creates an array with a length of five
where only the first three elements are explicitly initialized.
The remaining elements are initialized to their zero value.

To create an array whose length is the same as the number of
supplied initial values, place an ellipsis inside the square brackets.
For example, `rgb := [...]int{100, 50, 234}`.
This creates an array with a length of three.

If anything other than a single integer or ellipsis is inside the
square brackets, a "slice" is created (discussed in the next section).

Square brackets are also used to get and set the value at an index.
To get the second element, `rgb[1]`.
To set the second element, `rgb[1] = 75`.

To get the length of an array, `len(myArr)`.
For arrays, the capacity is the same as the length,
so `cap(myArr)` returns the same value.

One way to iterate over the elements of an array
is to use a C-style `for` loop.
For example,

```go
for i := 0; i < len(myArr); i++ {
  value := myArr[i]
  // Do something with value.
}
```

The `range` keyword can be also used to iterate over the elements,
and this is typically preferred. For example,

```go
for index, value := range myArr {
  // Do something with value, and possibly index.
}
```

## Slices

Slices are a distinct type from arrays.
They are a view into an array with a variable length.
Like with arrays, indexes are zero-based.

Functions that take an argument that is a slice cannot be passed an array.
Many functions prefer slices over arrays.
Unless having a fixed length is appropriate, use a slice instead of an array.

A slice type is declared with nothing inside square brackets.
For example, `[]int` is a slice of int values
that is not yet associated with an array.

There are three ways to create a slice, using a "slice literal",
the `make` function, or basing on an existing array.

The most common way to create a slice is with a "slice literal"
which creates a slice and its underlying array.
These look like an array literals, but without a specified length.
`mySlice := []int{}` creates a slice with an empty underlying array
where the length and capacity are 0.
`mySlice := []int{2, 4, 6}` creates a slice where the
length and capacity are 3 with the provided initial values.

It is also possible, but not common, to specify values at specific indices.
`mySlice := []int{2: 6, 1: 4, 0: 2}` is the same as the previous example
`mySlice := []int{3: 7, 0: 2}` creates a slice where length and capacity
are 4 which is one more than the highest specified index.

The `make` function provides another way to create a slice and underlying array.
Rather than specifying initial values, the length and capacity are specified.
This can avoid reallocating space when elements are added later,
which is somewhat inefficient.
If it is anticipated that many elements will be appended later,
try to estimate the largest size needed at the start
and use `make` to create the slice.
For example, `mySlice := make([]int, 5)`
creates an underlying array of size 5
and a slice of length 5 and capacity of 5.
`mySlice := make([]int, 0, 5)`
creates an underlying array of size 5 and
a slice with initial length 0 and initial capacity of 5.

The final way to create a slice is to base it on an existing array,
specifying the start (inclusive) and end (exclusive) indexes.
For example, `mySlice := myArr[start:end]`
If `start` is omitted, it defaults to 0.
If `end` is omitted, it defaults to the array length.
So `myArr[:]` creates a slice over the entire array.

The most common ways to create a slice are to use
a slice literal or the `make` function.
Manually creating an array and then creating a slice over it
is far less common.

Modifying elements of a slice modifies the underlying array.
Multiple slices on the same array see the same data.

The builtin `append` function takes a slice
and returns a new slice containing additional elements.
For example, `mySlice = append(mySlice, 8, 10)`
appends the values 8 and 10.
If the underlying array is too small to accommodate the new elements,
a larger array is automatically allocated
(doubling the current capacity after the length exceeds 4)
and the returned slice will refer to it.
It is not possible to append elements to arrays
which is one reason why slices are used more often.

`len(mySlice)` returns the number of elements in the slice
which is its length.
`cap(mySlice)` returns the number of elements in the underlying array
which is its capacity.
If `append` is used to increase the number of elements beyond this,
a larger underlying array will be allocated
and the returned slice will refer to it.

Just like with arrays, square brackets used to
get and set the value of a slice at an index.
If the index is greater than or equal to the slice capacity,
a panic will be triggered that says "runtime error: index out of range".
To get the second element, `rgb[1]`.
To set the second element, `rgb[1] = 75`.

The same approaches for iterating over the elements of an array
can be used to iterate over the elements of a slice.

To change the view of a slice into its underlying array,
recreate it with different bounds
For example, `mySlice = mySlice[newStart:newEnd]`.

Slice elements can be other slices to create multidimensional slices.

TODO: Is the zero value of a slice really nil?

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

To use all the elements in a slice as separate arguments to a function
follow the variable name holding the slice with an ellipsis.
For example, TODO: IS THIS CORRECT?

```go
func processColors(...colors string) {
  // colors is a slice
}
processColors("white", "black")
colors := []string{"red", "green", "blue"}
processColors(colors...)
```

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

A map is a collection of key/value pairs where keys and values can be any type.
A map type looks like `map[keyType]valueType`.
For example, `var myMap map[string]int`.
A type alias can be created for this type which is
useful when the type will be referred to in many places.
For example, `type playerScoreMap map[string]int`.

One way to create a map is with a "map literal"
which allows specifying initial key/value pairs.
For example,
`scores := map[string]int{"Mark": 90, "Tami": 92}`.
or using the type alias,
`scoreMap := playerScoreMap{"Mark": 90, "Tami": 92}`.

Another way to create a map is using the `make` function.
For example, `scoreMap := make(map[string]int)`
or `scoreMap := make(playerScoreMap)`.

To add a key/value pair, `myMap[key] = value`.

To get the value for a given key, `value := myMap[key]`.

For example,

```go
type playerScoreMap map[string]int

scoreMap := playerScoreMap{"Mark": 90, "Tami": 92}
scoreMap["Amanda"] = 83
scoreMap["Jeremy"] = 95

myScore := scoreMap["Mark"]
fmt.Println("my score =", myScore) // 90
fmt.Printf("scoreMap = %+v\n", scoreMap) // map[Tami:92 Amanda:83 Jeremy:95 Mark:90]
```

To get the value for a given key and verify that the key was present,
as opposed to just getting the zero value because it wasn't,

```go
value, found := myMap[key]
if found { ... }
```

To delete a key/value pair, `delete(myMap, key)`.

To iterate over the key/value pairs in a map,
`for key, value := range myMap { ... }`.

Maps support concurrent reads, but not concurrent writes
or a concurrent read and write.
Issues with these can avoided using channels or mutexes.

## Functions

Go functions are defined with `func` keyword.
The syntax is:

```go
func myFunctionName(p1 t1, p2 t2, ...) returnType(s) {
  ...
}
```

Functions act as closures over all in-scope variables.

Function arguments are passed by value
so copies are made of arrays, slices, and structs.
To avoid creating copies of these, pass and accept pointers.

It is not possible to specify default values for function parameters
and they cannot be optional.

Functions cannot be overload based on their parameter types
in order to create different implementations.

A function can be assigned to variable
and be called using that variable.
For example, `fn := someFunction; fn()`.

Functions can be passed as arguments to other functions
and a function can return a function.

Anonymous functions have the same syntax, but omit the name.
For example, `func(v int) int { return v * 2 }`.

When consecutive parameters have the same type,
the type can be omitted from all but the last parameter.
For example, `func foo(p1 int, p2 int, p3 string, p4 string)`
is is equivalent to `func foo(p1, p2 int, p3, p4 string)`.

Functions can accept a variable number of arguments.
These are referred to as variadic functions.
To do this, the type of the last named parameter
must be preceded by an ellipsis.
The parameter value will be a slice of the declared type, not an array.
For example,

```go
package main

import (
  "fmt"
  "strings"
)

func log(args ...interface{}) {
  fmt.Println(args...)
}

func report(name string, colors ...string) {
  text := strings.Join(colors, " and ") + "."
  fmt.Println(name, "likes the colors", text)
}

func main() {
  log("red", 7, true)
  report("Mark", "yellow", "orange")
}
```

To pass all the elements in a slice as separate arguments,
follow the argument with an ellipsis.
For example:

```go
package main

import (
  "fmt"
  "strings"
)

func log(args ...interface{}) {
  fmt.Println(args...)
}

func report(name string, colors ...string) {
  text := strings.Join(colors, " and ") + "."
  fmt.Println(name, "likes the colors", text)
}

func main() {
  log("red", 7, true)
  report("Mark", "yellow", "orange")
}
```

Functions can return zero or more values.
When there is more than one return value, the types
must be surrounded by parentheses and separated by commas
For example,

```go
// This returns an int and a float32.
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
  // Do something with sum and avg.
}
```

The return types can have associated names.
This enables a "naked return" where a
return will no specified values will return
the values of variables with the given names.
For example,

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

Unless the function is very short,
using this feature is frowned upon
because the code is less readable
than explicitly returning values.

## Deferred Functions

Inside a function, function calls preceded by `defer`
will have their arguments evaluated immediately,
but the function will not execute until the containing function exits.

All deferred calls are placed on a stack and
executed in the reverse order from which they are evaluated.

Deferred functions are typically used for resource cleanup
that must occur regardless of the code path taken in the function.
Examples include closing files or network connections.

This is an alternative to the `try`/`finally` syntax found in other languages.

## Interfaces

An interface defines a set of methods.
Any type can implement an interface, even primitive types.
Types do not state the interfaces they implement,
they just implement all the methods.

When a value is assigned to a variable or parameter with an interface type,
if its type does not implement all the interface methods then an error
is reported that identifies one of the missing methods.

Calling a method on a variable with an interface type
calls the method on the underlying type.
If a value has not be assigned to the variable,
calling a method on it results in an error.

An interface with no methods, referred to as the "empty interface",
matches every type.
This can be given a name using `type any interface{}`.

The following code defines an interface and two types that implement it:

```go
package main
import "fmt"
import "math"

type geometry interface {
  area() float64
  name() string
}

type rectangle struct {
  width, height float64
}
func (r rectangle) area() float64 {
  return r.width * r.height
}
func (r rectangle) name() string {
  return "rectangle"
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
  r := rectangle{width: 3, height: 4}
  c := circle{radius: 5}
  var g geometry
  //printArea(g) // panic: runtime error: invalid memory address or nil pointer dereference
  g = r
  printArea(g)
  g = c
  printArea(g)
}
```

Aa "type assertion" verifies that the value of
an interface variable refers to a specific type.
For example, `myShape := g.(rectangle)`.
This triggers a runtime panic if the variable `g`
does not currently refer to a `rectangle` object.
Keep in mind that When running a program using `go run`,
if there are compile errors, the panic will not be
triggered since the code won't begin running.

A "type test" determines whether an interface variable
refers to a specific type.
For example, `myShape, ok := g.(circle)`.
The variable `ok` will be set to `true` or `false`
to indicate whether `g` refers to a `circle` object.
If it does not, a panic will not be triggered.

Here is an example of a custom collection that
can hold values of any type.  It's a basic linked list.
Note how type assertions are required to
use values that are obtained from the collection.

```go
package main

import "fmt"

// LinkedList implements a linked list with values of any type.
type LinkedList struct {
  head *node
}

type any interface{}

type node struct {
  value any
  next  *node
}

// clear removes all nodes.
func (listPtr *LinkedList) clear() {
  listPtr.head = nil
}

func (listPtr *LinkedList) isEmpty() bool {
  return listPtr.head == nil
}

// pop removes the first node and returns its value.
func (listPtr *LinkedList) pop() any {
  if listPtr.isEmpty() {
    return nil
  }
  node := listPtr.head
  value := node.value
  listPtr.head = node.next
  return value
}

// push adds a node to the front.
func (listPtr *LinkedList) push(value any) {
  node := node{value, listPtr.head}
  listPtr.head = &node
}

// Why can't the receiver name differ from the other methods
// and be a LinkedList instead of a pointer to one?
func (listPtr *LinkedList) len() int {
  len := 0
  node := listPtr.head
  for node != nil {
    len++
    node = node.next
  }
  return len
}

func main() {
  list := LinkedList{}
  list.push(1)
  list.push(3)
  list.clear()
  list.push(5)
  list.push(7)

  sum := 0
  for !list.isEmpty() {
    value := list.pop()
    sum += value.(int)
    fmt.Println("value =", value) // 5 and 7
  }
  fmt.Println("sum =", sum) // 12
}
```

The standard library packages define many interfaces.
For example, the `fmt` package defines the `Stringer` interface.
It contains one method named `String`.
Many other packages check whether values implement this interface
in order to convert values to strings.

Any type can choose to implement this interface
by defining the `String` method.
For example:

```go
type person struct {
  name string
  age int8
}

// Note that the receiver is a person struct, not a pointer to one.
// This is typical for methods that do not modify the receiver.
func (p person) String() string {
  return fmt.Sprintf("%v is %v years old.", p.name, p.age)
}

me := person{"Mark", 57}
fmt.Println(me)
```

Interfaces can be nested to add the methods of one interface to another.
For example:

```go
package main

type shape2d interface {
  area() float32
}

type shape3d interface {
  shape2d // shape3d objects also support shape2d methods
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

## Packages

All Go code resides in some package.

All source files must start with a `package` statement
that includes a package name.
The package name must match the name of the directory that holds the file,
unless the package name is "main".

The `main` function is the starting point of all Go applications
and must defined in a source that starts with `package main`.
This is the only package that does not need to match the name of its directory.

The source files that define the package
can have any file name that ends in `.go`.

For example, if the file `foo.go` is in a directory named `bar`,
the first non-comment line in the file should be `package bar`.

Changing a package name requires renaming the directory
and modifying the `package` statement in all the files.
It seems Go missed an opportunity to
infer the package name from the directory name.

Packages used within an application or other package are not required
to have unique names, but their import paths must be unique.
For example, the import paths `alpha/one` and `beta/one` can coexist
even though the package name for both is `one`.
However, to use both in the same source file,
one of them will need to be given an alias (described later).

Packages contributed by the community (not in the standard library)
must be installed, typically using `go get package-url`.
The `go get` command installs packages under `$GOPATH/src`
regardless of the directory from which it is run.
For example, `go get github.com/julienschmidt/httprouter`
installs the package in `$GOPATH/src/github.com/julienschmidt/httprouter`.
Using the package URL avoids path conflicts.

To import the package, include an `import` statement with a
string that is the package URL without the <https://> prefix.
For example, `import "github.com/julienschmidt/httprouter"`.

Refer to the names it exports by preceding them with `httprouter.`.
For example, `httprouter.ResponseWriter`.
There is not a way to add the exported names to the current namespace
to avoid using the `pkgName.` prefix.

An `import` imports all the exported symbols in a given package.
It is not possible to import just a subset of the exported symbols.

It is recommended that your own packages reside in directories that
reflect their eventual URL should they be publish in the future.
For example, if I created a package named `mypkg`
it should be in the directory `src/github.com/mvolkmann/mypkg`.
Other packages could import this with
`import "github.com/mvolkmann/mypkg"`
and refer to the names it exports with a prefix of `mypkg.`

The `import` keyword imports all exported symbols
(names that start uppercase) from given packages.
To import one package, `import "pkgName"`.
To import multiple packages, `import ("pkgName1" "pkgName2" ...)`.

Unused imports are treated as errors
and some editors automatically remove them.

The strings specified after `import` are slash-separate names.
For standard library packages these can be a single name
like `"strings"` or a name like `"math/rand"`.
For community packages these are URLs without the `https://` prefix.

An alias for a package name can be defined with `import alias "pkgName"`.
Note that the alias name is not surrounded by quotes, but the package name is.
When an alias is defined, exported names in the package are referenced with
`alias.ExportedName`.

Circular imports where an import triggers the import of the current package
are treated as errors.

## Error Handling

Go does not support exceptions.
Instead functions that may encounter errors have an
additional return value of type `error` that callers must check.
The type `error` is an interface that defines a single method `Error`
that returns a string description of the error.
The standard library creates and exports many instances.
It is also possible to define custom implementations of the
`error` interface that hold additional data describing the error.

The `errors` package defines a `New` method
that can be used to create error instances from a string.
For example,

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

Here is an example of defining a custom error type, `DivideByZero`,
that holds an error message and the numerator value.

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

