# Go For It! Part 5

This article is the fifth in a multi-part series on the Go programming language.
It provides details on reflection in Go.

The first article in the series is available at
<https://objectcomputing.com/resources/publications/sett/november-2018-way-to-go-part-1>.
It provides an overview of the language and a quick-start guide.

The second article in the series is available at
<https://objectcomputing.com/resources/publications/sett/?-2019-way-to-go-part-2>.
It provides details on all the syntax in the Go language.

The third article in the series is available at
<https://objectcomputing.com/resources/publications/sett/?-2019-way-to-go-part-3>.
It provides an overview of the Go Standard Library
and provides details on some of its packages.

The fourth article in the series is available at
<https://objectcomputing.com/resources/publications/sett/?-2019-way-to-go-part-4>.
It provides details on the use of reflection in Go.

Future articles will cover solutions to common tasks,
modules, testing, and the future of Go.

## Reflection

The standard library package `reflect` provides run-time reflection
for determining the type of a value and manipulating it in a type-safe way.

Use of reflection should be avoided when possible.
From Rob Pike, "Clear is better than clever. Reflection is never clear."
However, sometimes reflection is necessary.

Reflection is not used frequently in Go,
so it is difficult to memorize the reflection API.
This article will provide a quick refresher.

### Types

To get the type of an expression, call `reflect.TypeOf(expression)`.
This returns a `Type` object that has many methods,
some of which are described below.

The `Name` method returns the type as a string.
The `Kind` method returns the type as an
enumerated value of type `reflect.Kind`. For example:

```go
package main

import (
  "fmt"
  "reflect"
)

func whatAmI(value interface{}) {
  kind := reflect.TypeOf(value).Kind()
  switch kind {
  case reflect.Array:
    fmt.Println("I am an array.")
  case reflect.Slice:
    fmt.Println("I am a slice.")
  default:
    fmt.Println("I am something else.")
  }
}

func main() {
  s := []int{1, 2, 3}
  whatAmI(s) // I am a slice.

  a := [3]int{1, 2, 3}
  whatAmI(a) // I am an array.

  i := 1
  whatAmI(i) // I am something else.
}
```

The `PkgPath` method returns the import path for the type.

The `Implements` method returns a boolean indicating
whether the type implements a given interface type.

For example:

```go
package main

import (
  "container/list"
  "fmt"
  "reflect"
)

type Shape interface {
  Area() float64
  Name() string
}

type Rectangle struct {
  width, height float64
}

func (r Rectangle) Area() float64 {
  return r.width * r.height
}
func (r Rectangle) Name() string {
  return "rectangle"
}
func (r Rectangle) String() string {
  return fmt.Sprintf("rectangle %f by %f", r.width, r.height)
}

func main() {
  rect := Rectangle{width: 10, height: 20} // custom type defined here
  typ := reflect.TypeOf(rect)
  fmt.Println(typ.Name())    // Rectangle
  fmt.Println(typ.Kind())    // struct
  fmt.Println(typ.PkgPath()) // main

  myListPtr := list.New() // type in standard library
  ptrType := reflect.TypeOf(myListPtr)
  elemType := ptrType.Elem() // type to which the pointer points
  fmt.Println("name of myList type is", elemType.Name())
  fmt.Println("path of myList type is", elemType.PkgPath())

  // Note approach to get a reflect.Type for an interface.
  shapeType := reflect.TypeOf((*Shape)(nil)).Elem()
  fmt.Println("Is a Shape?", typ.Implements(shapeType))
  stringerType := reflect.TypeOf(new(Shape)).Elem()
  fmt.Println("Is a Stringer?", typ.Implements(stringerType))
}
```

### Values

To get the value of an expression, call `reflect.ValueOf(expression)`.
This returns a `Value` object that has many methods,
some of which are described below.

Methods that extract the actual value from a `Value` object include:

- `Bool` returns a `bool`
- `Bytes` returns a `byte` slice
- `Cap` returns the capacity of a slice, array, or `chan` value
- `Complex` returns a `complex128`
- `Float` returns a `float64`
- `Int` returns a `int64`
- `IsNil` returns a `bool` that indicates whether the underlying value is nil
- `Len` returns the length of a `string`, slice, array, `map`, or `chan` value
- `Pointer` returns a `uintptr`
- `String` returns a `string`
- `Uint` returns a `uint64`

