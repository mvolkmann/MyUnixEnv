# Strapi CMS Notes

To create a Strapi project, enter
`npx create-strapi-app {project-name} --quickstart`
This installs everything needed, starts a local Strapi server.
and opens http://localhost:1337/admin/auth/register.
Enter details for an admin user (probably you)
and press the "Ready to start" button.
The admin console will open in the default browser.

Press the "CREATE YOUR FIRST CONTENT TYPE" button.
Click "Create new content-type".
Enter a "Display name".  For example, "address".
Press the "Continue" button.
Select a field type.  For example, "Text".
Enter a name.  For example, "street".
For each additional field in the content type,
press the "Add another field" button and repeat.
When finshed adding fields, click the "Finish" button.
To edit a field, click it.
When finished editing, press the "Save" button.
The Strapi server will restart and the new content type
will appear in the left nav
in its plural form and starting uppercase.

Note that one field type is "Relation".
This is used to create relationships between content objects.
It allows specifying a field name each content type
and the relationship between them which can be
one-to-one, one-to-many, many-to-one, and many-to-many.
When you retrieve a content object that contains a "Relation" field,
it will contain all the objects in the relationship.
For example, if there is a relationship between
People and Addresses and an address object is retrieved,
it will contain all the people objects that live there.

To create a content object of a given content type,
click the content type in the left nav,
press the "Add New {content-type-name}" button,
enter data for each of the fields,
and press the "Save" button.

To edit a content object,
click it, make changes, and press the "Save" button.

To add more content types,
click "Content Type Builder" in the left nav.

To make content available through HTTP GET requests,
click "Roles & Permissions" in the left nav,
click "Public", and
select the operations to allow for each content type.
Operations include "count", "create", "delete",
"find", "findone", and "update".
These correspond to REST services that will become available.

For example, if a content type is "People":
- get the number of people objects with http://localhost:1337/people/count
  (if count is enabled)
- get all the people objects with http://localhost:1337/people
  (if find is enabled)
- get the people object with id 2 with http://localhost:1337/people/2
  (if findone is enabled)

When a content type has a field with the type "Media",
you edit a content object of that type and
add a media file (image, audio, or video) in two ways:
- drag a file onto the field
- click the "browse" link to select a file to upload.

The files are given unique ids and placed in the
public/uploads directory of the Strapi project.

To stop the server, press ctrl-c.

To restart the server, enter `npm run start`.
Login.
Browse localhost:1337 and click the "Open the administration" button
or browse localhost:1337/admin.

To store uploaded files in an Amazon S3 bucket
instead of the local file system:
- install the AWS S3 provider by entering
  `npm install strapi-provider-upload-aws-s3`
