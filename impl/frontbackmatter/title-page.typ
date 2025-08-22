#import "../../constants.typ": lang-de
#import "../main-layout.typ": body-font, sans-font

#let title-page(
  title: "",
  degree: "",
  faculty: "",
  university: "",
  prof-main: "",
  prof-second: "",
  author: "",
  student-id: "",
) = {
  set page(
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 40mm),
    // Hide page number in footer
    numbering: none,
  )

  set text(
    lang: lang-de,
    font: body-font,
    size: 12pt,
  )

  set par(leading: 1em)

  // Add a dummy heading for an entry in the PDF's bookmarks
  hide(heading(numbering: none, outlined: false, bookmarked: true, "Titelblatt"))

  // --- Title Page ---
  align(center, image("../logo_h-da.svg", width: 52%))


  v(5mm)

  align(center, text(font: sans-font, size: 2em, weight: 700, university))

  align(
    center,
    text(font: sans-font, size: 1.5em, weight: 100, "- " + faculty + " -"),
  )

  v(10mm)

  align(center, text(font: sans-font, size: 1.5em, weight: 700, title))

  v(15mm)

  align(
    center,
    text(font: sans-font, size: 1.3em, weight: 100, "Abschlussarbeit zur Erlangung des akademischen Grades\n" + degree),
  )

  v(20mm)

  align(center, text(font: sans-font, size: 1.3em, weight: 100, "vorgelegt von"))
  align(center, text(font: sans-font, size: 1.3em, weight: 700, author))
  align(
    center,
    text(font: sans-font, size: 1em, weight: 100, "Matrikelnummer: " + student-id),
  )

  v(20mm)

  align(
    center,
    grid(
      columns: 2,
      column-gutter: 0.5em,
      row-gutter: 10pt,
      ..(
        strong("Referent:"),
        prof-main,
        strong("Korreferent:"),
        prof-second,
      ).map(it => align(left, it))
    ),
  )

  pagebreak()
}