Methods that set the actual value in a `Value` object include:

- `Set` takes a `Value`
- `SetBool` takes a `bool`
- `SetBytes` takes a `byte` slice
- `SetCap` takes an `int` and sets the capacity of a slice
- `SetComplex` takes a `complex128` slice
- `SetFloat` takes a `float64` slice
- `SetInt` takes a `int64` slice
- `SetLen` takes an `int` and sets the length of a slice
- `SetMapIndex` takes two `Value` objects representing a key and its value
- `SetString` takes a `string`
- `SetUint` takes a `uint64`

To determine if a `Value` can be set, call the `myValue.CanSet()`
which returns a bool.

For example:

```go
// Need an example where the Value method CanSet doesn't return false!
// The underlying value must be "addressable"!
For an operand x of type T, the address operation &x generates a pointer of type *T to x. The operand must be addressable, that is, either a variable, pointer indirection, or slice indexing operation; or a field selector of an addressable struct operand; or an array indexing operation of an addressable array. As an exception to the addressability requirement, x may also be a (possibly parenthesized) composite literal

```

TODO: List more of these and provide examples.

### Type Methods For Function Types

For a function type, it is possible to iterate
over its parameters and return types.

The `NumIn` method returns the number of parameters in the function.

The `In` method returns a `Type` object
describing the parameter at a given index.

The `NumOut` method returns the number of return types in the function.

The `Out` method returns a `Type` object
describing the return type at a given index.

The `Call` method calls a function
with arguments specific in a `reflect.Value` slice
and returns the return value in a `reflect.Value slice`.

For example:

```go
package main

import (
  "fmt"
  "log"
  "reflect"
  "strings"
)

// VerifyFunc verifies that a given value is a function
// and panics if it is not.
func VerifyFunc(fnName string, fn interface{}) {
  value := reflect.ValueOf(fn)
  if value.Kind() != reflect.Func {
    log.Fatalf("%s requires a func\n", fnName)
  }
}

// DumpStruct prints information about each field in a given struct.
// It must be passed a pointer to a struct.
func DumpFunc(fn interface{}) {
  VerifyFunc("DumpFunc", fn)
  funcType := reflect.ValueOf(fn).Type()
  fmt.Println("signature is", funcType) // func(string, int) string
  numIn := funcType.NumIn() // 2
  for i := 0; i < numIn; i++ {
    fmt.Printf("parameter type %d is %s\n", i+1, funcType.In(i).Name())
  }
  numOut := funcType.NumOut() // 1
  for i := 0; i < numOut; i++ {
    fmt.Printf("return type %d is %s\n", i+1, funcType.Out(i).Name())
  }
}

// CallFunc calls a given function with given arguments
// and returns a reflect.Value slice of results.
func CallFunc(fn interface{}, args []interface{}) []reflect.Value {
  VerifyFunc("CallFunc", fn)
  val := reflect.ValueOf(fn)
  in := make([]reflect.Value, len(args))
  for i, arg := range args {
    in[i] = reflect.ValueOf(arg)
  }
  return val.Call(in)
}

func main() {
  DumpFunc(strings.Repeat)

  args := []interface{}{"Ho", 3}
  out := CallFunc(strings.Repeat, args)
  result := out[0].String()
  fmt.Println("result =", result) // HoHoHo

  // This commented out line demonstrates handling of
  // invalid values passed to DumpFunc.
  //DumpFunc("not a function") // DumpFunc requires a func
}
```

### Type Methods For Struct Types

For a struct type, it is possible to iterate over its fields.

The `NumField` method returns the number of fields in the struct.

The `Field` method returns a `StructField` object
describing the field at a given index.

The `FieldByName` method returns a `StructField` object
describing the field with a given name.

The `Set` method sets a struct field to a given value.

For example:

