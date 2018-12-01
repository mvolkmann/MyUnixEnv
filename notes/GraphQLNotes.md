# GraphQL Notes

## Overview

GraphQL is a specification for obtaining and querying data (server-side and client-side).
It is programming language agnostic.
A GraphQL server can act as a proxy for REST services.

## Getting Started

- browse https://graphql.org
- click "Get Started"

## GraphQL Objects

- objects have fields
- fields have types

## GraphQL Types

### Scalar Types

- Boolean - true or false
- Int - 32-bit
- Float - double precision
- String - UTF-8
- ID - unique identifier string
- enum - enumerated values

  - for example

  ```text
  enum Activity {
    SWIM
    BIKE
    RUN
  }
  ```

- can also define custom scalar types
  - ex. Date

### Non-scalar Types

- wrapping [ ] around a type means it is an array of that type
- appending ! to a type name means the value cannot be null
- appending ! to a parameter name means an argument is required
- examples
  - [String] matches an array of string or null values or null
  - [String!] matches an array of string values or null
  - [String]! matches an array of string or null values
  - [String!]! matches an array of string values

## GraphQL Operations

- only three: query, mutation, and subscription

## GraphQL Queries

- queries have the same "shape" as the data requested
- "sub-selections" request a subset of the data in an object
- queries can pass arguments to fields to restrict the data returned
  - ex. person(firstName: 'Mark')
- each field in a query can have its own arguments
- fields can specify an alias name that is used in results
  - useful when querying for multiple lists of the same kind
    - ex. separate lists of people from Missouri and people from Illinois
- "fragments" describe sets of fields that can be requested
  in multiple parts of a query
  - avoids duplication in queries
- queries optionally start with the "query" keyword followed by a query name
  - required to pass "dynamic variables"
  - useful to identify queries in logs
- variables
  - queries can refer to variables prefixed with a \$
  - values are specified in an object where the keys
    are variable names
  - parameters are named, not positional
  - parameters are optional unless their type is followed by !
  - parameters can have default values
    - ex. \$name: String = "Mark"
- directives
  - the shape of a query can be conditionally changed with a directive
  - two kinds, @include and @skip
  - attached to fields and fragments
  - @include(if: {some-boolean})
  - @skip(if: {some-boolean})
- meta fields
  - get set to the type of the data that follows
  - useful when the exact type that will be returned is not known
  - client can get the type to decide how to process the data that follows
  - can be used to select on of many inline fragments based on the type

## GraphQL Schemas

- define what is available to queries
- queries are validated against the schema
- types are defined with
  ```text
  type {name} {
    {field-name}: {type}
    ...
  }
  ```
- note the lack of commas and semicolons
- each field can specify named arguments
  with their types and optional default values

## GraphQL Mutations

- modify server data
  - possibly, but not necessarily, located in a database
- can return data such as the result of a modification
- "input types" specify the types of data
  that specify the changes to be made
- multiple mutations can run in series
  - earlier ones are guaranteed to have completed before later ones run
- "inline fragments" with type conditions are used
  to specify the data to be returned when querying
  a collection containing multiple kinds of objects
  that each contain a different set of fields
  - seems like this would never be the case in a relational database
    where all records in a table have the same columns
  - maybe this is useful with NoSQL databases

## GraphQL Services

- each must define a query type
- each can optionally define a mutation type
- both are defined similarly to object types

## Downloads

- JavaScript reference implementation
  - npm install -S graphql
- GraphiQL
  - a browser-based IDE for exploring GraphQL
  - implemented as a React component
  - https://github.com/graphql/graphiql
  - npm install -S graphiql
  - npm install -S graphiql-language-service
  - to use
    import GraphiQL from 'graphiql';
    render <GraphiQL />
  - I COULD NOT GET THIS TO WORK!
    See https://github.com/graphql/graphiql/issues/504
- Apollo
  - Apollo Client
    - npm install apollo-boost
      - starter kit that configures Apollo Client with recommended settings
    - npm install react-apollo
      - integration with React
    - npm install graphql graphql-tag
      - for parsing GraphQL queries
  - Apollo Server
    - TODO: Finish this!
- Join Monster
  - "a query planner between GraphQL and SQL
    for the Node.js graphql-js reference implementation"
  - "It's a function that takes a GraphQL query
    and dynamically translates GraphQL to SQL
    for efficient, batched data retrieval before resolution."
  - "It fetches only the data you need."
  - https://github.com/stems/join-monster
  - currently supports MariaDB, MySQL, Oracle, PostgreSQL, and SQLLite3
  - npm install -S join-monster
