## Tests

Tests should be implemented in files whose name ends with `_test.go`.
These files should import the "testing" package from the standard library.

It is recommended to put tests a package whose name
starts with the name of the package being tested
and ends with "_test".  Doing this requires the test
to call the functions being tested in the same way
as real code because the package being tested must be imported
and the functions must be called using the package name.

Write test functions whose names begin with `Test`.
These functions take one argument, `t \*testing.T`.

If a test assertion fails, call
`t.Error(message)` or `t.Errorf(formatString, values)`.
Another option is to call `t.Fail()`, but that fails with no message.

To log a message in a test, call `t.Log(message)`.

Here is an example of Go code to be tested
in the file `src/github.com/mvolkmann/statistics/sum.go`.

```go
package statistics

func Sum(numbers []float64) float64 {
  sum := 0
  for _, number := range numbers {
    sum += number
  }
  return sum
}
```

Here is an example of a test for the "statistics" package
in the file `src/statistics_test.go`.

```go
package statistics_test

import (
  "fmt"
  "testing"

  "github.com/mvolkmann/statistics"
)

func TestSum(t *testing.T) {
  nums := []float64{1, 2, 3}
  sum := statistics.Sum(nums)
  if (sum != 6) {
    t.Error("expected sum to be 6")
  }
}
```

To run tests, enter `go test` in the directory of the tests.

"Examples" are another way to write test functions.
It is recommended to place these tests
in a file named `example_test.go`.
Example function names begin with `Example`,
followed by the name of the function or type being tested.
When testing a method, end the function name with
the type name followed by an underscore and the method name.
Example functions end with the comment `// Output:`
followed by comment lines containing the expected output.

Here is an example of an example that can be added
in the file `src/statistics_test.go`.

```go
  func ExampleSum() {
    nums := []float64{1, 2, 3}
    fmt.Println("sum is", Sum(nums))
    // Output:
    // sum is 6
  }
```

Examples are more than just another way to write tests.
The "godoc" tool incorporates them into its output.
There are two modes for using this tool, command-line and web server.

For command-line usage, enter `godoc pkg-name [symbol-names]`.
For example, to get documentation on all exported symbols
in the `strings` package, enter `godoc strings`.
To get documentation for only the `Contains` and `Join` functions,
enter `godoc strings Contains Join`.
To include example code in the output (if provided), add the `-ex` option

For web server usage, enter `godoc -http=:port`.
For example, enter `godoc -http=:1234` and browse `localhost:1234`.
This will provide a locally running version of all the standard Go help,
including help on all standard library packages,
community packages that have been installed,
all local packages you have created.

For packages with example tests, an "Example" link
will be rendered.  When clicked, example code is displayed.

![Example screenshot](/images/statistics-sum-example.png)

To enable running example code from the godoc web UI,
include the `-play` option.  This will cause example code
to be rendered in a playground that includes a "Run" button.
TODO: Why does this only work for standard library packages?
TODO: It doesn't work for github.com/mvolkmann/statistics/Sum.

To index all the code so it is searchable using the
"Search" input in the web UI, include the `-index` option.
This takes quite a while to build the index,
so your code will not be searchable for several minutes.

Also see "benchmark" tests which are only run when the `-bench` flag is used.
TODO: Add more detail on these!
