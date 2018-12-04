# Go For It! Part 4

This article is the fourth in a multi-part series on the Go programming language.
It provides details on concurrency in Go.

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

Future articles will cover solutions to common tasks,
reflection, modules, testing, and the future of Go.

## Concurrency

In parallel computing, a task is divided into subtasks
that are processed at the same time.
When these complete, their results are combined.

In concurrent computing, multiple unrelated tasks
are processed at the same time.
These may communicate with each other during execution.

This article focuses on concurrent computing.

Concurrency in Go is primarily supported by four features,
see Goroutines, Channels, the `select` statement, and Mutexes.

### Goroutines

The name "goroutine" is a play on "coroutine" which is described
in Wikipedia at <https://en.wikipedia.org/wiki/Coroutine>.

A goroutine is a lightweight thread of execution
managed by the Go runtime that runs a specific function call.
Each goroutine consumes about 2K of memory compared to 1MB for a Java thread.
They use more memory only when when needed.

Goroutines start up faster than threads.
They are not mapped one-to-one with threads,
but are multiplexed across them.

A goroutine runs until its function exits or the application terminates.

The `main` function of an application runs in a goroutine,
so there is always at least one.

Function calls without the `go` keyword
run synchronously in the current goroutine.

To create a new goroutine, precede any function call with the `go` keyword.
This works with both named and anonymous functions.
Arguments to the function are evaluated in the current goroutine.
The function is executed asynchronously in the new goroutine
when it is scheduled to run in a thread.

To get the number of currently running goroutines,
call `runtime.NumGoRoutine()`.

To get the number of CPUs in the computer, call `runtime.NumCPU()`.
This may be useful to decide at runtime how many goroutines to start.

Goroutines share memory, so access should be synchronized
either by using channels or mutexes. Each is described ahead.

Often when writing code that demonstrates goroutines
it is useful to pause their execution for a given duration
to simulate a long-running process.
The standard library package `time` can be used to do this.
`time.Sleep(duration)` pauses the current goroutine for the given duration
where duration is in nanoseconds (1 nanosecond = 1,000,000 milliseconds).

### Channels

#### Channels Overview

Channels are "pipes" that allow concurrent goroutines to communicate.
Values can be sent to a channel and can be received from one.

To create a channel, use the builtin `make` function.
For example, `myChannel := make(chan string)` creates a channel
for sending and receiving strings. Non-primitive types
such as slices, structs, and maps can also be used.

Channels that are created without specifying a size are "unbuffered".
Later we will see how to make them buffered.

To send a value to a channel, `myChannel <- value`.
If the channel is unbuffered, this blocks
until another goroutine receives the value.

To receive a value from a channel, `value := <-channel`.
If the channel is unbuffered, this blocks
until another goroutine sends a value to the channel.

A channel can be closed by passing it to the `close` function.
This should only be done from a "sending" goroutine
that is the only goroutine that sends to a channel.

When reading from a channel, a second return value
indicates whether the channel is still open.
For example, `data, open = <-myChannel`.
See <https://go101.org/article/channel-closing.html>
for details and more options.

Once a channel has been closed, a panic will be triggered
if there is an attempt to send to it or close it again.
Attempts to receive data from a closed channel will get the zero value.
It is recommended to check whether the channel is closed
since it is not possible to distinguish between
getting a zero value because the channel is closed versus
getting a zero value that was actually sent to the channel.

Attempts to send data to or retrieve data from a nil channel
will block forever.

The following code demonstrates the use of channels
by using two that send sequences of numbers.
It prints all the numbers received and
exits once both channels are closed.
The `switch` statement is used to read from multiple channels.
This is described in more detail later.

```go
package main

import "fmt"

func getNumbers(min, max, delta int, c chan<- int) {
  for n := min; n < max; n += delta {
    c <- n
  }
  close(c)
}

func main() {
  c1 := make(chan int)
  c2 := make(chan int)

  go getNumbers(1, 10, 2, c1) // odd numbers
  go getNumbers(2, 10, 2, c2) // even numbers

  n := 0
  moreEvens, moreOdds := true, true // TODO: Is there any reason to initialize these?

  for {
    select {
    case n, moreOdds = <-c1:
      if moreOdds {
        fmt.Println(n)
      }
    case n, moreEvens = <-c2:
      if moreEvens {
        fmt.Println(n)
      }
    }
    if !moreEvens && !moreOdds {
      break
    }
  }
}
```