```go
package main

import (
  "fmt"
  "log"
  "reflect"
)

type Address struct {
  Street string
  City   string
  State  string
  Zip    int
  Home   bool
}

// VerifyStructPtr verifies that a given value is a struct pointer
// and panics if it is not.
func VerifyStructPtr(fnName string, val interface{}) {
  value := reflect.ValueOf(val)
  if value.Kind() != reflect.Ptr || value.Elem().Kind() != reflect.Struct {
    log.Fatalf("%s requires a struct pointer\n", fnName)
  }
}

// DumpStruct prints information about each field in a given struct.
// It must be passed a pointer to a struct.
// Note that the type of this parameter cannot be *interface{}.
func DumpStruct(structPtr interface{}) {
  VerifyStructPtr("DumpStruct", structPtr)
  elem := reflect.ValueOf(structPtr).Elem()
  elemType := elem.Type()
  for i := 0; i < elem.NumField(); i++ {
    field := elemType.Field(i)
    // Get the value of the field at index i as the generic interface{} type.
    fieldValue := elem.Field(i).Interface()
    fmt.Printf("%s = %v (%s)\n", field.Name, fieldValue, field.Type)
  }
}

// GetField returns a reflect.Value for a given struct field.
// It must be passed a pointer to a struct.
func GetField(structPtr interface{}, fieldName string) reflect.Value {
  VerifyStructPtr("GetField", structPtr)
  elem := reflect.ValueOf(structPtr).Elem()
  return elem.FieldByName(fieldName)
}

// SetField sets a given field in a struct.
// It must be passed a pointer to a struct.
// If the value type passed does not match the field type, this will panic.
func SetField(structPtr interface{}, fieldName string, value interface{}) {
  VerifyStructPtr("SetField", structPtr)
  elem := reflect.ValueOf(structPtr).Elem()
  field := elem.FieldByName(fieldName)
  field.Set(reflect.ValueOf(value))
}

func main() {
  address := Address{"123 Some Street", "Some Town", "MO", 12345, true}
  addressPtr := &address
  DumpStruct(addressPtr)

  SetField(addressPtr, "State", "IL")
  SetField(addressPtr, "Zip", 98765)
  SetField(addressPtr, "Home", false)
  fmt.Println(address)

  value := GetField(addressPtr, "State").String()
  fmt.Println("State =", value) // IL - a string

  // These commented out lines demonstrate handling of
  // invalid values passed to DumpStruct.
  //s := "not a struct"
  //DumpStruct(s) // DumpStruct requires a struct pointer
  //DumpStruct(&s) // DumpStruct requires a struct pointer
}
```

### Type Methods For Interface Types

For interface types, it is possible to iterate over its methods.

The `NumMethod` method returns the number of methods in the interface.

The `Method` method returns a `Method` object
describing the method at a given index.

For example:

```go
package main

import (
  "fmt"
  "reflect"
)

type Shape interface {
  Area() float64
  Rotate(angle float64)
  Translate(x, y float64)
}

func DumpMethod(method reflect.Method) {
  methodType := method.Type
  numIn := methodType.NumIn()
  numOut := methodType.NumOut()
  fmt.Printf("%s method takes %d arguments and returns %d values\n", method.Name, numIn, numOut)
  for i := 0; i < numIn; i++ {
    fmt.Printf("  parameter %d type is %s\n", i+1, methodType.In(i).Name())
  }
  for i := 0; i < numOut; i++ {
    fmt.Printf("  return %d type is %s\n", i+1, methodType.Out(i).Name())
  }
}

func DumpInterface(intfPtr interface{}) {
  intfType := reflect.TypeOf(intfPtr).Elem() // returns a reflect.Type
  fmt.Println("interface name is ", intfType.Name())
  fmt.Println("method count is", intfType.NumMethod())
  for i := 0; i < intfType.NumMethod(); i++ {
    DumpMethod(intfType.Method(i))
  }
}

func main() {
  var intfPtr *Shape
  DumpInterface(intfPtr)
}
```

### Type Methods For Map Types

For map types, it is possible to obtain the key and value types.

The `Key` method returns a `Type` object describing the key type.

