## Modules

Lack of support for package versioning was a major issue
before Go version 1.11. The leading contenders were
vgo from Russ Cox at <https://github.com/golang/go/wiki/vgo>
and dep from Sam Boyer at <https://golang.github.io/dep/>.

Go 1.11 includes experimental support for "modules" that is mostly based on vgo.
This eliminates the need to have code under GOPATH
and adds support for dependency versioning.

A module is defined by a directory referred to as "module root"
that contains a `go.mod` file and a set of source files.
While `go.mod` can be created and updated manually,
there is no need to do either.

The easiest way to create `go.mod` for a new module
is to cd to its module root and run `go mod init {module-name}`
where module-name is the import path other modules will use to import this one.
Typically this is a GitHub path such as `github.com/mvolkmann/my-module`,
but can be a simple name for modules that will not be published.

After running `go mod init my-simple-module`,
the content of `go.mod` will be:

```go
module my-simple-module
```

The easiest way to add dependencies to `go.mod` is to
create source files that contain `import` statements
for the dependencies and run a `go` command
such as `go build`, `go test`, `go list`, or `go vet`.
These trigger a lookup of all the dependencies.
The results are used to update `go.mod`.

### Semantic Versioning

Go modules prefer the use of semantic versioning where version numbers
have three parts referred to as major, minor, and patch.
For example, "1.2.3" represents a major version of 1,
a minor version of 2, and a patch version of 3.
The patch number is incremented when backward-compatible bug fixes are made.
The minor number is incremented when backward-compatible new features are added.
The major number is increment when incompatible changes are made.

### Simple Example

Create a new directory anywhere (except under GOPATH)
with any name and cd to the directory.
Enter `go mod init my-module`.
Note that a GitHub path is not specified because
we are not planning to share this module with others.

Create the file `main.go` with the following content:

```go
package main

import (
  "fmt"

  "github.com/ttacon/chalk"
)

func main() {
  fmt.Printf("%s%s%s\n", chalk.Magenta, "So pretty!", chalk.Reset)
}
```

The code above imports a single community package
that is not yet listed in `go.mod`.
To build this application and update `go.mod` with dependency information,
enter `go build`. This creates the executable file `my-module`.
It also adds the following to `go.mod`:

```go
require github.com/ttacon/chalk v0.0.0-20160626202418-22c06c80ed31
```

The version string that follows the dependency path will be explained later.

Running `go build` also creates the file `go.sum`
which stores checksum information for all dependencies.
See the section "Checksum" below.

### Module code layout

There is no requirement to have a `src` directory in the module root.
For simple modules, all the source files can be in the module root directory
along with the `go.mod` file.
For modules defined by a large set of source files,
the files can be organized in subdirectories as desired,
typically to indicate sets of related files.

### Dependency Source Code

The source files for dependencies are not stored in
the module root directories of modules that use them.
Instead they are stored in subdirectories of `$GOPATH/pkg/mod`.
This allows multiple modules to share them.

Multiple versions of each dependency can be stored here.
This allows the modules that depend on them to use different versions.

### Explicit Installs

It is also possible to install dependencies with `go get`.
This updates `go.mod`, but adds the comment `// indirect`
after the path for the new dependency.
This indicates that no code in the current module
has been seen yet that uses the dependency.

These "indirect" comments are removed after
uses of the dependencies are added to module source files
and a command such as `go build` is run.
Since such commands add dependencies to `go.mod` on their own
and they will be run eventually,
it is not necessary to use `go get` to install dependencies.

The primary reason to use `go get` with modules
is to specify a specific version to be installed.
Alternatively once some version is installed,
perhaps by running `go build`,
the version to use can be modified by editing `go.mod`
and running the command again.

Changing the version of a direct dependency can
change the versions of its dependencies that are used.
This is desirable since a specific version of a direct dependency
may only work with specific versions of its dependencies.

### Releasing New Module Versions

Major versions of 0 or 1 are considered unstable.
Major versions that are 2 or higher are considered stable.

To release a new unstable version of a module
it is only necessary to push changes and
add a tag following the pattern "v{major}.{minor}.{patch}".

To release a new stable version of a module (major version 2 or higher),
modify the module name in `go.mod` to end with the new major version.
For example `module github.com/mvolkmann/my-module/v2`.
Then push and tag this change along with other changes.

### Adding Tags

To add a tag from the command-line:

- enter `git tag {tag-name}`
- enter `git push origin {tag-name}`

To add a tag from the GitHub web UI:

- click the "releases" tab
- press the "Draft a new release" button
- enter the tag name
- optionally enter a title and description
- if not considered stable, check "This is a pre-release"
- press the "Publish release" button

### Importing Versions

In other modules that wish to use this module,
unstable versions can be imported without specifying the major version.
For example, `import github.com/mvolkmann/my-module`.
The latest version that is less than v2 will be used.

