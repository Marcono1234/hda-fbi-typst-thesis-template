#let format-date-de(value) = {
  if type(value) == datetime {
    // TODO: Use Typst function for localized month once supported, see https://github.com/typst/typst/issues/1537
    let day = value.day()
    let month = (
      "Januar",
      "Februar",
      "März",
      "April",
      "Mai",
      "Juni",
      "Juli",
      "August",
      "September",
      "Oktober",
      "November",
      "Dezember",
    ).at(value.month() - 1)
    let year = value.year()
    str(day) + ". " + month + " " + str(year)
  } else {
    value
  }
}

// Used by the custom `todo` functions in `thesis-template.typ`
// Initialized to `none` to fail in case value is accessed before `set-up-todo` was called
#let fail-on-todo-state = state("fail-on-todo", none)
#let set-up-todo(fail-on-todo: false) = {
  fail-on-todo-state.update(fail-on-todo)
}
