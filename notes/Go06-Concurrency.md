## Concurrency

Concurrency in Go is primarily supported by four features,
see Goroutines, Channels, the `select` statement, and Mutexes.

### Goroutines

The name "goroutine" is a play on "coroutine" which is described
in Wikipedia at <https://en.wikipedia.org/wiki/Coroutine>.
A goroutine is a lightweight thread of execution
managed by the Go runtime that runs a specific function call.
Each goroutine consumes about 2K of memory compared to 1MB for a Java thread.
They use more memory only when needed.

Goroutines start up faster than threads.
They not mapped one-to-one with threads, but are multiplexed across them.

A goroutine runs until its function exits or the application terminates.

The `main` function of an application runs in a goroutine,
so there is always at least one.

To create a new goroutine, proceed any function call,
named or anonymous, with `go`.
Arguments to the function are evaluated in the current goroutine.
The function is executed asynchronously inside the new goroutine
when it is scheduled to run in a thread.
When a function is called without using `go` the call is synchronous.

To get the number of currently running goroutines,
call `runtime.NumGoRoutine()`.

To get the number of CPUs in the computer, call `runtime.NumCPU()`.
This may be useful to decide at runtime how many goroutines to start.

Goroutines share memory, so access should be synchronized
either by using channels or mutexes.

Often when writing code that demonstrates goroutines
it is useful to pause their execution for a given duration
to simulate a long-running process.
The standard library package `time` can be used to do this.
`time.Sleep(duration)` pauses the current goroutine for the given duration
where duration is in nanoseconds (1 nanosecond = 1,000,000 milliseconds).

### Channels

Channels are "pipes" that allow concurrent goroutines to communicate.
Values can be sent to a channel and be received from them.

To create a channel, use the builtin `make` function.
For example, `myChannel := make(chan string)` creates a channel
for sending and receiving strings. Non-primitive types
such as structs, slices, and maps can also be used.

Channels that are created without specifying a size are "unbuffered".
Later we will see how to make them buffered.

To send a value to a channel, `myChannel <- value`.
If the channel is unbuffered, this blocks
until another goroutine receives the value.

To receive a value from a channel, `value := <-channel`.
If the channel is unbuffered, this blocks
until another goroutine sends a value to the channel.

A channel can be closed by passing it to the `close` function.
Only "sending" goroutines that are the only goroutine
that sends to a channel should close it.

When reading from a channel, a second return value
indicates whether the channel is still open.
For example, `data, open = <-myChannel`.
See <https://go101.org/article/channel-closing.html>
for details and more options.

Once a channel has been closed, a panic will be triggered
if there is an attempt to send to it or close it again.
Attempts to receive data from a closed channel will get the zero value,
but it is recommended to check whether the channel is closed
since it is not possible to distinguish between getting a zero value
because the channel is closed versus getting a zero value
that was actually sent to the channel.

Receivers can determine if a channel is closed
by capturing a second return value that is a boolean
indicating whether the channel is open.
For example,

```go
package main

import "fmt"

func getNumbers(start int, c chan<- int) {
  for n := start; n < 10; n += 2 {
    c <- n
  }
  close(c)
}

func main() {
  c1 := make(chan int)
  c2 := make(chan int)

  go getNumbers(1, c1) // odd numbers
  go getNumbers(2, c2) // even numbers

  n := 0
  moreEvens, moreOdds := true, true

  for {
    select {
    case n, moreOdds = <-c1:
      if moreOdds {
        fmt.Println(n, moreOdds)
      }
    case n, moreEvens = <-c2:
      if moreEvens {
        fmt.Println(n, moreEvens)
      }
    }
    if !moreEvens && !moreOdds {
      break
    }
  }
}
```

Attempts to send data to or retrieve data from a nil channel
will block forever.

### Channel Direction

The type `chan` can be used to both send and receive values.
When a channel is passed to a function,
the argument type can state that the function
will only write to or read from the channel.
To only write, use `chan<- type`.
To only read, use `<-chan type`.
Functions that accept a read-only or write-only channel
can be passed a read/write channel.
But functions that accept a read/write channel
cannot be passed a read-only or write-only channel.

For example,

```go
package main

import "fmt"

func writer(c chan<- int) { // only writes
  c <- 2
  c <- 7
}

func reader(c <-chan int) { // only reads
  n := <-c
  fmt.Println("got", n)
  n = <-c
  fmt.Println("got", n)
}

func main() {
  c := make(chan int) // works buffered or not
  go writer(c) // runs in a new goroutine
  reader(c) // runs in current goroutine
}
```

### Buffered Channels

Buffered channels allow multiple values to be
sent to or received from a channel without blocking.

