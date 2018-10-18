# Go

This article is the first in a multi-part series on the Go programming language.
It provides an overview of the language and a quick start guide.
Future articles will cover Go syntax in depth, tooling,
builtins, concurrency, solutions to common tasks, reflection,
modules, testing, and the future of Go.

## Overview

Go is an open-source programming language. It runs on
Unix-based operating systems (including Linux and macOS) and Windows.
Documentation, downloads, and a blog can be found at <https://golang.org/>.

Go was conceived by Robert Griesemer, Rob Pike, and Ken Thompson,
all working at Google, starting in September 2007.
About a year later Russ Cox and Ian Taylor joined the team.

Robert Griesemer previously worked on Strongtalk (Smalltalk with optional types),
the Java Hotspot virtual machine, and the V8 JavaScript engine.
Rob Pike previously worked on Unix and the Plan 9 distributed operating system.
Ken Thompson previously worked on Unix,
the B language (which led to C), and Plan 9.
Rob Pike and Ken Thompson invented the UTF-8 Unicode encoding.
Russ Cox previously worked on Plan 9.
Ian Taylor previously worked on the GCC compiler.

To get a sense of the timeline for Go,
it is useful to see some key dates.
Go was officially announced in November 2009.
Go 1.0 was released in March 2012.
Go 1.10 was released in February 2016.
Go 1.11, the latest version, was released in August 2018.

Many of Go's goals are in comparison to languages like C++ and Java.
Go aims to:

- address software issues at Google
- be simple, indicated by having a small specification
  and fewer features that most programming languages
- be very easy to read
- enable faster software development
- enable faster build times
- have a less cumbersome type system that provides type inference
- use composition instead of type hierarchies
- provide garbage collection
- be safe in terms of memory utilization
- support concurrent execution and communication
- support parallel computation, taking advantage of multi-core computers
- enable easier dependency analysis
- make it easier to write tools that analyze and process the code

Because simplicity and performance are major goals,
many features found in other programming languages
are not present in Go.
These include classes, inheritance, annotations,
exceptions, the ternary operator, and generic types.
Generic types are being considered for Go 2.0.

Go is compiled to platform-specific machine code,
not bytecode for a virtual machine
that must be interpreted at runtime.

Go occupies a space between between languages that are
often used for systems programming (C, C++, and Rust) and
scripting languages (JavaScript, Perl, Python, and Ruby).

Currently the most common uses for Go are DevOps tooling
and server-side web application development,
including implementing REST services.

The primary Go compiler and runtime are implemented in
a combination of Go and assembler.

## Go Lineage

Many previous programming languages inspired the design of Go.

![Go Lineage](go-lineage.png)

## Characteristics

Go's characteristics at a glance include:

- a relatively small language that is easy to learn
  (the May 9, 2018 spec. is only 78 pages)
- statically typed which catches many errors at compile-time
- type inference
- garbage collection of variables that are no longer reachable
- Unicode support
- concurrency with lightweight threads called "goroutines"
- communication between goroutines using channels
- object-oriented programming through structs with methods
- a fairly comprehensive standard library
  that supports many common operations including
  text processing, I/O, networking, cryptography, and more
- compiles quickly to native executables and libraries,
  not code that requires a virtual machine
- high performance

# Not Included

Go purposely omits many features found in other programming languages
in order to arrive at a simpler programming language.
These include:

- ternary operator
- implicit type coercions
- default parameters
- constructors and destructors
- type inheritance
- operator overloading
- pointer arithmetic
- exceptions
- generics
- macros
- annotations
- thread-local storage

## Reasons to avoid Go

Reasons some developers choose not to use Go include:

- Some developers dislike the community standards for Go
  such as using gofmt to format code.
- Go does not currently support generic types which
  precludes some aspects of functional programming.

Additional reasons related to systems programming include:

- Some developers feel that C and C++ libraries are
  currently more mature than Go libraries.
- Currently it is easier to find developers that have
  C and C++ experience than to find Go developers.
- Go provides garbage collection and does not allow control of
  memory allocation/deallocation that is needed for real-time guarantees.
- Go does not support pointer arithmetic
  which is needed for some types of applications.

## Memory Allocation

The Go specification does not indicate the situations
under which stack memory or heap memory are used.
The primary Go implementation makes some choices based on the fact that
allocating on the stack is generally faster than allocation on the heap.

The builtin `new` function always allocates on the heap.

Variables declared in functions are typically allocated on the stack
unless access to them escapes from the function
by returning a pointer to it or setting a variable
declared outside the function to a pointer to it.

## Important Environment Variables

- `GOARCH`\
  Set this to the target architecture to use when compiling.
  When not set, the current architecture is assumed.
- `GOBIN`\
  Set this to the directory where packages should be installed.
  TODO: What happens when this is not set?
- `GOOS`\
  Set this to the operating system to be targeted by the Go compiler.
  When not set, the current operating system is assumed.
- `GOPATH`\
  Set this to the current workspace directory
  which is where source files are located.
  Change this when switching workspaces.
  This is not needed when "modules" (introduced in Go 1.11) are used.
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
- InfluxDB - scalable datastore for metrics, events, and real-time analytics
  <https://github.com/influxdata/influxdb>
- Istio - connect, secure, control, and observe services
  <https://istio.io/>
- Kubernetes - production-grade container scheduling and management
  <http://kubernetes.io>
- Revel - full-stack web framework <https://github.com/revel/revel>

## Alternative Go Implementations

Besides the primary Go implementation at <https://golang.org/>,
there are several alternative implementations. These include:

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
