= TODOs

The thesis template provides custom TODO functions which you can use as placeholder or reminder for content which you have not written yet or want to rework later:

- `todo`: Invisible marker with comment
- `todo-content`: Visible marker with optional comment

You can import them from the thesis template:
```typst
#import "/thesis-template/thesis-template.typ": todo, todo-content
```

#import "/thesis-template/thesis-template.typ": todo, todo-content

// Not shown in rendered output
#todo("reword this section to make it easier to understand")

// Without comment
#todo-content()

// With comment
#todo-content(comment: "add this section")

// With visible comment
#todo-content(comment: "add this section", show-comment: true)

In your `thesis.typ` file where you apply the thesis template you can then set `fail-on-todo: true` to fail for any remaining TODO function calls #footnote[Due to a current #link("https://github.com/typst/typst/issues/1747")[limitation of Typst], the errors for TODOs don't show where the TODO function was called.].

Note that `fail-on-todo` only affects reachable TODOs; if you have a TODO function call in a file but forget to include that file in your thesis, that TODO will not be noticed. So don't fully rely on this.
