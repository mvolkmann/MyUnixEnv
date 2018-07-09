# Micronaut Notes

## Overview

- a microservice framework that supports code written in Java, Groovy, and Kotlin
- <http://micronaut.io/>

## Setup

- install JDK 8 or higher
- browse <http://micronaut.io/> and click the "DOWNLOAD" link
- click the "Binary" link
- unzip the downloaded file
- add the bin directory in the unzipped directory to path
- verify setup by running `mn -v`
- `mn` is the Micronaut CLI

## Create an app

- to create an app named "myapp" with a default package of "com.mycompany"
  - `mn create-app com.mycompany.myapp
  - `cd myapp`
- by default a Gradle build is supplied
- the main method is defined in the generated file
  `src/main/java/com/mycompany/Application.java`

## Create a controller that defines REST services

- create the file `src/main/java/com/mycompany/HelloController.java`
  - Java loves deeply nested directory structures!
  - all these directories should already exist

```java
package com.mycompany;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Produces;
import io.micronaut.http.annotation.QueryValue;

@Controller("/hello")
public class HelloController {
    // Browse /hello
    @Get("/")
    @Produces(MediaType.TEXT_PLAIN)
    public String index() {
        return "Hello Micronaut!";
    }

    // This demonstrates using path parameters.
    // Browse /hello/path/Mark
    @Get("/path/{name}")
    @Produces(MediaType.TEXT_PLAIN)
    public String path(String name) {
        return "Hello, " + name + "!";
    }

    // This demonstrates using query parameters.
    // Browse /hello/query?name=Mark
    @Get("/query")
    @Produces(MediaType.TEXT_PLAIN)
    public String query(@QueryValue("name") String name) {
        return "Hello, " + name + "!";
    }
}
```

## Build the application and start the server

- cd to the top application directory
- `./gradlew run`
  - on first run this downloads gradle which takes a long time
- listens on a random port
- to specify the port, edit src/main/resources/application.yml
  and uncomment these lines

  ```yml
  //    server:
  //        port: 8080
  ```

- outputs "Server Running:" followed by the URL to browse
- browse that URL plus "/hello"
- after changes, restart the server
  - should be ready in about two seconds
