# Google Cloud Platform Notes

- browse cloud.google.com
- press "GO TO CONSOLE" button
- click dropdown in upper-left to create a new project or select an existing one
  - using "node-rest-demo"
- scroll down to the "Getting Started" section
- click "Enable APIs"
- scroll to "Google Cloud SQL" and click "Enable"
- browse <https://cloud.google.com/sdk/docs/>
- click a package link to download "Cloud Tools" for your platform
- unzip the downloaded zip file
- open a terminal window
- cd to the google-cloud-sdk directory
- enter `./install.sh`
- enter `./bin/gcloud init`
  - will ask lots of questions
- from the dashboard hamburger menu in the upper-left, select "SQL"
- click "CREATE INSTANCE"
- press "Choose MySQL" or "Choose PostgreSQL"
- select a configuration
- enter an instance id (a.k.a. instance name) and remember it
  - mine is `node-rest-demo-db`
- enter a password and remember it
  - mine is `password`
- select a region
- press "CREATE" button
  - takes around 5 minutes!
- to see information about the instance
  - `gcloud sql instances describe {instance-id}`
  - see `connectName` in this output
    - mine is `node-rest-demo:us-central1:node-rest-demo-db`
- set the default password for the Cloud SQL instance
  - `gcloud sql users set-password postgres no-host --instance {instance-id} --password {password}`
- granting access to other projects
  - if your App Engine application and Cloud SQL instance are in different projects,
    you must use a service account to allow you application to access it
  - otherwise no extra steps are needed
- to test the application locally
  - install the Cloud SQL Proxy
    - browse <https://cloud.google.com/appengine/docs/flexible/nodejs/using-cloud-sql-postgres>
    - scroll to "Install the Cloud SQL proxy"
    - click the tab for your platform
    - copy the command to download the software
    - paste it in a terminal
    - follow the platform-specific instructions
      - for macOS it is `chmod +x cloud_sql_proxy`
  - start the Cloud SQL Proxy
    - this allows accessing the cloud database from a locally running app
    - enter `./cloud_sql_proxy -instances=node-rest-demo:us-central1:node-rest-demo-db=tcp:5432`
    - I could not get this to work! I get
      "google: could not find default credentials"
- set up the Cloud SQL Instance

  - create a user
    - `gcloud sql users create mvolkmann no-host --instance node-rest-demo-db`
    - I could not get this to work! I get
      "gcloud sql users create mvolkmann no-host --instance node-rest-demo-db"

- web UI

  - browse <https://cloud.google.com>
  - click "CONSOLE" in upper-right
  - consists of many "cards"

    - Project info
      - shows the current project name, id, and number
      - click "Go to project settings" to
        change the project name or
        shut it down (delete it)
    - Resources
      - shows app engine versions
        - what are these?
      - cloud storage buckets
        - what are buckets?
      - shows cloud SQL instances
        - for each shows the instance id, type (ex. PostgreSQL 9.6),
          public IP address, instance connection name,
          location, and storage used
    - Trace
      - shows output from "Stackdriver Trace"
        used to measure performance
      - "allows you to send and retrieve latency data
        to and from Stackdriver Trace"
    - Getting Started
      - provides a variety of tutorials
    - App Engine
      - click "Go to the App Engine dashboard" to see details
    - SQL
      - click "Go to the SQL dashboard" to see details
      - can create new database instances
        - choose MySQL or PostgreSQL
        - choose a "use case"
          - "Development", "Staging", or "Production"
          - each has different numbers of virtual CPUs,
            memory allocation, and SSD storage allocation
        - enter an instance id
        - enter a default user password
        - select a region (ex. "us-central1")
        - select a zone within the region (ex. "us-central1-a")
        - press "Create" button at bottom
        - note the "instance connection name"
        - takes are really long time to finish creating!
      - select an instance and click "..." menu on right
        to edit configuration, clone, or delete
    - APIs
      - shows APIs and services you have enabled and
        the traffic, errors, and latency you have induced
    - Google Cloud Platform Status
      - shows status of all GCP services (not your services)
    - Billing
      - click "View detailed charges" and "Go to billing"
        to see dollar credits remaining and days remaining
    - Error Reporting
      click "Go to Error Reporting" to see recent errors
      from HTTP requests
    - News
    - Documentation

  - to return to dashboard from any page,
    click "Google Cloud Platform" in upper-left