The `Elem` method returns a `Type` object describing the value type.
This method can also be used to get the element type of an
`Array`, `Chan`, pointer, or `Slice`.

The `MapIndex` method returns the value of a given map key.

The `SetMapIndex` method sets the value of a given map key.

For example:

```go
package main

import (
  "fmt"
  "log"
  "reflect"
)

type PlayerScoreMap map[string]int

// VerifyMap verifies that a given value is a struct pointer
// and panics if it is not.
func VerifyMap(fnName string, val interface{}) {
  value := reflect.ValueOf(val)
  if value.Kind() != reflect.Map {
    log.Fatalf("%s requires a Map\n", fnName)
  }
}

// DumpMap prints the contents of a given Map.
// It must be passed a Map.
func DumpMap(theMap interface{}) {
  VerifyMap("DumpMap", theMap)
  mapValue := reflect.ValueOf(theMap)
  mapType := mapValue.Type()
  keyType := mapType.Key()
  valueType := mapType.Elem()
  fmt.Printf("map with %s keys and %s values\n", keyType.Name(), valueType.Name())

  for _, key := range mapValue.MapKeys() {
    value := mapValue.MapIndex(key)
    fmt.Printf("  %v = %v\n", key, value)
  }
}

// SetMap sets the value of a given key in a map.
// It must be passed a Map and the key and value
// must have the correct types for the map.
func SetMap(theMap interface{}, key interface{}, value interface{}) {
  VerifyMap("SetMap", theMap)
  m := reflect.ValueOf(theMap)
  k := reflect.ValueOf(key)
  v := reflect.ValueOf(value)
  m.SetMapIndex(k, v)
}

func main() {
  scoreMap := PlayerScoreMap{"Mark": 90, "Tami": 92}
  scoreMap["Amanda"] = 83
  scoreMap["Jeremy"] = 95

  SetMap(scoreMap, "Mark", 96)

  DumpMap(scoreMap)

  // This commented out line demonstrate handling of
  // invalid values passed to DumpInterface.
  //DumpMap("not a map") // DumpMap requires a map
}
```

### Type Methods For Arrays and Slices Types

To get a `Value` for a slice, `reflect.Value(slice)`.

To get the length, `value.Len()`

To get the element at index i, `value.Index(i)`.

TODO: Add an example similar to the one for struct types.

There is much more to reflection in Go!

## Not Functional

Go doesn't support some aspects of functional programming out of the box.
While go supports first-class functions that can be stored in variables,
passed to functions, and returned from functions,
it does not support concise function definitions (like arrow functions in other languages)
or generics for writing functions that work with multiple types.

Writing generic collection functions such as
`map`, `filter`, and `reduce` is somewhat difficult in Go.
It's easy to write type-specific versions of these.
For example,

```go
func mapOverInts(slice []int, fn func(int) int) []int {
  result := make([]int, len(slice))
  for i, v := range slice {
    result[i] = fn(v)
  }
  return result
}

func main() {
  values := []int{1, 2, 4}
  double := func(v int) int { return v * 2 }
  doubled := mapOverInts(values, double) // [2 4 8]
  fmt.Println(doubled)
}
```

Versions of these functions that work with slices of any value types
can be written using the standard library `reflect` package
along with the "any" type `interface{}`.
This is a kind of substitute for generics.
However, the downside is that type errors become
runtime errors instead of compile-time errors.

Here is an example of how `map`, `filter`, and `reduce`
can be written using the "any" type.

