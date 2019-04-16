# Github Notes

## Personal Access Tokens

To push to your repositoris from a new machine,
you need to create and use a personal access token.
To create a new personal access token,

- click avatar in upper-right and select "Settings"
- in left nav. click "Developer settings"
- in left nav. click "Personal access tokens"
- press "Generate new token"
- enter a "Token description"
- copy the token
- do a "git push" and use this token as the password
- after this "git push" commands should not prompt for a username and password

## Pull requests

To create a pull request for an open source repository

- browse the Github page for the project
- press the "Fork" button in the upper-right
- select your Github account from the dialog that appears
  - the repository will now appear under your Github account
- clone the repository from your account
  to get all the files into your file system
- create a branch on your copy of the repository
- make changes
- commit the changes on your branch
- browse the Github page for the project
- press the "New pull request" button next to the "Branch" dropdown
- click the "compare across forks" link
- in the "head fork" dropdown, select your copy of the repository
- in the "compare dropdown", select your branch
- enter a title for the pull request
- enter a description of your changes,
  conforming to the provided template if there is one
- verify that the correct changes were found by
  scrolling down and reviewing the diffs
- press the "Create pull request" button
- pray that the pull request gets merged
