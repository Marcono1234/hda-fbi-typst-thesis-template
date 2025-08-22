#import "thesis-template/thesis-template.typ": cover-page

// Important: As mentioned in the README of the template, clarify with your professor which content
// the hardcover should contain
// Also note that it depends on the copy shop how / in which format they accept the hardcover

#cover-page(
  thesis-type: {
    import "thesis-template/constants.typ": thesis-bachelor
    thesis-bachelor
  },
  short-title: [Creating a thesis with Typst],
  author: "Max Mustermann",
  // Alternatively can set a specific date, e.g. `datetime(year: 2025, month: 1, day: 1)`
  date: datetime.today(),
)
