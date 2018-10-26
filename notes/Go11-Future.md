## Community Packages

To see a list of community contributed packages
with links to documentation, browse one of these:

- <https://godoc.org/>
- <https://go-search.org/>
- <https://github.com/golang/go/wiki/Projects>

Some popular Go packages include:

- **Bolt** <https://github.com/boltdb/bolt>\
  "An embedded key/value database for Go."

- **Buffalo** web framework <https://gobuffalo.io/en>\
  "Buffalo is a Go web development eco-system.
  Designed to make the life of a Go web developer easier.

  Buffalo starts by generating a web project for you that
  already has everything from front-end (JavaScript, SCSS, etc...)
  to back-end (database, routing, etc...) already hooked up
  and ready to run. From there it provides easy APIs to
  build your web application quickly in Go."

- **CockroachDB** <https://www.cockroachlabs.com>\
  "the open source, cloud-native SQL database"

- **Fyne** <https://github.com/fyne-io/fyne>\
  "cross-platform GUIs in Go based on Enlightenment Foundation Libraries (EFL)"

- **Kubernetes** <https://kubernetes.io/>\
  "an open-source system for automating deployment, scaling,
  and management of containerized applications"

- **mongo-go-driver** <https://github.com/mongodb/mongo-go-driver>\
  "MongoDB Driver for Go"

- **Testify** testing library <https://github.com/stretchr/testify>\
  "A toolkit with common assertions and mocks
  that plays nicely with the standard library"

## Missing Features

Currently the primary missing features in Go include:

- package version management

  An experimental approach based on vgo is included in Go 1.11.
  Feedback is being gathered now and
  perhaps this will be finalized in Go 1.12.

- generics

  Generic types are needed for truly functional programming
  so generic functions like `map`, `filter`, and `reduce`
  can be implemented.
  Generics are on the road map for Go 2.0.

- immutable data types

  Immutable data types are needed to provide
  guarantees that prevent accidental data mutations.
  This has come to be an expected feature
  in functional programming languages.

- concise function definitions

  Go lacks support for function shorthand syntax like arrow functions.
  These are especially useful for simple callback functions
  that are passed to other functions.
  Arrow functions have come to be an expected feature
  in functional programming languages.

## Annoyances

There are several features or lack of features in Go
that some find annoying. These include:

- tabs

  The `gofmt` code formatting tool uses tabs for indentation.
  This makes it difficult to print code with reasonable indentation
  because printers use eight spaces for tabs.

- no single-line `if` statements

  Simple statements like `if temperature > 100 return`
  must be written in a way that takes up three lines.

  ```go
  if temperature > 100 {
    return
  }
  ```

- no ternary operator

  Rather than writing a line like
  `color := temperature > 100 ? "red" : "blue"`
  we must write something like the following:

  ```go
  var color
  if temperature > 100 {
    color = "red"
  } else {
    color = "blue"
  }
  ```

  One reason the ternary operator is not supported
  is that it is easily abused. In languages that support
  the ternary operator it is not uncommon to see
  deeply nested uses that are difficult to understand.
  However, `gofmt` could format nested ternaries
  in a way that is easy to read.

- no destructuring

  Go does not support destructuring of arrays, slices, or structs.

  Consider the following JavaScript code that uses array destructuring.

  ```js
  const colors = ['red', 'green', 'blue'];
  const [color1, color3] = colors;
  ```

  In Go must be written like:

  ```go
  colors := []string{"red", "green", "blue"}
  color1 := colors[0]
  color3 := colors[2]
  ```

  Consider the following JavaScript code that uses object destructuring.

  ```js
  const address = {
    street: '123 Some Street',
    city: 'Somewhere',
    state: 'MO',
    zip: 63304
  };
  const [city, zip] = address;
  ```

  In Go must be written like:

  ```go
  address := Address{ // assumes an Address type
    street: '123 Some Street',
    city: 'Somewhere',
    state: 'MO',
    zip: 63304
  };
  city := address.city // repeats the name
  zip := address.zip // repeats the name
  ```

- no generic types (described in the "Not Functional" section)

- `golint` uppercase acronyms

  Many programming languages use a convention where acronyms in
  variable and function names have only the first letter capitalized.
  For example, a name containing "is", "JSON", "or", and "XML"
  would be written as `isJsonOrXml`.

  The `golint` tool wants all acronyms it recognizes to be all uppercase.
  So this name would be `isJSONOrXML`.
  This is especially bad when there are consecutive acronyms in a name.

  The `golint` tool recognizes almost 40 acronyms.
  For a list of them, search for `commonInitialisms` at
  <https://github.com/golang/lint/blob/master/lint.go>.

- `GOPATH` environment variable

  This must be changed when switching between projects
  unless the module support introduced in Go 1.11 is used.

- comma required after last struct field

  In struct values, a comma is required after the last field
  if the closing brace is on a new line. For example,

  ```go
  address := Address{
    street: "123 Some Street",
    city:   "Somewhere",
    state:  "MO",
    zip:    "63304", // note the comma here
  },
  ```

## Summary

TODO: Write this.