To create a buffered channel, pass a size
as the second argument to the `make` function.
For example, `myChannel := make(chan string, 5)`
creates a channel that can hold up to 5 unread strings.
There is no builtin way to create a buffered channel
with an unlimited capacity.

Sending to a buffered channel only blocks if the channel is full.
Receiving from a buffered channel only blocks if the channel is empty.

A `for` loop can be used to iterate over the values in a channel
that is closed after the last value is sent to it.
For example,

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

It is sometimes useful to use use a non-data channel
to synchronize goroutine execution.
This is particularly the case when
a receiving goroutine receives data from multiple channels
and one or more of them is able to determine
when the receiving goroutine should stop
trying to receive data from any of them.

Here is a simple example that demonstrates this approach
with only a single sending goroutine:

```go
import "time"

func myAsync(done chan<- bool) { // can send, but not receive
  // Do some asynchronous thing.
  time.Sleep(time.Second * 3)
  // When it completes, signal to the goroutine that started this one.
  done <- true
}

done := make(chan bool, 1)
go myAsync(done)
<-done // Waits for myAsync to single that it is finished.
```

### `select` statement

The `select` statement attempts to receive data
from one of a number of channels.
It is frequent used inside a `for` loop
so multiple values from each channel can be read.

If multiple channels are ready, one is chosen randomly and read.

If none of the channels are ready, there are two possibilities.
If a `default` block is present, that code will run.
If no `default` block is present, the `select` blocks
until one of the channels is ready.

When using `break` in a `select` `case` that is inside a `for` loop,
to jump out of the loop add a label before the loop and `break` to it.
Alternatively use `return` to exit the containing function.

For example,

```go
package main

import (
  "fmt"
  "time"
)

func finite() {
  c1 := make(chan string)
  c2 := make(chan string)

  go func() {
    time.Sleep(1 * time.Second)
    c1 <- "one"
  }() // calling the function
  go func() {
    time.Sleep(2 * time.Second)
    c2 <- "two"
  }() // calling the function

  for i := 0; i < 2; i++ { // only expecting one message from each channel
    select {
    case msg1 := <-c1:
      fmt.Println("received", msg1)
    case msg2 := <-c2:
      fmt.Println("received", msg2)
    }
  }
}

func numbers(c chan int, start int, delta int, sleep int) {
  n := start
  for {
    time.Sleep(time.Duration(sleep) * time.Second)
    c <- n
    n += delta
  }
}

func infinite() {
  c1 := make(chan int)
  c2 := make(chan int)
  go numbers(c1, 1, 2, 1)
  go numbers(c2, 2, 2, 2)

loop:
  for { // expecting an infinite number of messages from each channel
    select {
    case n := <-c1:
      if n > 10 {
        break loop
      }
      fmt.Println("received", n)
    case n := <-c2:
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

### Mutexes

The `sync` package defines the `Mutex` and `WaitGroup` structs.
Using a `Mutex` is one way to prevent concurrent access
to shared data from multiple goroutines.

To create a mutex, declare a variable of type `sync.Mutex`.
For example, `var myMutex sync.Mutex`.
Often mutexes are held in the field of a struct
that requires exclusive access.

To lock a mutex, `myMutex.Lock`.

To unlock a mutex, `myMutex.Unlock`.

A `WaitGroup` can be used to wait for multiple goroutines to complete.
To create a WaitGroup, declare a variable of type `sync.WaitGroup`.
For example, `var wg sync.WaitGroup`.

To increment the number of items in a WaitGroup, `wg.Add(n)`.
Call this repeatedly to add more if necessary.

To mark a `WaitGroup` item as done, `wg.Done()`.

To wait for all items in a WaitGroup to be done, `wg.Wait()`.
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

func addString(s string) {
  mutex.Lock() // prevent concurrent access to the slice

  // Generate a random duration from zero to 500 milliseconds.
  duration := time.Duration(rand.Int63n(500)) * time.Millisecond
  fmt.Println("duration =", duration)
  time.Sleep(duration)

  slice = append(slice, s)
  fmt.Println("appended", s)

  mutex.Unlock() // finished using slice
}

// This adds a string to the slice a given number of times.
func addStrings(s string, count int) {
  for n := 0; n < count; n++ {
    addString(s)
  }
  wg.Done() // mark this goroutine as done
}

func main() {
  wg.Add(2) // we will create two new goroutines
  go addStrings("X", 5) // starts first goroutine
  go addStrings("O", 3) // starts second goroutine
  wg.Wait() // wait for the two goroutines to be done
  fmt.Printf("%v\n", slice)
}
```
