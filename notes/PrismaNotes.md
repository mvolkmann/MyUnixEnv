# Prisma Notes

## Setup

- `npm install -g prisma`
- `prisma init {server-name}`
  - displays these options

```text
   ? Set up a new Prisma server or deploy to an existing server?

  You can set up Prisma for local development (based on docker-compose)
❯ Use existing database      Connect to existing database
  Create new database        Set up a local database using Docker

  Or deploy to an existing Prisma server:
  Demo server                Hosted demo environment incl. database (requires login)
  Use other server           Manually provide endpoint of a running Prisma server
```

- if "Use existing database" is selected ...
  - choose "MySQL" or "PostgreSQL"
  - for "Does your database contain existing data?" select "No" or "Yes"

## For help

- browse <https://www.graph.cool/forum>
- to get more detailed output in bash, run `set -x DEBUG "*"`

## Connecting to an existing database

There is currently very little documentation on doing this!
It is considered experimental.

1.  Translate your SQL schema into a GraphQL data model written in SDL.
2.  Deploy a Prisma service with that data model.
3.  If your database previously contained some data, import the data into your Prisma service.
