#import "../../package-imports.typ": glossarium.make-glossary, glossarium.print-glossary, glossarium.register-glossary

#let set-up-acronyms(acronyms) = {
  if acronyms.len() > 0 {
    // See Glossarium README
    register-glossary(acronyms)
  }
}

// Note: This is also recommended only for >= 3-5 abbreviations, see
// https://www.fbi.h-da.de/fileadmin/user_upload/fachbereich-informatik/Main_Menu/Studieren/Studium/Organisatorisches/Abschlussphase/Bachelor/empfehlungen_zu_abschlussarbeiten.pdf
//   However if the template omitted it, then the descriptions for the acronyms would be missing
//   Therefore always show this (except if empty); it is rather up to the user to not
//   use it if their thesis contains only few acronyms
#let table-of-acronyms(language, acronyms) = {
  let title = (
    de: "Abkürzungsverzeichnis",
    en: "Acronyms",
  ).at(language)

  if acronyms.len() > 0 {
    heading(numbering: none, outlined: false, bookmarked: true, title)

    // See Glossarium README
    show: make-glossary
    print-glossary(
      acronyms,
      show-all: true,
      // Disable back-references; might not provide much value, and for frequently
      // used acronyms it might be a bit noisy
      disable-back-references: true,
    )
  }
}
