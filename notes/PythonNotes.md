# Python Notes

## Origin

- created in 1990 by Guido Van Rossum who now works at Google

## Resources

## Versions

- The main implementation is CPython which is Python implemented in C.
- Jython is Python implemented in Java.
- IronPython is Python implemented for .NET.

## Installing

- approach #1 - bad

  - browse <https://www.python.org/downloads>
  - download and run installer
  - on macOS, creates Applications/Python 3.7 directory
  - doesn't change version of Python used in Terminal
  - check with "python --version"

- approach #2 - good

  - `brew install python`
  - may need to alias `python` to `python3`

- pip

  - similar to npm for Node
  - should have been installed when Python was installed,
    but wasn't for me
  - to install on macOS, `sudo easy-install pip`
    and `sudo pip install --upgrade pip`

## Dependencies

- pip is the Python equivalent of npm

## VS Code

- install Python extension from Microsoft
- run current source file from Command Palette
  "Python: Run Python File in Terminal"

## Source Files

- have `.py` file extension
- execute with `python name.py`

## One way

- tries to provide one way to do things rather than the
  "there is more than one way to do it" (TMTOWTDI pronounced Tim Toadie)
  approach of Perl and Ruby

## Comments

- start with `#` and go to end of current line

## Indentation

- most common is four spaces

## Strings

- can be delimited by single or double quotes (single preferred?)

## Obtaining Keyboard Input

- `name = input('What is your name? ')`
- `print('Hello, ' + name)`

## Calling C and C++

- SWIG can be used to generate Python wrappers for C and C++ code

## Things I Hate

- self
  - Defining instance methods requires including self as the first parameter.
    ex. def set_cell(self, x, y, value):
  - Referring to an instance variable requires use of self.
    ex. self.cells[x-1][y-1] = value
  - Calling a method on the current object requires use of self.
    ex. while not self.solved():
- class attributes and methods
  - Are these supported?
- magic methods
  - I don't like the **name** magic methods that get invoked automatically
    if they exist in a class.
    - constructors
      ex. def **init**(self, \*cells):
    - to string
      ex. def **str**(self):
- encapsulation
  - attributes aren't declared
  - access to attributes is only controlled via convention.
