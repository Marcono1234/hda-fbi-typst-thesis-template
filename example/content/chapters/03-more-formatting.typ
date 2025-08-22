= More formatting <ch:more-formatting>

This chapter shows some more things you can do with Typst.

== Figures

You probably want to give your code blocks, tables, graphs, ... a caption. For that you can use figures:

#figure(caption: [JSON object], ```json
{
    "a": 1,
    "b": 2
}
```)

You should also add a label to your figures and then refer to them in the text so that it is easier for readers to understand what you are referring to. For example @my-first-figure shows a JSON array whereas @my-second-figure shows a JSON object containing a JSON array.


#figure(caption: [JSON array], ```json
[
    "first",
    "second"
]
```) <my-first-figure>

#figure(caption: [JSON object and array], ```json
{
    "a": 1,
    "b": [
        "first",
        "second"
    ]
}
```) <my-second-figure>

== Heading references <ch:headings>

You can add labels also to headings and then refer to them in the text as well. For example this text is in @ch:more-formatting, more specifically in @ch:headings.

== Citing

As you saw in the introduction, you can refer to bibliography entries like this @bib:typst and when citing multiple entries @bib:typst-thesis-haug @bib:typst-thesis-madje Typst automatically shows the citations grouped together.