#### Channel Direction

The type `chan` represents a channel.

When a channel is passed to a function,
the argument type can state that the function
will only send to or receive from the channel.
To only send, use `chan<- type`.
To only receive, use `<-chan type`.

Functions that accept a read-only or write-only channel
can be passed a read/write channel.
But functions that accept a read/write channel
cannot be passed a read-only or write-only channel.

For example:

```go
package main

import "fmt"

func sender(c chan<- int) { // only writes
  c <- 2
  c <- 7
}

func receiver(c <-chan int) { // only reads
  n := <-c
  fmt.Println("got", n)
  n = <-c
  fmt.Println("got", n)
}

func main() {
  c := make(chan int) // could also use a buffered channel
  go sender(c) // runs in a new goroutine
  receiver(c) // runs in the current goroutine
}
```

#### Buffered Channels

Buffered channels allow multiple values to be
sent to or received from a channel without blocking.

To create a buffered channel, pass a size
as the second argument to the `make` function.
For example, `myChannel := make(chan string, 5)`
creates a channel that can hold up to 5 unread strings.

There is no builtin way to create a
buffered channel with an unlimited capacity.
Implementing this is non-trivial, but has been done.
See <https://medium.com/capital-one-tech/building-an-unbounded-channel-in-go-789e175cd2cd>.

Sending to a buffered channel only blocks if the channel is full.

Receiving from a buffered channel only blocks if the channel is empty.

A `for` loop can be used to iterate over the values in a channel
that is closed after the last value is sent to it.
For example:

```go
package main

import "fmt"

func getWords(c chan string) {
  c <- "alpha"
  c <- "beta"
  c <- "gamma"
  close(c)
}

func main() {
  c := make(chan string)
  go getWords(c)
  // This loop terminates when the channel is closed
  // without explicitly checking for that.
  for word := range c {
    fmt.Println(word)
  }
}
```

It is sometimes useful to use use a channel
to which no useful data will be sent
just to synchronize goroutine execution.
This is particularly the case when
a receiving goroutine receives data from multiple channels
and one or more of them is able to determine
when the receiving goroutine should stop
trying to receive data from any of them.

Here is an example that demonstrates this approach:

```go
package main

import (
  "fmt"
  "math/rand"
  "time"
)

// Sends random integers from 1 to 10 to the "numbers" channel
// and sends true to the "done" channel when zero is generated.
func myAsync(numbers chan<- int, done chan<- bool) {
  for {
    n := rand.Intn(11) // 0 to 10
    if n == 0 {
      done <- true
      break
    } else {
      numbers <- n
    }
  }
}

func main() {
  // Seed random number generation based on the current time.
  rand.Seed(int64(time.Now().Nanosecond()))

  // Create all the channels to be used.
  numbers1 := make(chan int)
  numbers2 := make(chan int)
  done := make(chan bool)

  // Start two goroutines to generate random numbers.
  go myAsync(numbers1, done)
  go myAsync(numbers2, done)

  // Print the random numbers as they arrive.
loop:
  for {
    select {
    case n := <-numbers1:
      fmt.Println("from first,", n)
    case n := <-numbers2:
      fmt.Println("from second,", n)
    case <-done:
      break loop // without label, just breaks from select
    }
  }
  fmt.Println("done")
}
```

Another way to implement the previous example is to
remove the `done` channel parameter from the `myAsync` function
and change it to close the `numbers` channel when zero is generated.
The `main` function could check for the `number1` and `number2` channels
to be closed and break out of the `for` loop when that happens.

#### `select` statement

The `select` statement attempts to receive data
from one of a number of channels.
It is frequently used inside a `for` loop
so multiple values from each channel can be received.

If multiple channels are ready, one is
chosen randomly and a value is received from it.

If none of the channels are ready, there are two possibilities.
If no `default` block is present, the `select` blocks
until one of the channels is ready.
If a `default` block is present, that code will run.
TODO: Then does it block until a channel os ready?