- gcloud commands

  - see <https://cloud.google.com/sdk/gcloud/reference/>
  - `gcloud {group | command} {options} {arguments}`
  - group is one of:
    - app, auth, components, compute, config, container,
      dataflow, dataproc, datastore, debug, deployment-manager,
      dns, domains, endpoints, firebase, iam, iot, kms,
      logging, ml, ml-engine, organizations, projects,
      pubsub, services, source, spanner, sql, topic
  - command is one of:
    - feedback, help, info, init, version

- projects

  - to get a list of all current projects,
    `gcloud projects list`
  - to get information about a specific project,
    `gcloud projects describe {project-id}`
  - to verify the current default project,
    `gcloud config list` or
    `gcloud config list project`
    - look for "project" in the output
  - to create a new project,
    `gcloud projects create --set-as-default {project-id}
    - takes about 15 seconds
    - the project name will default to match project-id
      - to use a different name, add `--name {project-name}`
  - to delete a project,
    `gcloud projects delete {project-id}`
  - to change the default project,
    `gcloud config set project {project-id}`

- app instances

  - to get a list of all current app instances,
    `gcloud app instances list`
    - can determine if it is the default instance
      and whether it is running
  - to get information about a specific app instance,
    `gcloud app instances describe --service {service} --version {version} {instance-id}
    - {service} may usually be "default"
    - can see start time, IP address (vmIp), and status (running?)

- SQL databases
  - each database instance can host any number of actual databases
  - to get a list of SQL database instances,
    `gcloud sql instances list`
  - to create a SQL database instance
    - from command line
      - `gcloud sql databases create {name} --instance {instance}`
      - couldn't get this to work
    - from web UI
      - click "Go to the SQL dashboard"
      - click "CREATE INSTANCE" near top
      - choose MySQL or PostgreSQL
      - choose a "use case"
        - "Development", "Staging", or "Production"
        - each has different numbers of virtual CPUs,
          memory allocation, and SSD storage allocation
      - enter an instance id
      - enter a default user password
      - select a region (ex. "us-central1")
      - select a zone within the region (ex. "us-central1-a")
      - press "Create" button at bottom
      - note the "instance connection name"
      - takes are really long time to finish creating!
  - when using PostgreSQL, a database named "postgres" will be created
  - to delete a SQL database instance
    - from command line
      - `gcloud sql databases delete {name} --instance {instance}`
    - from web UI
      - click "Go to the SQL dashboard"
      - check the checkbox for an instance
      - from the "..." menu on the right, select "Delete"
  - to get a list of databases in an instance
    - from command line,
    - from web UI
      - click "Go to the SQL dashboard"
      - click an instance id link
      - click the "DATABASES" tab
  - to create additional databases with other names
    - from the command line
      - `gcloud sql databases create --instance {instance} {db-name}
    - from the web UI "SQL" card
      - click "Go to the SQL dashboard"
      - click an instance id link
      - click the "DATABASES" tab
      - click the "Create database" button
  - to run DDL against the database instance
    - create a file containing SQL statements (ex. ddl.sql)
      - must start with "\c {db-name}" to select the target database
      - follow with SQL to create and populate tables
      - `gcloud sql connect {instance-id} --user=postgres < ddl.sql
      - will output log of each command
  - to verify in database contents interactive mode
    use same command as running DDL with redirection removed
    - from web UI, can't do
    - from command line
      - `gcloud sql connect {instance-id} --user=postgres`
      - enter commands such as
        - \c {db-name} -- connects to specific database in instance
        - \d -- lists tables
        - SQL select statements
        - press ctrl-d to exit
  - to delete a database from an instance
    - from command line
      - `gcloud sql databases delete --instance {instance} {db-name}
    - from web UI
      - click "Go to the SQL dashboard"
      - click an instance id link
      - click the "DATABASES" tab
      - click trash can to right of database name
  - to stop an instance temporarily
    - typically to reduce charges
    - from web UI
      - click "Go to the SQL dashboard"
      - click an instance id link
      - click "STOP" at the top
      - "STOP" will change to "START"
        which can be clicked later to restart it

STOPPED HERE

- to deploy the current project to the app server
  cd server
  copy src/secrets.json to build directory # AUTOMATE IN PACKAGE.JSON!
  copy src/actions.json to build directory # AUTOMATE IN PACKAGE.JSON!
  update app.yaml (one-time)
  npm install (one-time and after package version updates)

  - `npm run build`
  - `gcloud app deploy`
    - took eight minutes which is totally ridiculous!!!
    - this was not even the initial deploy!
  - URL will be <https://{project-id}.appspot.com>
    - Does this imply that project-ids must be globally unique
      or does it choose a different domain if yours conflicts
      with the project of another user?

- to hit the app
  - get the URL by running `gcloud app browse`
  - send REST requests, perhaps using Postman
