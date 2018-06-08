# GraphQL Notes

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
  - queries can refer to variables prefixed with a $
  - values are specified in an object where the keys
    are variable names
  - parameters are named, not positional
  - parameters are optional unless their type is followed by !
  - parameters can have default values
    - ex. $name: String = "Mark"
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
  - TODO: ADD DETAIL HERE!
  - Apollo Client
  - Apollo Server
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
