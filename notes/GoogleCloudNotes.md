# Google Cloud Platform Notes

* browse cloud.google.com
* press "GO TO CONSOLE" button
* click dropdown in upper-left to create a new project or select an existing one
  * using "node-rest-demo"
* scroll down to the "Getting Started" section
* click "Enable APIs"
* scroll to "Google Cloud SQL" and click "Enable"
* browse https://cloud.google.com/sdk/docs/
* click a package link to download "Cloud Tools" for your platform
* unzip the downloaded zip file
* open a terminal window
* cd to the google-cloud-sdk directory
* enter `./install.sh`
* enter `./bin/gcloud init`
  * will ask lots of questions
* from the dashboard hamburger menu in the upper-left, select "SQL"
* click "CREATE INSTANCE"
* press "Choose MySQL" or "Choose PostgreSQL"
* select a configuration
* enter an instance id (a.k.a. instance name) and remember it
* enter a password and remember it
* select a region
* press "CREATE" button
  * takes around 5 minutes!
* to see information about the instance
  * `gcloud sql instances describe {instance-id}`
  * see `connectName` in this output
    * mine is `node-rest-demo:us-central1:node-rest-demo-db`
* set the default password for the Cloud SQL instance
  * `gcloud sql users set-password postgres no-host --instance {instance-id} --password {password}`
* granting access to other projects
  * if your App Engine appliation and Cloud SQL instance are in different projects,
    you must use a service account to allow you application to access it
  * otherwise no extra steps are needed
* to test the application locally
  * install the Cloud SQL Proxy
    * browse https://cloud.google.com/appengine/docs/flexible/nodejs/using-cloud-sql-postgres
    * scroll to "Install the Cloud SQL proxy"
    * click the tab for your platform
    * copy the command to download the software
    * paste it in a terminal
    * follow the platform-specific instructions
      * for macOS it is `chmod +x cloud_sql_proxy`
  * start the Cloud SQL Proxy
    * enter `./cloud_sql_proxy -instances=node-rest-demo:us-central1:node-rest-demo-db=tcp:5432`
