## Common Tasks

## Command-Line Arguments

Command-line arguments are held in a slice stored in `os.Args`.
Index 0 holds the path to the executable.
An executable is created dynamically when "go run" is used.
Index 1 holds the first command-line-argument.
Often `os.Args[1:]` is used to obtain a slice
that only contains the command-line arguments.

For example, suppose the file `greet.go` contains the following:

```go
package main

import (
  "fmt"
  "os"
)

func main() {
  // Get a slice containing only the command-line arguments.
  args := os.Args[1:]

  // If the required number of arguments are not present ...
  if len(args) != 2 {
    fmt.Println("usage: greet {first-name} {last-name}")
    os.Exit(1)
  }

  firstName := args[0]
  lastName := args[1]
  fmt.Printf("Hello %s %s!\n", firstName, lastName)
}
```

To run this, enter `go run greet.go Mark Volkmann`.

To build an executable and run it,
enter `go build greet.go; ./greet Mark Volkmann`

## Readers

The `io` package defines the `Reader` interface
that has a single method `Read`.
This populates a byte slice and returns the number of bytes read
or an error (io.EOF if end of stream is reached).

There are many implementations of this interface in the standard library,
including ones for reading from strings, files, and network connections.

To read from a string, see <https://tour.golang.org/methods/21>.

To read from a file, use the package `io/ioutil`
which defines a `ReadFile` function.

For example,

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

The `io` package defines the `Writer` interface
that has a single method `Write`.
This writes a byte slice to an underlying data stream
and returns the number of bytes written or an error.
There are many implementations in the standard library
including ones for writing to strings, files, and network connections.

To write to a string, see TODO.

The package `io/ioutil` defines a `WriteFile` function.
Here is an example of code that writes to a file.

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

To write data a little at time,

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

## JSON

The `encoding/json` standard library package
supports marshalling and unmarshalling of JSON.

To marshal data to JSON use the `json.Marshal` function.
For example,

```go
import "encoding/json"

// Note that the field names must start uppercase
// so the json package can access them.
type person struct {
  Name string
  Age number
}
p := person{Name: "Mark", Age: 57}
jsonData, err := json.Marshal(person)
// Check `err` to verify that this was successful.
// jsonData will have the type []byte.
// To get a string from it, use string(jsonData).
```

To unmarshal data from JSON use the `json.Unmarshal` function.
For example,

```go
var p person
err := json.Unmarshal(jsonData, @p)
// Check `err` to verify that this was successful.
```

## HTTP Servers

HTTP servers can be implemented using the standard library package `net/http`.
There are also many community packages that make this easier and add many features.
A popular example is the `httprouter` package at <https://github.com/julienschmidt/httprouter>.

The following sections provide examples of implementing an HTTP REST server
using `net\http` and `httprouter`.

### REST Server Using Standard Library

The net/http package in the standard library can be used to implement REST services.
Here is an example of a simple HTTP server in a file named `main.go`.
To run it, enter `go run main.go` and browse localhost:1234.

```go
package main

import (
  "fmt"
  "net/http"
)

type myHandler struct{}

func (handler myHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
  fmt.Fprint(w, "Hello, World!")
}

func main() {
  var handler myHandler
  http.ListenAndServe("localhost:1234", handler)
}
```

The `net/http` package can also be used to
send an HTTP request and receive the HTTP response.
For example, here is an application that uses an iTunes REST service
to get a list of albums by a given artist.
For more details on this service, see
<https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/#lookup>.

```go
package main

import (
  "encoding/json"
  "fmt"
  "io/ioutil"
  "log"
  "net/http"
  "os"
  "sort"
  "strings"
  "time"
)

// Album describes a single album.
// This will be used by json.Unmarshall which
// requires all the fields to be exported (uppercase).
// It matches JSON property names to these case-insensitive.
type Album struct {
  ArtistID         int
  CollectionID     int
  ArtistName       string
  CollectionName   string
  ReleaseDate      string
  PrimaryGenreName string
}

// Albums describes a collection of albums.
// This will also be used by json.Unmarshall.
type Albums struct {
  ResultCount int
  Results     []Album
}

func check(err error) {
  if err != nil {
    log.Fatal(err)
  }
}

func main() {
  // An artist name must be supplied as a command-line argument.
  if len(os.Args) < 2 {
    log.Fatal("usage: albums {artist}")
  }

  // Form the artist name from all the command-line arguments.
  artist := strings.Join(os.Args[1:], " ")
  urlPrefix := "https://itunes.apple.com/search?term="
  getURL := urlPrefix + strings.Replace(artist, " ", "+", -1) + "&entity=album"

  // Get all the albums by the artist.
  resp, err := http.Get(getURL)
  check(err)
  defer resp.Body.Close()

  // Read the entire response body into a slice of bytes.
  body, err := ioutil.ReadAll(resp.Body)
  check(err)
  //fmt.Println("body =", string(body))

  // Parse the bytes as JSON.
  // Using json.Unmarshall is preferred over json.NewDecoder
  // for JSON in HTTP response bodies.  JSON properties that
  // don't match a field in the struct being populated are ignored.
  var albums Albums
  err = json.Unmarshal(body, &albums)
  check(err)
  //fmt.Printf("albums = %+v\n", albums)

  // Sort albums by release date.
  results := albums.Results
  sort.Slice(results, func(i, j int) bool {
    return results[i].ReleaseDate < results[j].ReleaseDate
  })

  fmt.Println("Albums by " + artist)
  for _, album := range albums.Results {
    t, err := time.Parse(time.RFC3339, album.ReleaseDate)
    check(err)
    fmt.Printf("%s - %d/%d/%d\n", album.CollectionName, t.Month(), t.Day(), t.Year())
  }
}
```

