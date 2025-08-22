// Based on https://fbi.h-da.de/fileadmin/Group_Dekanat/Dokumente/Studium/Group_Bachelor-Koordinator/BSc/empfehlungen_zu_abschlussarbeiten.pdf

// These fonts are included in the Typst CLI, see https://typst.app/docs/reference/text/text/#parameters-font
#let body-font = "New Computer Modern"
#let sans-font = "Libertinus Serif"
#let default-text-size = 11pt
#let link-color = rgb("#013f7d") // Color for links such as references to chapters or bib entries

#let main-layout(language: none, doc) = [
  #set page(
    // Margins as recommended by https://fbi.h-da.de/fileadmin/Group_Dekanat/Dokumente/Studium/Group_Bachelor-Koordinator/BSc/empfehlungen_zu_abschlussarbeiten.pdf
    // TODO: These margins assume that the thesis is printed on one side
    //   Maybe consider supporting two-sided printing but then would also need blank pages
    //   at the beginning (and possibly when starting new chapter)?
    margin: (left: 3.5cm, right: 3cm, top: 3cm, bottom: 3cm),
    number-align: center,
  )

  #set text(
    font: body-font,
    size: default-text-size,
  )

  // Set color of references
  #show ref: set text(fill: link-color)
  #show link: set text(fill: link-color)

  // Change outline style
  #set outline.entry(fill: box(width: 1fr, repeat("." + h(2mm))))

  #show outline: set text(font: body-font)

  // Set math equation formatting
  #show math.equation: set text(weight: 800)

  // --- Headings ---
  #show heading: set block(above: 2.5em, below: 1.5em)
  #show heading: set text(
    font: body-font,
    tracking: 0.1em,
    // Don't hyphenate heading text; this assumes that it looks better to wrap words
    // than to hyphenate them in headings; might not work well for long words
    hyphenate: false,
  )
  #set heading(numbering: "1.1")
  #show heading: it => {
    if it.level == 1 {
      // Start chapter on new page
      pagebreak()

      // Chapter heading
      set text(weight: "thin", tracking: 0.13em, size: 12.5pt)
      block(
        grid(
          rows: 2,
          row-gutter: 10pt,
          text(upper(it.body)),
          line(length: 100%, stroke: (0.5pt + black)),
        ),
      )
    } else if it.level == 2 {
      // Section heading
      set text(weight: "semibold", size: 11pt)
      // Wrap in block (which is implicitly sticky for headings) to prevent orphan heading at end of page
      block(
        text(upper(numbering(it.numbering, ..counter(heading).at(it.location())) + " " + it.body)),
      )
    } else {
      // Sub-section heading
      set text(style: "italic", weight: "thin", size: 11pt)
      // Wrap in block (which is implicitly sticky for headings) to prevent orphan heading at end of page
      block(
        text(upper(numbering(it.numbering, ..counter(heading).at(it.location())) + " " + it.body)),
      )
    }
  }

  // Set big page number at the top of pages (aka. header) where a new chapter starts
  #set page(header-ascent: 30%)
  #set page(
    header: context {
      // Find first heading of level 1 on current page
      let heading-lvl-1 = query(heading.where(level: 1)).find(h => h.location().page() == here().page())
      if heading-lvl-1 != none {
        if heading-lvl-1.numbering != none {
          // If there is a level 1 heading (chapter heading) on this page, set the header
          let header-text = align(
            right,
            text(
              baseline: 15pt,
              size: 70pt,
              fill: luma(120),
              numbering(heading-lvl-1.numbering, ..counter(heading).at(heading-lvl-1.location())),
            ),
          )
          header-text
        }
      } else {
        // Else find the closest lvl-2 heading within the same chapter;
        // if there is none fall back to closest lvl-1 heading

        let heading-lvl-2-selector = heading.where(level: 2)

        // TODO: Workaround until https://github.com/typst/typst/pull/5970 is available
        let last-or-none(array) = {
          if array.len() == 0 { none } else { array.last() }
        }

        // If there is a previous lvl-1 heading, ensure the lvl-2 heading comes afterwards
        // (e.g. to avoid using unrelated lvl-2 heading if subsequent lvl-1 heading has no subheadings)
        let last-heading-lvl-1 = last-or-none(query(heading.where(level: 1).before(here())))
        if last-heading-lvl-1 != none {
          heading-lvl-2-selector = heading-lvl-2-selector.after(last-heading-lvl-1.location())
        }

        let heading-lvl-2 = last-or-none(
          // Consider any lvl-2 headings before or on the current page; this includes headings which
          // start in the middle of the current page
          query(heading-lvl-2-selector).filter(h => h.location().page() <= here().page()),
        )

        let get-heading-text(h) = {
          let header-string = (
            numbering(h.numbering, ..counter(heading).at(h.location())) + " " + h.body
          )

          let header-text = align(
            right,
            text(size: 12pt, header-string),
          )
          header-text
        }

        if heading-lvl-2 != none and heading-lvl-2.numbering != none {
          get-heading-text(heading-lvl-2)
        } // Fall back to using lvl-1 heading if there is no lvl-2 heading
        else if last-heading-lvl-1 != none and last-heading-lvl-1.numbering != none {
          get-heading-text(last-heading-lvl-1)
        }
      }
    },
  )

  // Reference first-level headings as "chapters"
  #show ref: it => {
    let chapter-string = (
      de: "Kapitel",
      en: "Chapter",
    ).at(language)

    let el = it.element
    if el != none and el.func() == heading and el.level == 1 {
      let target-link = it.target
      let supplement = chapter-string
      if it.citation != none and it.citation.supplement != none {
        // Custom supplement set
        supplement = it.citation.supplement
      }
      let link-text = supplement + " " + numbering(el.numbering, ..counter(heading).at(el.location()))
      link(target-link, link-text)
    } else {
      it
    }
  }

  // --- Paragraphs ---
  #set par(
    // TODO: This might actually be too small?
    leading: 0.6em,
    justify: true,
    spacing: 1.5em,
  )

  // --- Citations ---
  // This also (intentionally) affects how the bibliography is shown, see related https://github.com/typst/typst/issues/3986
  // TODO: Disabled for now because custom CSL file is used, see `bibliography` call
  // #set cite(style: "alphanumeric")

  // --- Figures ---
  #show figure: set text(size: 0.9em)

  #doc
]
