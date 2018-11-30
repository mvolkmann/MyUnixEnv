# Java Issues

Java was my primary programming language for 15 years.
But in the last eight years I have rarely used it.
Recently I started work on a project that is mostly
implemented in Java. This gave me a chance to reflect
on why I no longer prefer Java.

Some of the issues are inherent in the language.
However, many of them are just common practices
that could be changed if there were enough concensus.

## Inherent Issues

### Build Times

Build times for Java applications are too slow.
It is not uncommon for large projects to
require over a minute to build a WAR file.

This has a huge impact on productivity.

It also discourages trying options in code
because each attempt takes too long.

### No Functions

All shared functionality must be expressed as
classes with methods, not plain functions.

Most programming languages, both old and new,
emphasize the use of functions.
Java is a real outlier here.

## Practice Issues

### Directory Structures

Java directory structures are too deep.
This became even worse after the introduction
of Maven as a common build tool.
For example, most Java source files
are in a directory matching the pattern
src/main/java/com/company-name/application-name/category/subcategory.

This makes navigating the directory structure of an application
or library extremely tedious.

Maven is responsible for the src/main/java part.

The com/company-name/application-name part is a result of
assuming that any class will potential be released for
use outside the application in the future
and naming conflicts must be avoided.
Typically this does not happen.

In most cases it would be fine to use a directory structure
like java/category/subcategory.

### Getters and Setters

Getter and setter methods are overused.
Their rationale is that at some point it may be
desirable to compute values in getter methods
and validate values in setter methods.
But in practice this probably only happens in
1 out of every 1000 such methods.
The cost is an extreme about of boilerplate code.
The solution is to use public instead of private fields
when getter/setter functionality is not needed.

### Default Access

The default access level for fields should be
either private or public.
Making it private would emphasize safety.
Making it public would emphasize concise code.
For example, data-only classes could look like this
if the default were public:

```java
package data;

class Address {
  String street;
  String city;
  String state;
  int zip;
}
```

### Constants

String constants are overused.
It is typical to see definitions like the following:

```java
public static final String MY_LONG_CONSTANT_NAME = "MY_LONG_CONSTANT_NAME";
```

Perhaps this points to a need to support a "symbol" data type
as is done in many other languages.
These are guaranteed to have unique values.

The syntax for declaring a constant is too verbose.
"static final" should be replaced by "const".

### Implicit Field References

Fields in Java classes can be referenced by only their name.
This means developers must be aware of the fields
in the class they are reading to distinguish
between local variables and fields.
Other OO languages require fields to be referenced
with a prefix of "this." or "self.".
While this would make the code more verbose,
it would result in code that is easier to understand at a glance.

### Oracle Effect

Many would argue that Oracle has not been a good steward of Java.

## Proof of Issues

I would argue that if any of the features of Java
discussed above were actually good features,
other modern programming languages would have copied them.
So which languages have similar features or practices?

As an example, the Go programming language has none of these issues.

## Extracting the Good From Java

The Java community has developed many important libraries and frameworks.
But their use is typically limited to applications built on the JVM.

In most cases the same approaches could be ported to other languages.

It would be great to see some effort put into porting
popular Java libraries and frameworks to
other commonly used programming languages
including JavaScript, Python, and Go.
