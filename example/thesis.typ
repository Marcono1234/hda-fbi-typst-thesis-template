#import "thesis-template/thesis-template.typ": thesis-template
#import "thesis-template/constants.typ": degree-bachelor, lang-en

// Set up and apply the thesis template
#show: thesis-template.with(
  language: lang-en,
  title: [Creating a thesis with Typst],
  degree: degree-bachelor,
  prof-main: "Prof. Dr. Jane Doe",
  prof-second: "Prof. Dr. John Smith",
  author: "Max Mustermann",
  student-id: "1234567",
  signing-data: (
    location: "Darmstadt",
    // Alternatively can set a specific date, e.g. `datetime(year: 2025, month: 1, day: 1)`
    date: datetime.today(),
    signature: "/signature.svg",
  ),
  // Let's assume the thesis has a blocking notice ("Sperrvermerk")
  restricted: true,
  abstract-de: include "content/abstract-de.typ",
  abstract-en: include "content/abstract-en.typ",
  // Optionally provide a list of acronyms / abbreviations
  acronyms: {
    import "content/acronyms.typ": acronyms
    acronyms
  },
  // Set this to `true` when you are done with the thesis
  fail-on-todo: false,
)

// Example for applying custom styling for all subsequent content
#import "custom-style.typ": custom-style
#show: custom-style

// The content of the thesis
#include "content/chapters/01-introduction.typ"
#include "content/chapters/02-basic-formatting.typ"
#include "content/chapters/03-more-formatting.typ"
#include "content/chapters/04-packages.typ"
#include "content/chapters/05-todos.typ"