When using `break` in a `select` `case` that is
inside a `for` loop, to jump out of the loop
add a label before the loop and `break` to it.
Alternatively, use `return` to exit the containing function.

The following code demonstrates two uses of the `select` statement.
One works with channels that are sent a finite number of values.
The other works with channels that are sent infinite numbers of values.

```go
package main

import (
  "fmt"
  "time"
)

// finite manages two channels that
// send finite sequences of strings.
func finite() {
  c1 := make(chan string)
  c2 := make(chan string)

  go func() {
    time.Sleep(1 * time.Second)
    c1 <- "one"
  }() // calls the anonymous function

  go func() {
    time.Sleep(2 * time.Second)
    c2 <- "two"
  }() // calls the anonymous function

  // Only expecting one message from each channel.
  for i := 0; i < 2; i++ {
    select {
    case msg1 := <-c1:
      fmt.Println("received", msg1)
    case msg2 := <-c2:
      fmt.Println("received", msg2)
    }
  }
}

// numbers sends a sequence of int values to a given channel.
// It starts at and increments by given int values.
// It sleeps for a given number of seconds before sending each value.
func numbers(c chan int, start int, delta int, sleep int) {
  n := start
  for {
    time.Sleep(time.Duration(sleep) * time.Second)
    c <- n
    n += delta
  }
}

// infinite manages two channels that
// send infinite sequences of numbers.
func infinite() {
  c1 := make(chan int)
  c2 := make(chan int)
  go numbers(c1, 1, 2, 1) // odd numbers
  go numbers(c2, 2, 2, 2) // even numbers

loop:
  for { // expecting an infinite number of messages from each channel
    select {
    case n := <-c1: // odd numbers
      if n > 10 {
        break loop
      }
      fmt.Println("received", n)
    case n := <-c2: // even numbers
      if n > 10 {
        break loop
      }
      fmt.Println("received", n)
    }
  }
}

func main() {
  finite()
  infinite() // doesn't start until finite finishes
}
```

### Mutexes and WaitGroups

The `sync` standard library package defines
the `Mutex` and `WaitGroup` struct types.

Using a `Mutex` is one way to prevent concurrent access
to shared data from multiple goroutines.

To create a mutex, declare a variable of type `sync.Mutex`.
For example, `var myMutex sync.Mutex`.

Often mutexes are held in the field of a struct
that requires exclusive access.

To lock a mutex, call the `Lock` method.
For example. `myMutex.Lock`.

To unlock a mutex, call the Unlock method.
For example, `myMutex.Unlock`.

A `WaitGroup` can be used to wait for multiple goroutines to complete.
To create a `WaitGroup`, declare a variable of type `sync.WaitGroup`.
For example, `var wg sync.WaitGroup`.

To increment the number of items in a WaitGroup, `wg.Add(n)`.
This can be called repeatedly to add more.

To mark a `WaitGroup` item as done, `wg.Done()`.

To wait for all items in a WaitGroup to be done, call `wg.Wait()`.

For example,

```go
package main

import (
  "fmt"
  "math/rand"
  "sync"
  "time"
)

var mutex sync.Mutex
var slice = make([]string, 0)
var wg sync.WaitGroup

// addString adds a given string to the slice
// after a random number of milliseconds.
func addString(s string) {
  mutex.Lock() // prevent concurrent access to the slice

  // Generate a random duration from zero to 500 milliseconds.
  duration := time.Duration(rand.Int63n(500)) * time.Millisecond
  fmt.Println("duration =", duration)
  time.Sleep(duration)

  slice = append(slice, s)
  fmt.Println("appended", s)

  mutex.Unlock() // finished using the slice
}

// addString adds a string to the slice a given number of times.
func addStrings(s string, count int) {
  for n := 0; n < count; n++ {
    addString(s)
  }
  wg.Done() // mark this WaitGroup as done
}

func main() {
  wg.Add(2) // we will create two new goroutines
  go addStrings("X", 5) // starts first goroutine
  go addStrings("O", 3) // starts second goroutine
  wg.Wait() // wait for the two WaitGroups to be done
  fmt.Printf("%v\n", slice) // random X's and O's
}
```
