# Go

This article is the first in a multi-part series on the Go programming language.
It provides an overview of the language and a quick start guide.
Future articles will cover Go syntax in depth, builtins,
tooling, concurrency, solutions to common tasks, reflection,
modules, testing, and the future of Go.

## Overview

Go is an open-source programming language. It runs on
Unix-based operating systems (including Linux and macOS) and Windows.
Documentation, downloads, and a blog can be found at <https://golang.org/>.

Go was conceived in 2007 by Robert Griesemer, Rob Pike, and Ken Thompson,
all working at Google.
About a year later Russ Cox and Ian Taylor joined the team.
All of the core team members have made
major contributions to important software projects.

| Team Member     | Major Contributions Before Go                                                                               |
| --------------- | ----------------------------------------------------------------------------------------------------------- |
| Robert Griesmer | Strongtalk (Smalltalk with optional types),<br>Java Hotspot virtual machine,<br>V8 JavaScript engine        |
| Rob Pike        | Unix, Plan 9 distributed operating system,<br>co-inventor of UTF-8 Unicode encoding                         |
| Ken Thompson    | Unix (designed and implemented),<br>B language (led to C), Plan 9,<br>co-inventor of UTF-8 Unicode encoding |
| Russ Cox        | Plan 9                                                                                                      |
| Ian Taylor      | GCC compiler                                                                                                |

To get a sense of the timeline for Go,
it is useful to see some key dates.

| Date           | Event                   |
| -------------- | ----------------------- |
| September 2007 | work on Go begins       |
| November 2009  | Go officially announced |
| March 2012     | Go 1.0 released         |
| February 2016  | Go 1.10 released        |
| August 2018    | Go 1.11 released        |

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
exceptions, and generic types.
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
- communication between goroutines using "channels"
- object-oriented programming through structs and other types
  with methods
- a standard library that supports many common operations including
  text processing, I/O, networking, cryptography, and more
- compiles quickly to native executables and libraries,
  not code that requires a virtual machine
- for applications, produces a single file to be deployed
  which is easier than working with archives that contain
  many files and require additional software to run,
  for example, Java WAR files and servers such as Tomcat
- high performance

## Not Included

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

## Reasons To Avoid Go

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

## Important Environment Variables

- `GOPATH`\
  Set this to the current workspace directory
  which is where source files are located.
  Change this when switching workspaces.
  When not set, `$HOME/go` is used.
- `GOBIN`\
  Set this to the directory where packages should be installed.
  When not set, packages are installed in `$GOPATH/bin`.
- `GOARCH`\
  Set this to the target architecture to use when compiling.
  When not set, the current architecture is assumed.
- `GOOS`\
  Set this to the operating system to be targeted by the Go compiler.
  When not set, the current operating system is assumed.

## Companies Using Go

A long list of companies currently using Go is maintained at
<https://github.com/golang/go/wiki/GoUsers>. The list includes:

Adobe, AgileBits (1Password), BBC, Bitbucket, CircleCI, CloudFlare,
Cloud Foundry, Comcast, Dell, DigitalOcean, Docker, Dropbox, eBay,
Facebook, General Electric, GitHub, GitLab, Google, Heroku, Honeywell,
IBM, Intel, Lyft, Medium, Mesosphere, MongoDB, Mozilla, Netflix,
New York Times, Oracle, Pinterest, Pivotal, Rackspace, Reddit,
Riot Games, Shutterfly, Slack, Square, Stripe, Tumblr, Twitch, Twitter,
Uber, VMware, and Yahoo

## Implemented in Go

The following applications and libraries are some of
the more popular ones that have been implemented in Go.

- **Bolt** <https://github.com/boltdb/bolt>\
  "An embedded key/value database for Go."
- **Buffalo** <https://gobuffalo.io/en>\
  "Buffalo is a Go web development eco-system.
  Designed to make the life of a Go web developer easier.

  Buffalo starts by generating a web project for you that
  already has everything from front-end (JavaScript, SCSS, etc...)
  to back-end (database, routing, etc...) already hooked up
  and ready to run. From there it provides easy APIs to
  build your web application quickly in Go."

- **CockroachDB** <https://www.cockroachlabs.com>\
  "the open source, cloud-native SQL database"
- **Docker** <https://www.docker.com/>\
  assembles container-based systems
  (open source version is now called "Moby")
- **InfluxDB** <https://github.com/influxdata/influxdb>\
  scalable datastore for metrics, events, and real-time analytics
- **Istio** <https://istio.io/>\
  connect, secure, control, and observe services
- **Kubernetes** <http://kubernetes.io>\
  "an open-source system for automating deployment, scaling,
  and management of containerized applications"
- **mongo-go-driver** <https://github.com/mongodb/mongo-go-driver>\
  "MongoDB Driver for Go"
- **Revel** <https://github.com/revel/revel>\
  full-stack web framework
- **Testify** <https://github.com/stretchr/testify>\
  "A toolkit with common assertions and mocks
  that plays nicely with the standard library"

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

## Resources

There are many Go resources on the web,
but the following are some of the most important.
They are listed roughly in the order they should be visited.

- "A Tour of Go": <https://tour.golang.org/>
  - built on "The Go Playground"
  - can use on web or download and run locally
  - when used on web
    - uploads code to golang.org servers, builds it, runs it, and displays result
    - uses latest stable version of Go
- "The Go Playground": <https://play.golang.org/>
  - can enter and test code online
  - can share code with others, but not sure how long they are retained
- "The Go Play Space" at <https://goplay.space/>
  - a better alternative to "The Go Playground"
  - provides syntax highlighting, configurable indentation,
    use of Fira Code font, auto-indenting, help on double-click,
    ability to highlight lines (useful when sharing snippets),
    and more
- "How to Write Go Code": <https://golang.org/doc/code.html>
  - "demonstrates the development of a simple Go package and introduces the go tool"
- "Effective Go": <https://golang.org/doc/effective_go.html>
  - free, online "book"
- "The Go Programming Language Specification": <https://golang.org/ref/spec>
- golang.org articles: <https://golang.org/doc/#articles>
  - a curated list of articles about Go
- GoDoc: <https://godoc.org>
  - "hosts documentation for Go packages on Bitbucket, GitHub,
    Launchpad and Google Project Hosting"
  - can search for packages by import path or keyword and see their documentation
- Awesome Go: <https://awesome-go.com>
  - "A curated list of awesome Go frameworks, libraries and software"
- Go Walkthrough: <https://medium.com/go-walkthrough>
  - "A series of walkthroughs to help you understand the Go standard library better"
  - seems to have stopped after seven, with the last in September 2016
- Gophers Slack channel: <https://invite.slack.golangbridge.org/>
- #go-nuts channel on the Freenode IRC server
  - for real-time help
- Go Nuts mailing list: <https://groups.google.com/forum/#!forum/golang-nuts>
  - official mailing list
- golang-announce mailing list:
  <https://groups.google.com/forum/#!forum/golang-announce>
  - subscribe to receive emails about major events in Go such as new releases
- "Go Time" podcast: <https://changelog.com/gotime>
- Golang Weekly: <https://golangweekly.com/>
  - "a weekly newsletter about the Go programming language"
- GopherCon 2015: Robert Griesemer - The Evolution of Go:
  <https://www.youtube.com/watch?v=0ReKdcpNyQg>