### REST Server Using httprouter

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

The go-watcher application starts another application in the current directory
watches all the `.go` files in and below current directory,
and restarts the app when any are modified.
It is ideal for working on servers such as HTTP servers.

`GOPATH` must be set to point to the directory
containing the `src` directory of the app.
To use this,
cd to the directory that contains the `.go` file containing
the application `main` function and enter `watcher`.
(This works in bash, but not in the Fish shell.)

It is also possible to specify command-line arguments
to be passed to the app.

For more information, see <https://github.com/canthefason/go-watcher>.

## SQL Databases

The standard library package `database/sql` defines
interfaces that are implemented by database-specific drivers.
This allows many databases to be accessed using the same API.

Database drivers can be installed using `go get`.
For MySQL, `go get github.com/go-sql-driver/mysql`.
For PostgreSQL, `go get github.com/lib/pq`
For other databases, see <https://github.com/golang/go/wiki/SQLDrivers>.

For more detail on accessing databases from Go,
see <http://go-database-sql.org/>.

Here is an example of an application that uses a MySQL database.
It selects the `name` column for all rows in the `hero` table
and writes them to stdout.

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
    check(err)
    fmt.Println(name)
  }
  err = rows.Err()
  check(err)
}
```

## Calling other languages from Go

The `cgo` tool allows Go code to call C code.
For more detail, see <https://golang.org/cmd/cgo/>.

If needed, the C code can use the Java Native Interface (JNI)
to call Java code.

## Calling Go from other languages

The `gobind` tool generates language bindings
for calling Go functions from Java and Objective-C.

Go code can be built with the `-buildmode=c-shared` flag
to create a C shared library (in a shared object binary file)
that can be used by C, Java, Node, Python, and Ruby code.

For more detail see
<https://medium.com/learning-the-go-programming-language/calling-go-functions-from-other-languages-4c7d8bcc69bf>.

## Executing Shell Commands

Go can execute shell commands using the standard library package `os/exec`.
Note that this may not work in Windows
and does not work in "The Go Playground".

Executing a shell command in this way
does not create a system shell
and does not expand glob patterns.
To get this functionality,
use a command that starts a shell like `bash`.

The `Command` function takes a command name and arguments
and returns a struct describing the command.
This struct has many methods including:

- `Output`\
  runs a command, waits for it to complete, and returns a byte array
  containing everything the command writes to stdout
- `CombinedOutput`\
  runs a command, waits for it complete, and returns a byte array
  containing everything the command writes to stdout and stderr
- `Run`\
  runs a command, waits for it to complete,
  but doesn't capture what it writes to stdout or stderr
- `Start`\
  method runs a command, but doesn't wait for it to complete,
  and doesn't capture what it writes to stdout or stderr;
  use the methods `StdinPipe`, `StdoutPipe`, and `StderrPipe` with this
- `Wait`\
  wait for a command that was started with the `Start` method to complete

For example,

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

## Internet of Things (IOT) Support

The community package GOBOT at <https://gobot.io/>
supports many platforms including
Arduino, Beaglebone, Intel Edison, MQTT, Pebble, and Raspberry Pi.

## Compiling to JavaScript

GopherJS compiles Go code to JavaScript.
See <https://github.com/gopherjs/gopherjs>.
To try it online, browse
<https://gopherjs.github.io/playground/>.

## Popular Go Packages

- **Bolt** <https://github.com/boltdb/bolt>\
  "An embedded key/value database for Go."

- **Buffalo** web framework <https://gobuffalo.io/en>`
  "Buffalo is a Go web development eco-system.
  Designed to make the life of a Go web developer easier.

  Buffalo starts by generating a web project for you that
  already has everything from front-end (JavaScript, SCSS, etc...)
  to back-end (database, routing, etc...) already hooked up
  and ready to run. From there it provides easy APIs to
  build your web application quickly in Go."

- **CockroachDB** <https://www.cockroachlabs.com>`
  "the open source, cloud-native SQL database"

- **Kubernetes** <https://kubernetes.io/>\
  "an open-source system for automating deployment, scaling,
  and management of containerized applications"

- **mongo-go-driver** <https://github.com/mongodb/mongo-go-driver>`
  "MongoDB Driver for Go"

- **Testify** testing library <https://github.com/stretchr/testify>\
  "A toolkit with common assertions and mocks
  that plays nicely with the standard library"
