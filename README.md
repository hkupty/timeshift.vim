Timeshift
=========

This simple plugin splits into another buffer and then joins back into
original place.

To split something, do `csj{motion}`, which will cause the selected snippet to open in a separate buffer.

After you finished editing it, press `q` to return it.

When inside a markdown buffer, you can `cmd` (change markdown) inside a code block (triple
backticks) that it will automatically open a scratchpad buffer with the code
block content with the correct filetype set.

Please note that this plugin makes heavy use of marks, specially the mark `'s`.
If you use marks frequenty, avoid marking `'s` when using timeshift.


Customization
-------------

In case `csj` gets too difficult, one can `let g:timeshift_mapping` to anything better for you.
The same applies to markdown, with `let g:timeshift_markdown_mapping`.
