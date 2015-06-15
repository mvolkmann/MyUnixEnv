This is a Vim plugin provides commands that
"properly" comment and uncomment HTML and XML tags.
All the plugins I have seen for this would take the following:

```xml
<foo> 
  <bar>baz</bar> 
</foo>
```

and comment it like this:

```xml
<!--<foo>-->
  <!--<bar>baz</bar>-->
<!--</foo>-->
```

This is ugly and excessive!
I believe the proper way to do this is:

```xml
<!--foo>
  <bar>baz</bar>
</foo-->
```

The provided ElementComment command does this and
the provided ElementUncomment command does the opposite.
These even support nested comments.
When a tag containing comments is commented out,
the comment delimiters are changed from <!-- --> to <!__ __>
so they can be restored if the tag is uncommented later.

This relies on the "vat" command to select the tag under the cursor.
It does not understand HTML tags that are not terminated (ex. <br> and <input>)
or XML tags that are terminated in the shorthand way (ex. <x/> and <x />).
There are separate commands (TagComment and TagUncomment)
to handle commenting and uncommenting those.

Unless already mapped to something else,
the following key mappings are configured:

* <leader>tc :ElementComment<cr>
* <leader>tu :ElementUncomment<cr>
* <leader>tC :TagComment<cr>
* <leader>tU :TagUncomment<cr>

The easiest way to install this is to use Pathogen and
"git clone" this repository into the .vim/bundle directory.
