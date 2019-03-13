# Xcode Notes

## iOS Simulator

- launch Xcode
- select Xcode ... Open Developer Tool ... Simulator
- select Hardware ... Device ... Manage Devices

## To test/debug a web app

- open Safari in iOS Simulator
- browse a URL
  - can use localhost for locally running apps

## To use devtools

- open macOS Safari
- verify that Preferences ... Advanced ... Show Develop menu in menu bar is checked
- select Develop ... Simulator

### To view properties of a JSON string in sessionStorage

- open devtools as described above
- select the Console tab
- enter state = JSON.parse(sessionStorage.getItem('some-key'))
- use disclosure triangles to expand and collapse parts of the object tree
