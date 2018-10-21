## Getting Started

Let's walk through the steps to create a Go application.
If you don't already have a GitHub (<https://github.com>)
or Bitbucket (<https://bitbucket.org>) account,
I recommend creating one now so you can experience publishing an app.

This article uses the term "terminal" to refer to
a Windows Command Prompt or a Linux/Mac Terminal window.

The support for "modules" added in Go 1.11 is
considered experimental and will not be used here.
When using modules, some of the steps described
in this section are performed in a different way.

### Install Go

One way to install Go is to browse <https://golang.org/dl/>,
download a platform-specific installer, and double-click it.
If you are using a Mac and have Homebrew (<https://brew.sh/>) installed,
you can instead run `brew install go`.
To verify that Go is installed, open a terminal and enter `go version`
which should output the version of Go you have installed.

In Unix and macOS Go is installed in the `/usr/local/go` directory.
The `src` subdirectory contains the source code
for the standard library packages.

### Create Workspace

Go projects live in a workspace
which is home to one or more packages.
A package is defined by one or more `.go` source files
that reside in the same directory within a workspace.

A workspace can host any number of projects.
It's not uncommon to have a single workspace
that hosts every project on the computer.
The environment variable `GOPATH` must be set to point
to the top directory of the workspace currently being used.

Create a `go` directory in your home directory.
Set the `GOPATH` environment variable to point to this directory.

One way to see the current value of `GOPATH` is to enter `go env GOPATH`.
This works on any platform, unlike entering `echo $GOPATH`
which only works on UNIX-like systems.

### Create First App

Create a `src` directory inside your `go` directory.

Packages and applications contributed by the community
(not in the standard library) must be installed.
This is typically done using `go get package-url`
where `package-url` excludes the `https://` prefix.

Packages are installed under `$GOPATH/src` in a subdirectory
that corresponds to the package URL.
It does this regardless of the directory from which `go get` is run.
For example, `go get github.com/julienschmidt/httprouter`
installs the`.go` files that implement the package in
`$GOPATH/src/github.com/julienschmidt/httprouter`.
Using the package URL avoids path/directory conflicts.

The `go get` command also builds the package and places its object file
under the `$GOPATH/pkg` directory.
In the case of httprouter, this creates `httprouter.a` in the
`$GOPATH/pkg/{platform}/github.com/julienschmidt` directory.
An example value for `{platform}` on a Mac is `darwin_amd64`.

It is recommended that you use the same approach for placing
your own packages in a workspace to avoid name collisions
and prepare for publishing the code in the future.

Note that there can be many local version control repositories
under the `src` directory. It's not necessary for the `GOPATH`
directory to correspond to a single repository.

Determine your preferred repository domain, such as `github.com`,
and your repository username, such as `mvolkmann`.
Create the directory `{repo-domain}/{repo-username}/{name}`
inside your `src` directory where `{name}` is the name
of the application or package you wish to create.
For an application named `hello`,
I would use `github.com/mvolkmann/hello`.

Create the file `main.go` inside this directory.

Go source files begin with a `package` statement.
This is followed by imports of other packages if any are needed.
The imports are followed by top-level declarations of
package-scoped constants, variables, functions, types, and methods.
Each of these will be described in detail
in the next article in the series.

Each application has a single function named `main`
that must be in a package named `main`.
This is the starting point of the application.
The one file that defines the `main` function
is often named `main.go`, but that is not required.

The primary way of writing output to the standard output stream (stdout)
is to use functions in the standard library package `fmt`.

Add the following to `main.go`.

```go
package main

import "fmt"

func main() {
  fmt.Println("Hello, World!")
}
```

As you experiment with various features of Go,
you'll likely want to create additional directories
like `hello` that each contain a `main.go` file.

### Run First App

Open a terminal and cd to your application directory.
Enter `go run main.go` to run the app.
Consider creating an alias for this, perhaps `grm`,
because you'll be running this command often.
This should output "Hello, World!".

### Build First App

To build an executable for this application, enter `go build` while in
the directory containing the file that defines the `main` function.
This will create an executable file in the current directory
that has the same name as the directory, `hello` in this case.
In Windows this file will have a `.exe` file extension.

To run the application, enter `./hello`, or in Windows just `hello`.

Go executables are statically linked which means
they can be run without any other supporting files.
They can be copied to a machine with the same architecture
and be run without installing anything else.

### Install First App

When Go installs an app it creates the executable
in the `bin` subdirectory of the current workspace.
If this directory doesn't exist, it is created.
It is convenient to have this directory included
in your `PATH` environment variable so these executables
can be run from anywhere by just entering their names.
Go ahead and add `$GOPATH/bin` to your `PATH` environment variable now.

To install the application, enter `go install` while in
the directory containing the file that defines the `main` function.
Assuming that your `PATH` environment variable is set correctly
you can now run the application by just entering `hello`
regardless of your current working directory.

To delete the installed executable, enter `go clean -i` while in
the directory containing the file that defines the `main` function..

### Create First Package

Non-trivial Go applications divide their code into several packages.
A package is a collection of `.go` files in the same directory
that all begin with the same `package` statement.
By convention, the directory name of a package should match the package name.
We will cover packages in more detail later.

To keep things simple so we can focus on the mechanics of Go we will
create a package that just provides a couple of basic functions.
The first will return the largest number in a collection of numbers.
The second will return the average of a collection of numbers.

Create the directory `$GOPATH/src/github.com/mvolkmann/statistics`,
substituting your repo domain and username.
Create the files `maximum.go` and `average.go` in this directory.
We could define both functions in the same file, but we are using
two files to show that a package can be defined by multiple source files.
Note that both files must begin with the same `package` statement.

The code below contains several comments to explain certain Go features.
These will be described in more detail
in the next article in the series.

Add the following to `maximum.go`.

```go
package statistics

// Max returns the maximum of a "slice" of float64 values.
// For now think of a slice as being like an array.
// Functions are only available to be used in other packages
// if they are "exported" which is indicated by
// starting their names with an uppercase letter.
// The type of the parameter "numbers" is a "slice"
// of double-precision floating point numbers.
// The return type follows the parameter list.
func Max(numbers []float64) float64 {
  if len(numbers) == 0 {
    return 0
  }

  // The := operator declares the variable on the left
  // and initializes it to the value on the right.
  max := numbers[0]

  // "range" is a keyword that is used to iterate over many kinds of sequences,
  // one of which is a slice.  In each iteration it returns two values.
  // For slices it returns an index and the value at that index.
  // In this example we do not need the index.  That is indicated by
  // placing it in the "blank identifier" represented by an underscore.
  for _, number := range numbers {
    if number > max {
      max = number
    }
  }

  return max
}
```

Add the following to `average.go`.

```go
package statistics

// This function is for internal use by this package
// so it is not exported (name starts lowercase).
func sum(numbers []float64) float64 {
  result := 0.0
  for _, number := range numbers {
    result += number
  }
  return result
}

// Avg returns the average of slice of float64 values.
func Avg(numbers []float64) float64 {
  if len(numbers) == 0 {
    return 0
  }

  // Go is very picky about types!
  // The "len" function returns an int.
  // We cannot divide a float64 by an int,
  // so we must cast the int to float64.
  return sum(numbers) / float64(len(numbers))
}
```

Run `go install` from the `statistics` package directory
to create the file `statistics.a` in the directory
`$GOPATH/pkg/{platform}/github.com/mvolkmann` directory.
If any of these directories below `$GOPATH` do not yet exist,
they will be created.
The file `statistics.a` is an object file.
When other packages that use this package are installed,
this file is used rather than compiling the code again
to speed up build times.

### Add Tests

Let's add tests to the "statistics" package.

The VS Code Go extension provides the "Go: Generate Unit Tests For Package"
command that does what its name implies.
It generates files with names that end in `_test.go`
for each `.go` file in the current package.
You could of course manually create these files.
Here is what it generates in `maximum_test.go`:

```go
package statistics

import "testing"

func TestMax(t *testing.T) {
  type args struct {
    numbers []float64
  }
  tests := []struct {
    name string
    args args
    want float64
  }{
    //TODO: Add some test data here.
  }
  for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
      if got := Max(tt.args.numbers); got != tt.want {
        t.Errorf("Max() = %v, want %v", got, tt.want)
      }
    })
  }
}
```

This uses the standard library package `testing`.
Each test function must have a name that begins with `Test`
and takes a pointer to a `testing.T` object.
These functions create a slice of structs called `tests`
that each describe a test assertion.
Each test assertion has a name, a set of arguments to be passed
to the function being tested (called "args"),
and the expected result (called "want").
The loop that follows iterates through the "tests"
and fails if for any assertion the actual value returned from
the function being tested does not match the "want" value.

All that is left for us to do is replace the `TODO` comment
with some test data.
Replace the `TODO` comment with the following:

```go
    {"empty slice", args{[]float64{}}, 0.0},
    {"single value", args{[]float64{3.1}}, 3.1},
    {"multiple values", args{[]float64{3.1, 7.2, 5.0}}, 7.2},
```

The tests in `average_test.go` are a little tricker.
When comparing computed floating point values,
we need to test whether they are "close", not exact, due to the
well-known issue of representing floating point numbers in binary.

We can import the standard library package "math" in the test file
and add a function like this:

```go
func close(n1 float64, n2 float64) bool {
  return math.Abs(n1-n2) < 1e-9
}
```

Then we can change `got != tt.want` in the tests to
`!close(got, tt.want)`.

The resulting `average_test.go` file contains the following:

```go
package statistics

// Note how multiple packages can be imported
// in a single "import" statement.
import (
  "math"
  "testing"
)

func close(n1 float64, n2 float64) bool {
  return math.Abs(n1-n2) < 1e-9
}

func Test_sum(t *testing.T) {
  type args struct {
    numbers []float64
  }
  tests := []struct {
    name string
    args args
    want float64
  }{
    {"empty slice", args{[]float64{}}, 0.0},
    {"single value", args{[]float64{3.1}}, 3.1},
    {"multiple values", args{[]float64{3.1, 7.2, 5.0}}, 15.3},
  }
  for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
      if got := sum(tt.args.numbers); !close(got, tt.want) {
        t.Errorf("sum() = %v, want %v", got, tt.want)
      }
    })
  }
}

func TestAvg(t *testing.T) {
  type args struct {
    numbers []float64
  }
  tests := []struct {
    name string
    args args
    want float64
  }{
    {"empty slice", args{[]float64{}}, 0.0},
    {"single value", args{[]float64{3.1}}, 3.1},
    {"multiple values", args{[]float64{3.1, 7.2, 5.0}}, 5.1},
  }
  for _, tt := range tests {
    t.Run(tt.name, func(t *testing.T) {
      if got := Avg(tt.args.numbers); !close(got, tt.want) {
        t.Errorf("Avg() = %v, want %v", got, tt.want)
      }
    })
  }
}
```

Note that this includes tests for both exported and non-exported functions.

To run the tests, cd to the `statistics` directory and enter `go test`.
Try changing an assertion so it fails
and run the tests again to see failing output.
The output includes the test function name, file name,
assertion name, and line number of each failure.

When using VS Code with the Go extension, the Command Palette
contains additional commands whose names begin with "Go:".
Several of these are related to testing including
"Generate Unit Tests For File", "Generate Unit Tests For Package",
"Test Function At Cursor", "Test File", "Test Package",
and "Test All Packages In Workspace".

If the tests in a file require setup
before any of its test functions run
or teardown after all of its test functions run,
define a `TestMain` function. For example,

```go
func TestMain(m *testing.M) {
  // Do setup here.

  // Run all the test functions in this file.
  result := m.Run()

  // Do teardown here.

  // This MUST be done to complete the tests in this file!
  os.Exit(result)
}
```

To run tests for multiple packages in the current workspace,
cd to `$GOPATH` and enter `go test` followed by
the import paths of all the packages to be tested.
Wildcards in these import paths are not supported.

When `go test` is given package import paths to run,
it remembers (caches) successful tests.
Later when a package is tested again in this way, if its last
test was successful and there have been no related code changes
the tests are skipped to save time.
When this happens "(cached)" will appear after the test
in place of the elapsed time.
Note that tests are never skipped in this way when
`go test` is run without listing package names
or run from inside a package directory.

### Test Coverage

Go has builtin test coverage.
To merely see the percentage of code in the current package
that is covered by tests, enter `go test -cover`.
To capture test coverage details in a file,
enter `go test -coverprofile=cover.out`.
To open an HTML presentation of this data in the default browser,
enter `go tool cover -html=cover.out`.
For example, here is a screenshot of the result if we
comment out the assertion for an empty slice in the `TestAvg` function.

![Test Coverage](go-test-coverage-html.png)

The dropdown menu in the upper left can be used to
view coverage for a different source file.
It includes the percentage of coverage for each file.

### Example Tests

The Go test tool also supports a form of tests called "examples".
These test function names must begin with "Example".
They write to stdout and provide a special comment
that describes the expected output.
Examples fail if the expected output is not produced.

Here is an example of such a test for our `Maximum` function that can be
added to `$GOPATH/src/github.com/mvolkmann/statistics/maximum_test.go`.

```go
func ExampleMax() {
  fmt.Println(Max([]float64{}))
  fmt.Println(Max([]float64{3.1}))
  fmt.Println(Max([]float64{3.1, 7.2, 5.0}))
  // Output:
  // 0
  // 3.1
  // 7.2
}
```

Test coverage for example tests is not currently tracked accurately.
For example, failing to test the empty slice case of the `Max` function
reports that none of the code in the `Max` function is covered.

While example tests are a kind of test,
their main purpose is to provide example code for using a package
in generated documentation, which is covered next.

Another form of tests is benchmark tests.
Benchmark test functions have names that begin with "Bench".
They have a single parameter of type `*testing.B`.
This parameter is a pointer to a struct with a field named `N`
that holds the number of times to run the function being benchmarked.
For example,

```go
func BenchmarkMax(b *testing.B) {
  values := []float64{3.1, 7.2, 5.0}

  for i := 0; i < b.N; i++ {
    Max(values)
  }
}
```

To run all the benchmark tests in the current directory, `go test -bench=.`.
This outputs how long it took to run each
benchmarked function a large number of times.
Assuming the functions being tested do not trigger errors,
these tests never fail.
They just provide information that can indicate performance issues.

The primary way in which benchmark tests are used
is to run them before making code changes,
save the results, make code changes,
run the benchmark tests again, and
compare these results to the previous results to
verify that the changes did not cause a performance regression. 

For more detail on Go tests, see <https://golang.org/pkg/testing/>.

### Generate Documentation

The `go doc` and `godoc` tools generates package documentation.
They parse `.go` source files, looking for
comments that follow certain conventions.

To add documentation to any package-level declaration
(package, type, constant, variable, function, or method)
add a comment directly before it.
Godoc will render the comment to the
right of the item to which it pertains.

Paragraphs must be separated by blank lines.

When HTML documentation is generated,
URLs in documentation comments are converted to hyperlinks.

Text to be output in a monospace font, such as code examples,
should be indented farther than the other comment text.

The comment preceding a package statement can appear in any source file
for the package. If the package has more than one source file,
this comment does not need to be repeated in each of them.
One approach for multi-file packages is to create a file named `doc.go`
that only contains the package comment followed by a `package` statement.
Package comments should begin with the name of the package,
followed by a description of its purpose.

Create the file `doc.go` in the `statistics` directory
with the following content:

```go
// statistics provides functions that compute statistical values
// for a slice of float64 values.
package statistics
```

We already have good comments above the exported functions
in `average.go` and `maximum.go`.

The `go doc` command provides a quick overview of a package.
For an overview of the `statistics` package,
enter `go doc` while in the `statistics` directory
or `go doc statistics` if in another directory.
This produces the following output:

```text
package statistics // import "github.com/mvolkmann/statistics"

statistics provides functions that compute statistical values for a slice of
float64 values.

func Avg(numbers []float64) float64
func Max(numbers []float64) float64
```

This tells us how to import the package and the
purpose of the package, but does not output the function comments.

The `godoc` command produces more detailed documentation.
Enter `godoc` followed by a package path.
This can also be used to view documentation on standard library packages.

In addition to specifying a package name, a name the package exports
can be specified to limit the output to just that documentation.
For example, the standard library package "strings" exports a "Join" function.
To see its documentation, enter `godoc strings Join`.

To see documentation for our "statistics" package,
enter `godoc github.com/mvolkmann/statistics`
which produces the following output:

```text
PACKAGE DOCUMENTATION

package statistics
    import "github.com/mvolkmann/statistics"

    statistics provides functions that compute statistical values for a
    slice of float64 values.

FUNCTIONS

func Avg(numbers []float64) float64
    Avg returns the average of slice of float64 values.

func Max(numbers []float64) float64
    Max returns the maximum of slice of float64 values.
```

To browse an HTML version of this documentation,
enter `godoc -http=:1234` where 1234 is a port number.
Any available, non-privileged port can be used.
Browse localhost:1234 to see a local version
of all the official Go documentation
combined with documentation for your packages.
To see documentation for the `statistics` package,
press the "Packages" button at the top,
search the page for "statistics", and click that link.
The following will be displayed:

![Statistics Package Doc](go-statistics-pkg-doc.png)
![Statistics Package Functions](go-statistics-pkg-functions.png)

To see example code for the `Max` function and its output
expand the "Example" section at the bottom of its documentation.

![Statistics Package Example](go-statistics-pkg-example.png)

### Use Package

Now we're ready to use the statistics package
in our application.
Edit `$GOPATH/src/github.com/mvolkmann/hello/main.go`.
Change the import statement to the following.

```go
import (
  "fmt"
  "github.com/mvolkmann/statistics"
)
```

Add the following to the `main` function.

```go
  numbers := []float64{1, 2, 7}
  fmt.Println("maximum =", statistics.Max(numbers))
  fmt.Println("average =", statistics.Avg(numbers))
```

Run the code by entering `go run main.go` from the `hello` directory
and verify that the correct output is produced.

### Community packages

Using community packages is similar to using our own custom packages.
They just need to be installed.

For example, to install the package "github.com/ttacon/chalk",
enter `go get github.com/ttacon/chalk`.
This package is similar to the Node package "chalk"
which outputs ANSI escape sequences to color and style text
that is written to the terminal.
Installing this will add the source files for the package
in the appropriate directory below `$GOPATH/src` and
install it by building a `.a` object file under `$GOPATH/pkg`.

To use this package in our "hello" app, edit `main.go`,
add an import for this package,
and add the following in the `main` function.

```go
  fmt.Printf("%s%s%s\n", chalk.Magenta, "So pretty!", chalk.Reset)

  red := chalk.Red.Color
  yellow := chalk.Yellow.Color
  blue := chalk.Blue.Color
  fmt.Println(red("Hello,"), yellow("my name is"), blue("Mark!"), chalk.Reset)
```

### Publish Package or App to GitHub

TODO: Add this section!!!
