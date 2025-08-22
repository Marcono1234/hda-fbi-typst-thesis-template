#let copyright-page(
  title: "",
  author: "",
  submission-date: none,
) = {
  import "../../constants.typ": lang-de
  set text(lang: lang-de)

  // Hide page number in footer
  set page(numbering: none)

  import "../helper-functions.typ": format-date-de
  let formatted-date = format-date-de(submission-date)
  align(bottom + left, text(
    size: 1.1em,
    weight: 400,
    author + ": " + text(style: "italic", title) + ", © " + formatted-date,
  ))
}
