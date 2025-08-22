#let _table-of-elements(title, target) = {
  context {
    let elements = query(target)

    // Only show if there are multiple elements, see recommendation in section "Abbildungs-, Tabellen- und Quellcodeverzeichnis" of
    // https://fbi.h-da.de/fileadmin/Group_Dekanat/Dokumente/Studium/Group_Bachelor-Koordinator/BSc/empfehlungen_zu_abschlussarbeiten.pdf
    if elements.len() >= 3 {
      heading(numbering: none, outlined: false, bookmarked: true, title)
      v(1em)
      outline(
        title: none,
        target: target,
      )
    }
  }
}

#let table-of-code-listings(language) = {
  let title = (
    de: "Quellcodeverzeichnis",
    en: "Listings",
  ).at(language)

  _table-of-elements(title, figure.where(kind: raw))
}

#let table-of-tables(language) = {
  let title = (
    de: "Tabellenverzeichnis",
    en: "Tables",
  ).at(language)

  _table-of-elements(title, figure.where(kind: table))
}

#let table-of-figures(language) = {
  let title = (
    de: "Abbildungsverzeichnis",
    en: "Figures",
  ).at(language)

  _table-of-elements(title, figure.where(kind: image))
}

#let table-of-contents(language) = {
  let title = (
    de: "Inhaltsverzeichnis",
    en: "Table of Contents",
  ).at(language)

  // TODO: Apply this reduced margins also to other `table-of-...`? Or only keep it for Table of Contents?
  set page(margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 30mm))
  heading(numbering: none, outlined: false, bookmarked: true, title)
  v(1em)
  outline(
    title: none,
    indent: 2em,
  )
}
