#import "../../package-imports.typ": glossarium.make-glossary, glossarium.print-glossary, glossarium.register-glossary

#let set-up-acronyms(glossary-list) = {
  if glossary-list.len() > 0 {
    // See Glossarium README
    register-glossary(glossary-list)
  }
}

#let table-of-acronyms(language, glossary-list: ()) = {
  let title = (
    de: "Abkürzungsverzeichnis",
    en: "Acronyms",
  ).at(language)

  if glossary-list.len() > 0 {
    heading(numbering: none, outlined: false, bookmarked: true, title)

    v(1em)

    // See Glossarium README
    show: make-glossary
    print-glossary(
      glossary-list,
      show-all: true,
      // Disable back-references; might not provide much value, and for frequently
      // used acronyms it might be a bit noisy
      disable-back-references: true,
    )
  }
}
