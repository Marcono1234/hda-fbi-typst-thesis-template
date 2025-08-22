#import "/package-imports.typ": glossarium.gls

= Packages

In addition to Typst's built-in functionality, you can use 'packages' created by the community. Those packages are available on #link("https://typst.app/universe/")[Typst Universe].

Let's say you want some sequence diagrams. Then first import the package (in this case `chronos`), and then use its functions:

#import "@preview/chronos:0.2.1"
#figure(caption: [Creating a thesis], chronos.diagram({
  import chronos: *
  _par("A", display-name: "User")
  _par("B", display-name: "Typst")

  _seq("A", "B", comment: "create my thesis")
  _seq("B", "B", comment: "heavy working")
  _seq("B", "A", comment: "your thesis")
}))

Alternatively, you can create diagrams with any external tool and then include the image (ideally an SVG) using Typst's `image` function.

If you want to have the package imports -- and more importantly their version numbers -- in a single place, you can add them to the `package-imports.typ` file, and then import from that file instead, e.g.:

```typst
#import "/package-imports.typ": chronos
```

By the way, the abbreviations from the glossary, such as #gls("h-da"), use an external package as well.