```go
package functional

import (
  "log"
  "reflect"
)

// AssertFunc asserts that a given value is a func and
// the parameter and return types are the expected types.
func AssertFunc(fn interface{}, in []reflect.Type, out []reflect.Type) {
  assertKind(fn, reflect.Func)

  fnType := reflect.TypeOf(fn)

  actualNumIn := fnType.NumIn()
  expectedNumIn := len(in)
  if actualNumIn != expectedNumIn {
    log.Fatalf("expected func with %d parameters but had %d\n", expectedNumIn, actualNumIn)
  }

  actualNumOut := fnType.NumOut()
  expectedNumOut := len(out)
  if actualNumOut != expectedNumOut {
    log.Fatalf("expected func with %d return types but had %d\n", expectedNumOut, actualNumOut)
  }

  for i := 0; i < expectedNumIn; i++ {
    expectedType := in[i]
    actualType := fnType.In(i)
    if actualType != expectedType {
      panicF("expected parameter %d to have type %s but was %s\n", i+1, expectedType, actualType)
    }
  }

  for i := 0; i < expectedNumOut; i++ {
    expectedType := out[i]
    actualType := fnType.Out(i)
    if actualType != expectedType {
      panicF("expected result type %d to have type %s but was %s\n", i+1, expectedType, actualType)
    }
  }
}

// AssertKind asserts the kind of a given value.
func AssertKind(value interface{}, kind reflect.Kind) {
  valueKind := reflect.TypeOf(value).Kind()
  if valueKind != kind {
    panicF("expected kind %s but got %s\n", kind, valueKind)
  }
}

// AssertType asserts the type of a given value.
// Note that this does not currently detect mismatched struct types.
// It just verifies that some kind of struct is received if one is required.
//TODO: Define an assertStruct function that verifies all the struct fields!
func AssertType(value interface{}, typ reflect.Type) {
  valueType := reflect.TypeOf(value)
  if valueType != typ {
    panicF("expected type %s but got %s\n", typ, valueType)
  }
}

func Filter(slice interface{}, predicate interface{}) interface{} {
  AssertKind(slice, reflect.Slice)
  sliceType := reflect.TypeOf(slice)
  elementType := sliceType.Elem()
  AssertFunc(predicate, []reflect.Type{elementType}, []reflect.Type{boolType})

  // Create result slice with same type as first argument.
  result := reflect.New(sliceType).Elem()

  predicateValue := reflect.ValueOf(predicate)
  sliceValue := reflect.ValueOf(slice)

  // Can "range" be used here?
  for i := 0; i < sliceValue.Len(); i++ {
    element := sliceValue.Index(i).Interface()
    elementValue := reflect.ValueOf(element)

    in := make([]reflect.Value, 1)
    in[0] = elementValue
    out := predicateValue.Call(in)

    if out[0].Bool() {
      result = reflect.Append(result, elementValue)
    }
  }

  return result.Interface()
}

// Map creates a new slice from the elements in an existing slice where
// the new elements are the results of calling fn on each existing element.
func Map(slice interface{}, fn interface{}) interface{} {
  AssertKind(slice, reflect.Slice)
  sliceType := reflect.TypeOf(slice)
  elementType := sliceType.Elem()
  AssertFunc(fn, []reflect.Type{elementType}, []reflect.Type{elementType})

  // Create result slice with same type as first argument.
  result := reflect.New(sliceType).Elem()

  fnValue := reflect.ValueOf(fn)
  sliceValue := reflect.ValueOf(slice)

  // Can "range" be used here?
  for i := 0; i < sliceValue.Len(); i++ {
    element := sliceValue.Index(i).Interface()
    elementValue := reflect.ValueOf(element)

    in := make([]reflect.Value, 1)
    in[0] = elementValue
    out := fnValue.Call(in)
    result = reflect.Append(result, out[0])
  }

  return result.Interface()
}

// Reduce reduces the elements in a slice to a single value.
func Reduce(slice interface{}, fn interface{}, initial interface{}) interface{} {
  AssertKind(slice, reflect.Slice)

  initialType := reflect.TypeOf(initial)

  sliceType := reflect.TypeOf(slice)
  elementType := sliceType.Elem()
  AssertFunc(fn, []reflect.Type{initialType, elementType}, []reflect.Type{elementType})

  // Create result slice with same type as first argument.
  result := reflect.ValueOf(initial)

  fnValue := reflect.ValueOf(fn)
  sliceValue := reflect.ValueOf(slice)

  for i := 0; i < sliceValue.Len(); i++ {
    element := sliceValue.Index(i).Interface()
    elementValue := reflect.ValueOf(element)

    in := make([]reflect.Value, 2)
    in[0] = result
    in[1] = elementValue
    out := fnValue.Call(in)
    result = out[0]
  }

  return result.Interface()
}
```