- Apollo
  - provides client-side caching of queries?
- Relay

## Steps to use

- define types and their relationships
  using GraphQL type syntax
- implement resolve functions which map queries to
  code that performs the actually queries
  - ex. SQL select statements using joins

## More Notes to be organized.

Can use Apollo on client-side
Can use Prisma and Yoga on server-side
One endpoint for all queries
Do all queries return JSON?
Queries look very similar to the structure of the JSON that is returned.
data models are typed
A GraphQL schema defines the data types and supported mutations.
Types include String, Int, ID, DateTime, ..., and custom types
! means required
@unique on a field requires unique values
@default(value) on a field gives it a default value when not supplied
[type] is an array of the type
Tools can support field/property completion based on type definitions
Queries get data.
Mutations create, update, and delete data.
The GraphQL spec doesn’t define syntax for filtering and sorting, but implementations add this in an implementation specific way (WHY?)
For example, Prisma supports “where clauses”.
Prisma is an open-source library for performing CRUD operations on databases using GraphQL.
It currently only supports MySQL, PostgreSQL, and MongoDB, but aims to support more databases in the future.
Prisma generates SQL so you don’t have to write it.
Does Prisma also have commercial offerings?
Yoga supports custom logic?

$npm install -g prisma
Create a prisma account by browsing prisma.io and clicking “Sign In”$ prisma login
\$ prisma init
Choose between creating a new database, using an existing database, or using the demo server
“Create new database” sets up a local database using Docker.
Can choose MySQL, PostgreSQL, or MongoDB
Can optionally choose to generate code for a specific kind of client (JavaScript, TypeScript, Flow, or Go)
Generates prisma.yml to hold service description including endpoint URL, datamodel file, and path to generated client code.
Generates datamodel.graphql to hold type descriptions
Generates docker-compose.yml (if creating a new database)
Generates generated/prism-client/index.js (ES5 code)
Generates generated/prism-client/prisma-schema.js (GraphQL syntax, not JavaScript)

$docker-compose up -d$ prisma deploy
Creates “User” type.
Starts server with endpoint at http://localhost:4466
and WebSocket URL ws://localhost:4466

Browse http://localhost:4466
Click “SCHEMA” drawer to see available queries and mutations.
To create a new user, enter the following and press the triangle play button
mutation {
createUser(data: {name: "Mark"}) {id, name}
}
To get all the users, enter the following and press the triangle play button
query {
users {
id # GraphQL calls these “fields”.
name
}
}
To modify an existing user, enter the following and press the triangle play button
mutation {
updateUser(
data: {
name: "Richard"
}
where: { # must uniquely identify a user
id: "cjp5ilekx000c0965ryhvncd5"
}
) {
name # Specifies the fields to be returned to identify the updated objects.
}
}
Can you modify all objects that match criteria instead of just uniquely identified ones?
To delete an existing user, enter the following and press the triangle play button
mutation {
deleteUser(
where: {
id: "cjp5ix9zu000u09658bbf185x"
}
) {
name # Specifies the fields to be returned to identify the deleted objects. # If you don’t care to be told what was deleted, # use \_\_typename to just get back the name of the object type that was deleted
}
}
To upsert a user, enter the following and press the triangle play button
mutation {
upsertUser(
where: {
name: “Richard”
}
create: {
name: “Richard”
}
update: {
name: “Mark”
}
) {
name
}
}

How can you launch psql so it uses the Postgres database running in Docker?

How can you change the columns in an existing table?

How can you add a new table to the database?

in prisma.yml, can get values from environment variables with ${env:var-name}
define variables in a .env file and add the .env files to .gitignore since they contain sensitive information
Things to add to prisma.yml:
to make it secure, add the line: secret:${env:PRISMA_SECRET}
hooks:
post-deploy: - graphql get-schema -p prisma
This retrieves the update GraphQL schema when it is modified.
Is this all generated?

prisma —help
prisma -e variables.env deploy
(need -e if file is not named .env)
Can ignore “Warning command prepare both exists ...”

Comments in GraphQL files are delimited by triple quotes.
For example, “””This is a comment.”””

One of the biggest benefits of Prisma is that it generates lots of query and mutation definitions for you.
