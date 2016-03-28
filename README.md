Split Join
==========

This simple plugin splits into another buffer and then joins back into original place.

To split something, simply do `gx{motion}` and the piece of text relative to the supplied motion is splitted into another buffer.

After you are done editing in this separate buffer, simply do `q` and the text is joined back into where it was before.

The goal of this plugin is to allow editing code snippets inside markdown or similar constructs.

TODO
----

- [ ] Allow different buffer types (i.e. code inside markdown)
