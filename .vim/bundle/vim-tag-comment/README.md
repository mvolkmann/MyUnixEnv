This plugin defines commands that properly comment and uncomment
tags in XML/HTML files.  It relies on the "vat" command
to select the tag under the cursor.  This does not understand
HTML tags that are not terminated (ex. <br> and <input>) or
XML tags that are terminated in the shorthand way (ex. <x/> and <x />).
There are separate commands to handle commenting and uncommenting
those.

When a tag containing comments is commented out,
the comment delimiters are changed from <!-- --> to <!__ __>
so they can be restored if the tag is uncommented later.

Unless already mapped to something else, the following key mappings
are configured:

* <leader>tc :ElementComment<cr>
* <leader>tu :ElementUncomment<cr>
* <leader>tC :TagComment<cr>
* <leader>tU :TagUncomment<cr>
