// Creates API documentation for the thesis template
// Not intended to be used by users

#import "@preview/tidy:0.4.3"

// Create one large continuous document
#set page(height: auto)

#let show-doc(file) = {
  let style = tidy.styles.default
  let show-type(t) = {
    // Special casing for types where `str(t)` is not equal to the type name
    // For example `str(bool) == "boolean"`
    // Note: Might affect a few more types, but they are not used yet in
    // documentation, so only cover them once they are used
    let type-name = if (t == bool) {
      "bool"
    } else if (t == str) {
      "str"
    } else {
      str(t)
    }
    style.show-type(type-name, style-args: (colors: style.colors))
  }

  let docs = tidy.parse-module(
    read("/" + file),
    name: file,
    require-all-parameters: true,
    // Export custom `tidy-show-type` function to allow doc comments to render type labels
    scope: (tidy-show-type: show-type),
  )

  let link-color = rgb("#66aaee")
  show ref: set text(fill: link-color)
  show link: set text(fill: link-color)

  // Add border around code blocks to better tell them apart from other content
  show raw.where(block: true): code => {
    rect(code, width: 100%, radius: 5pt)
  }
  tidy.show-module(docs, style: style)
}

#show-doc("constants.typ")

#pagebreak()

#show-doc("thesis-template.typ")
