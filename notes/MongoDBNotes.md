# Mongo Notes

## Overview

- a NoSQL database implemented in C++
- stores documents in collections
- documents are JSON objects
- no need to define a schema that describes the object properties
  - speeds up development when the structure changes often
    since no schema changes are required
  - allows properties present in the objects of a collection to vary
  - but typically all documents in the same collection
    have similar properties
- an object property value can be the id of another object,
  even in a different collection
- stores documents in binary JSON (BSON)
- MongoDB Shell supports using JavaScript
  to interact with a MongoDB database
- can add multiple indexes to collections
  - implemented as B-tree data structures
- supports replicated data across multiple machines
  for redundancy and automated fail-over
- "users control the speed and durability trade-off
  by choosing write semantics and
  deciding whether to enable journaling"
- journaling is used to restore the database to a consistent state
  when it is restarted after an unorderly shutdown
  caused by something like a power outage
  - on by default
- horizontal scaling can be achieved by spreading databases
  over multiple machines and "sharding" the data
- the MongoDB server executable is `mongod`
- by default, files used by MongoDB
  are under `/data/db` on Unix-like systems
  and under `c:\data\db` on Windows

## To install MongoDB Community Edition

- on macOS
  - `brew tap mongodb/brew`
  - `brew install mongodb-community`

- from source
  - browse <http://www.mongodb.org/downloads>
  - download the appropriate file
  - unzip the file
  - ???

## To create directory where data will be stored

- cd /
- mkdir -p /data/db (default database directory)
- sudo chown -R {you} /data

## To get detailed documentation

- browse <http://www.mongodb.org/display/DOCS/Manual>

## To start server

- `brew services start mongodb-community`

## To stop server

- `brew services stop mongodb-community`
  - this doesn't seem to work, but `klp 27017` does
  - need to find a better way to do this!

## Mongo Shell

- many commands use JavaScript syntax
- to start a Mongo shell, enter `mongo`
- to exit, enter "exit" or press ctrl-d
- to get help, enter "help"
- to get a list of existing databases, enter `show dbs`
- to create a database, do nothing since databases
  are automatically created when referenced
- to **select a database**, `use {name}`
  - ex. `use animals`
  - won't appear in `show dbs` output until a collection is created
- to **delete a database**, `db.dropDatabase()`
- to get the names of the collections in a database, show collections
- to **create a collection**, `db.createCollection('{name}')`
  - ex. `db.createCollection('dogs')`
- to **add an object** to a collection,
  `db.{coll}.insert(obj)`
  - ex. `db.dogs.insert({breed: 'Whippet', name: 'Dasher'})`
- to **update object in collection**,  
  `db.{coll}.update(searchObj, updateObj)`
  - ex. `db.tjs.update({lastName: 'Volkmann'},
      {$set: {firstName: 'Mark'}});`
- to **delete a collection**, `db.{coll}.drop()`
- to **get first** 20 documents in a collection,
  `db.{coll}.find()`
  - ex. `db.dogs.find()`
- to **get all objects that match criteria**,
  `db.{coll}.find(criteria)`
  - ex. `db.dogs.find({breed: 'whippet')`
  - ex. `db.tjs.find({lastName: {$gt: 'H'}})`
- to **get number of documents** in a collection,  
  `db.{coll}.find().count() or db.{coll}.find().length()`
- to **find document in collection**,
  `db.{coll}.findOne(query)`
  - a query is just a JavaScript object where
    the keys are document property names and
    the values are document property values
- to **delete a document from collection**,  
  `db.{coll}.deleteOne(query)`
- to **delete documents from collection**,  
  `db.{coll}.deleteMany(query)`
- to **update a document in a collection**,  
  `db.{coll}.updateOne(query, { $set: {key: value, key: value, ...} })`
- to **replace a document in a collection**,  
  `db.{coll}.replaceOne(query, newDocument)`
- to **add an index** to a collection,  
  `db.{coll}.createIndex({{prop-name}: 1});`
  - 1 means ascending order, -1 means descending
- to exit the shell, enter "exit"

## Node modules

- `npm install mongodb`

## Examples

- see /Users/Mark/Documents/GEP/sandboxes/mvolkmann/mongodb