To use a stable version, add the major version to import paths
in all source files that import it.
For example `import github.com/mvolkmann/my-module/v2`.
Note that only the major version is specified,
not the minor or patch version.
This is referred to as "semantic import versioning".
Presumably there will be tooling to automate this in the future
so it is not necessary to manually update multiple source files.

Since each version is stored separately, it is possible to use
multiple major versions of a dependency in the same application.

### Versions Used

The actual versions of dependencies that are used
is determined by what is found in `go.mod`.
There are several ways to specify a version, called "module queries".
To add a module query to a `require` path,
add a space and one of the following after the path.

| Module Query Type    | Example   | Notes                     |
| -------------------- | --------- | ------------------------- |
| fully-specified      | v1.2.3    |
| minor version prefix | v1.2      | latest starting with v1.2 |
| major version prefix | v1        | latest starting with v1   |
| version comparison   | >=v1.2.3  | can also use >, <, and <= |
| latest               | latest    |
| commit hash          | A1B2C3D   |
| tag                  | my-tag    |
| branch name          | my-branch |

In all cases but using a fully-specified version,
running a command such as `go build` finds a matching version
and updates `go.mod` with the result.
Specifying a version like "v2" will not automatically get the
latest version that starts with "v2" every time `go build` is run
since "v2" will be replaced by an actual version.

Sam Boyer is the lead maintainer of Dep, a dependency management tool for Go.
He feels that this feature of Go modules loses information
about the minimum versions that were deemed compatible.
Further, he feels this makes it hard to resolve diamond-shaped
dependencies where multiple modules needed by an app
depend on different minor versions of other modules.
See his talk "We need to talk about Go modules" at
<https://www.youtube.com/watch?v=7GGr3S41gjM&feature=youtu.be&t=14m55s>.

No automatic version updates are ever performed.
To use different versions, modify version queries in `go.mod`
or bump the major version in imports.
This means that checking `go.mod` files into a version control repository
provides a way to produce repeatable builds.

"Version comparison" gets the nearest version to what is requested,
not the latest version that matches. For example, if the query is ">=1.2.3"
and the existing versions include 1.2.2, 1.2.3, and 1.2.4,
this will use version 1.2.3.

### Pseudo Versions

For dependencies that do not currently use semantic versioning,
an alternate way to determine whether
one version is later than another is needed.
Pseudo versions provide this.

Pseudo versions are strings that have three parts.
The first is a version in the form "v{major}.{minor}.{something}".
The second is the commit time in UTC.
The third is the first 12 characters of the commit hash.
These parts are separated by dashes.

The "something" in the first part is a bit complicated.
Fortunately it's not necessary to think about this
because pseudo version strings are automatically generated
when dependencies that lack semantic versioning tags are installed.

### Other `go.mod` Directives

Besides the `module` and `require` directives,
`go.mod` files can also contain
`exclude` and `replace` directives.
`exclude` directives specify versions of dependencies that cannot be used.
`replace` directives specify versions of dependencies
that should be replaced by another version.
These can be used to avoid using versions that have
known bugs or security issues.

### Tidying `go.mod` Files

Over time the list of dependencies in a `go.mod` file can become out of date.
It might be missing some required dependencies or
list dependencies (or versions of them) that are no longer used.
The command `go mod tidy` adds missing dependencies
and removes unused dependencies from `go.mod`.

Of course many other commands such as `go build`
take care of adding missing dependencies,
so the primary purpose of `go mod tidy`
is to remove unused dependencies.

### Checksums

Go modules use checksums to verify that
downloaded dependency code has not been modified.
The checksums for each dependency are stored in the file `go.sum`.
These is one checksum for the dependency as a whole,
and one for each source file that defines the dependency.
The command `go mod verify` reports all directories that hold
downloaded module code and contain files that have been modified.

### Proxies

It is possible to configure a proxy server that hosts Go modules
so they are installed from there instead of
connecting to public source control repositories.
One reason to do this is to restrict access
to only modules that have been vetted.

A Go proxy server is a web server that
responds to GET requests for module URLs.
To use one, set the `GOPROXY` environment variable
to point to the server.

For more information, enter `go help goproxy`.

### Transition to Module Support

In Go 1.11 it is possible to use both the old GOPATH approach
to dependencies and the new module approach.
The environment variable `GO111MODULE` specifies whether
one or both of these approaches should be allowed.
When set to "off", only GOPATH can be used.
When set to "on", only modules can be used.
When set to "auto" or not set, either can be used
and the choice is based on whether commands are run from a directory
that contains a `go.mod` file or a descendant of such a directory.

If you have existing code that relies on GOPATH and
you want to try module support in some new or existing packages,
not setting `GO111MODULE` is a good option.
