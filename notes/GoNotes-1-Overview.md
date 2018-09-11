## Overview

Go was conceived by Robert Griesemer, Rob Pike, and Ken Thompson,
all working at Google, starting in September 2007.
About a year later Russ Cox and Ian Taylor joined the team.

Go was officially announced in November 2009.
Go 1.0 was released in March 2012.
Go 1.10 which was released in February 2016.
Go 1.11, the latest version, was released in August 2018.

Many of Go's goals are in comparison to languages like C++ and Java.
Go aims to:

- address software issues at Google
- be simple, indicated by having a small specification
  and fewer features compared to other programming languages
- be safe in terms of memory utilization
- be very easy to read
- enable faster software development
- enable faster build times
- have a less cumbersome type system that provides type inference
  and use composition instead of type hierarchies
- provide garbage collection
- support parallel computation, taking advantage of multi-core computers
- support concurrent execution and communication
- enable easier dependency analysis
- make it easier to write tools that analyze and process the code

Because simplicity and performance are major goals,
many features found in other programming languages
are not present in Go. These include classes (and inheritance),
annotations, exceptions, the ternary operator, and generic types.
Generic types are being considered for Go 2.0.

Go is compiled to platform-specific machine code,
not bytecode for a virtual machine
that must be interpreted at runtime.

While Go can be used as a systems programming language,
currently most developers use C, C++, or Rust for that.

Go does not compete with scripting languages like
JavaScript, Perl, Python, and Ruby.

Currently the most common uses for Go are dev ops tooling
and server side web application development.

The primary Go compiler and runtime are implemented in Go and assembler.

## Go Lineage

Many previous programming languages inspired the design of Go.
![Go Lineage](go-lineage.png)

## Characteristics

Go's characteristics at a glance include:

- compiled to native binaries and libraries
- statically typed
- high performance
- provides type inference
- performs garbage collection
- supports concurrency with lightweight threads called "goroutines"
- provides communication between goroutines using channels
- supports networking operations
- minimal support for object-oriented programming
  through structs with methods

## Reasons to use Go

Some of the primary reasons developers choose to use Go include:

- Go is a relatively small language that is easy to learn
  (the May 9, 2018 spec. is only 78 pages).
- Go provides good type safety.
- Go provides excellent support for asynchronous programming
  with goroutines and channels.
- The Go standard library supports writing networking applications.
- The Go compiler is fast.
- Go generates native executables, not code that requires a virtual machine.
- Executables produced by Go have good performance.
- Go does not support pointer arithmetic and that contributes to simpler code.

## Reasons to use C/C++/Rust instead of Go

Some of the primary reasons developers choose not to use Go include:

- TODO: Is Rust mature enough to be considered along side C and C++?
- Go does not yet have a mature solution to manage
  package dependency versions for a project.
- Go does not support generic types which precludes
  some aspects of functional programming.
- Some developers feel that the C and C++ libraries are
  currently more mature than Go libraries.
- Currently it is easier to find developers that have C and C++ experience
  than finding Go developers.
- Go provides garbage collection and does not allow control of
  memory allocation/deallocation that is needed for real-time guarantees.
- Go does not support pointer arithmetic.
- Some developers object to community standards for Go
  like using gofmt to format code.

## Important Environment Variables

- `GOARCH`\
  Set this to the target architecture to use when compiling.
  When not set, the current architecture is assumed.
- `GOBIN`\
  Set this to the directory where packages should be installed.
  TODO: What happens when this is not set?
- `GOOS`\
  Set this to the target operating system to be targeted by the Go compiler.
  When not set, the current operating system is assumed.
- `GOPATH`\
  Set this to the current workspace directory
  which is where source files are located.
  Change this when switching workspaces.
- `GOROOT`\
  Set this to the directory where Go tools are installed.
  TODO: What happens when this is not set?

## Companies Using Go

A long list of companies currently using Go is maintained at
<https://github.com/golang/go/wiki/GoUsers>. The list includes:

Adobe, AgileBits (1Password), BBC, Bitbucket, CircleCI, CloudFlare,
Cloud Foundry, Comcast, Dell, DigitalOcean, Docker, Dropbox, eBay,
Facebook, General Electric, GitHub, GitLab, Google, Heroku, Honeywell,
IBM, Intel, Lyft, Medium, Mesosphere, MongoDB, Mozilla, Netflix,
New York Times, Oracle, Pinterest, Pivotal, Rackspace, Reddit,
Riot Games, Shutterfly, Slack, Square, Stripe, Tumblr, Twitch, Twitter,
Uber, VMware, Yahoo

## Implemented in Go

The following applications and libraries are some of
the more popular ones that have been implemented in Go.

- Docker - assembles container-based systems
  (open source version is now called "Moby")
- Kubernetes - production-grade container scheduling and management
  <http://kubernetes.io>
- Revel - full-stack web framework <https://github.com/revel/revel>
- InfluxDB - scalable datastore for metrics, events, and real-time analytics
  <https://github.com/influxdata/influxdb>
- TODO: Find more!

## Alternative Go Implementations

Besides the primary Go implementation at <https://golang.org/>,
there are several alternative implementations.
These include:

- gccgo <https://gcc.gnu.org/onlinedocs/gccgo/>\
  GNU compiler for Go
- GopherJS <https://github.com/gopherjs/gopherjs>\
  This compiles Go to JavaScript.
- llgo <https://github.com/go-llvm/llgo>\
  LLVM-based compiler for Go
- WASM (Web Assembly)\
  Early support is available now,
  but it is not yet ready for serious use.
  See <https://react-etc.net/entry/webassembly-support-lands-in-go-language-golang-wasm-js>
- mgo?\
  TODO: I can't find this, but heard it mentioned on "Go Time" podcast.
  Is it for small processors like Arduino?

