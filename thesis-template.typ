/*
 * Note: Due to usage of file path strings for signature and bibliography this template cannot
 * be published as package yet because the package would be unable to access files outside of it;
 * would have to wait for dedicated 'file path' type, see https://typst.app/docs/reference/syntax/#paths-and-packages
 */
/// Thesis template
///
/// Usage:
/// ```typst
/// #import "thesis-template/thesis-template.typ": thesis-template
///
/// #show: thesis-template.with(
///   language: ...,
///   ...
/// )
///
/// // ... content of the thesis
/// ```
#let thesis-template(
  /// language of the thesis, can be either German (`"de"`) or English (`"en"`)
  ///
  /// You can use the thesis template constants for this:
  ///
  /// ```typst
  /// #import "thesis-template/constants.typ": lang-en
  ///
  /// #show: thesis-template.with(
  ///   language: lang-en,
  ///   ...
  /// )
  /// ```
  /// -> str
  language: {
    import "constants.typ": lang-de
    lang-de
  },
  /// title of the thesis
  /// -> str | content
  title: none,
  /// type of degree you are pursuing (Bachelor / Master); shown on the title page
  ///
  /// You can use the thesis template constants for this:
  ///
  /// ```typst
  /// #import "thesis-template/constants.typ": degree-bachelor
  ///
  /// #show: thesis-template.with(
  ///   degree: degree-bachelor,
  ///   ...
  /// )
  /// ```
  /// -> str
  degree: {
    import "constants.typ": degree-bachelor
    degree-bachelor
  },
  /// _Note:_ Don't translate this when writing the thesis in English; it is shown on the title page which is usually always in German, regardless of language.
  /// -> str
  faculty: "Fachbereich Informatik",
  /// _Note:_ Don't translate this when writing the thesis in English; it is shown on the title page which is usually always in German, regardless of language.
  /// -> str
  university: "Hochschule Darmstadt",
  /// full name of your main professor ('Referent')
  /// -> str
  prof-main: none,
  /// full name of your second professor ('Korreferent')
  /// -> str
  prof-second: none,
  /// your name
  /// -> str
  author: none,
  /// your student ID
  /// -> str
  student-id: none,
  /// submission / signing data:
  ///
  /// - `location` (#tidy-show-type(str))\
  ///   for example "Darmstadt"
  ///
  /// - `date` (#tidy-show-type(datetime))\
  ///   for example `datetime.today()` or `datetime(year: 2025, month: 1, day: 1)`
  ///
  /// - `signature` (#tidy-show-type(str) #tidy-show-type(content))\
  ///   image of your handwritten signature; used for the "Eigenständigkeitserklärung"
  ///
  ///   Can be either:
  ///   - (recommended) a file path, absolute to the Typst compile root (that is, a path starting with `/`), for example `/signature.svg` or `/signature.png`
  ///   - an image, for example `image("my-signature.svg")` (in this case you manually have to set the proper image size, for example `height: 2.5em`)
  ///
  ///   The image should consist only of the signature, ideally with transparent / white background and without excessive whitespace around it.
  ///
  ///   _Tip:_ If you are using Git and planning to publish the thesis source code later, consider adding the signature file to `.gitignore` to prevent misuse. Though keep in mind that the Git history of your project might include other sensitive information as well.
  ///
  /// -> dictionary
  signing-data: none,
  /// whether the thesis should include a blocking notice ("Sperrvermerk"); this might be the case when it contains sensitive information
  ///
  /// *Important:* You should talk to your professor (and when you did your work at a company, also with your supervisor there) whether you should add a "Sperrvermerk". If so, you have to request it when registering your thesis (it is part of the registration form). It might also be possible to request this afterwards, clarify this with your professor.
  /// -> bool
  restricted: false,
  /// the text of your abstract in German (note that this always has to be provided, regardless of the language of the thesis)
  ///
  /// You can write this content in a separate file and then use Typst's `include` to include it:
  ///
  /// ```typst
  /// #show: thesis-template.with(
  ///   abstract-de: include "content/abstract-de.typ",
  ///   ...
  /// )
  /// ```
  /// -> content
  abstract-de: none,
  /// the text of your abstract in English (note that this always has to be provided, regardless of the language of the thesis)
  ///
  /// You can write this content in a separate file and then use Typst's `include` to include it:
  ///
  /// ```typst
  /// #show: thesis-template.with(
  ///   abstract-en: include "content/abstract-en.typ",
  ///   ...
  /// )
  /// ```
  /// -> content
  abstract-en: none,
  /// optional list of acronyms / abbreviations; uses the #link("https://typst.app/universe/package/glossarium/")[Glossarium] package (see its documentation for the expected format)
  ///
  /// You can write the acronyms list in a separate file and define it for example as `#let acronyms = ( ... )` and then use Typst's `import` to include it:
  ///
  /// ```typst
  /// #show: thesis-template.with(
  ///   acronyms: {
  ///     import "content/acronyms.typ": acronyms
  ///     acronyms
  ///   },
  ///   ...
  /// )
  /// ```
  /// -> array
  acronyms: (),
  /// file path to the bibliography / literature list, absolute to the Typst compile root (that is, a path starting with `/`)
  ///
  /// The bibliography supports these formats:
  /// - BibLaTeX (for example `/bibliography.bib`)
  /// - #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Hayagriva format] (for example `/bibliography.yml`)
  ///
  /// BibLaTeX can be converted to Hayagriva using the #link("https://github.com/typst/hayagriva/?tab=readme-ov-file#installation")[Hayagriva CLI] with:
  /// ```sh
  /// hayagriva literature.bib
  /// ```
  /// See the #link("https://typst.app/docs/reference/model/bibliography/")[Typst documentation] for more information.
  ///
  /// -> str
  bib: "/bibliography.yml",
  /// whether to fail if any TODO function calls are still in the document
  ///
  /// The thesis template offers the custom @todo and @todo-content functions which you can use as placeholder or reminder for content which you have not written yet or want to rework later.
  ///
  /// *Important:* While these TODO functions can be helpful, don't fully rely on them and instead manually check at the end that you did not overlook any TODOs.\
  /// Note also that `fail-on-todo` only affects reachable TODOs; if you have a TODO function call in a file but forget to include that file in the thesis, that TODO will not be noticed.
  ///
  /// _Note:_ Due to a current #link("https://github.com/typst/typst/issues/1747")[limitation of Typst], the errors for TODOs don't show where the TODO function was called.
  ///
  /// -> bool
  fail-on-todo: none,
  /// the content of the thesis
  ///
  /// If you use `#show: thesis-template.with(...)`, then you don't have to explicitly provide this argument. Instead, it is implicitly all the content which follows the `#show` rule:
  /// ```typst
  /// #show: thesis-template.with(
  ///   ...
  /// )
  ///
  /// // ... content of the thesis
  /// ```
  /// -> content
  doc,
) = {
  // Typst has no dedicated 'file path' type yet, see https://github.com/typst/typst/issues/971
  let type-file-path = str
  import "constants.typ": *
  import "impl/arg-validation.typ": *
  check-arg(language, str)
  check-arg(title, arg-type-choice(str, content))
  check-arg(degree, str)
  check-arg(faculty, str)
  check-arg(university, str)
  check-arg(prof-main, str)
  check-arg(prof-second, str)
  check-arg(author, str)
  check-arg(student-id, str)
  // TODO: Maybe use https://typst.app/universe/package/elembic to define the fields of this struct?
  check-arg(signing-data, (
    "location": str,
    // Permit `content` to allow using `todo-content`
    "date": arg-type-choice(datetime, content),
    // Image file path or image
    "signature": arg-type-choice(type-file-path, content),
  ))
  check-arg(restricted, bool)
  check-arg(abstract-de, content)
  check-arg(abstract-en, content)
  // Let Glossarium validate the structure of the entries
  check-arg(acronyms, (arg-any(),))
  // Let Typst validate the bibliography source
  check-arg(bib, arg-any())
  check-arg(fail-on-todo, bool)

  if language != lang-de and language != lang-en {
    panic("unsupported language: " + language)
  }
  set text(lang: language)

  import "impl/helper-functions.typ": set-up-todo
  set-up-todo(fail-on-todo: fail-on-todo)

  import "impl/main-layout.typ": *
  import "impl/frontbackmatter/table-of-elements.typ": (
    table-of-code-listings, table-of-contents, table-of-figures, table-of-tables,
  )
  import "impl/frontbackmatter/acronyms.typ": set-up-acronyms, table-of-acronyms

  set-up-acronyms(acronyms)

  set document(title: title, author: author)

  // Begin page numbering with roman letters
  show: set page(numbering: "(i)")

  // Title page
  import "impl/frontbackmatter/title-page.typ": title-page
  title-page(
    title: title,
    degree: degree,
    faculty: faculty,
    university: university,
    prof-main: prof-main,
    prof-second: prof-second,
    author: author,
    student-id: student-id,
  )

  // Apply layout & formatting
  show: main-layout.with(language: language)

  // Copyright page
  import "impl/frontbackmatter/copyright-page.typ": copyright-page
  copyright-page(title: title, author: author, submission-date: signing-data.date)

  // Declaration
  import "impl/frontbackmatter/declaration.typ": declaration
  declaration(author, signing-data)

  // Blocking notice
  if restricted {
    import "impl/frontbackmatter/blocking-notice.typ": blocking-notice
    blocking-notice()
  }

  let abstract(title, doc, lang) = {
    set text(lang: lang)
    heading(numbering: none, outlined: false, bookmarked: true, title)

    v(1em)

    doc
  }

  // German Abstract (always required regardless of language)
  abstract("Zusammenfassung", abstract-de, lang-de)

  // English Abstract (always required regardless of language)
  abstract("Abstract", abstract-en, lang-en)

  // Various tables
  table-of-contents(language)
  table-of-figures(language)
  table-of-tables(language)
  table-of-code-listings(language)
  table-of-acronyms(language, acronyms)

  // Change page numbering back to normal
  show: set page(numbering: "1")
  counter(page).update(1)

  doc

  bibliography(
    bib,
    title: auto, // use localized title provided by Typst
    // TODO: Workaround until Typst / Hayagriva issues are fixed;
    //   then use built-in "ieee" style and `set cite(style: "alphanumeric")`,
    //   see `main-layout.typ`
    //   Maybe have to keep using custom CSL because it also adds additional information,
    //   e.g. `issued` date for webpages
    style: "impl/ieee-alphanumeric.csl",
  )
}

// TODO: Is this cover page really useful? In which format do copy shops expect this?

/// Function for creating the hardcover of the thesis
///
/// *Usage:*\
/// Create a separate Typst file, e.g. `cover.typ`, and call the function:
///
/// ```typst
/// #import "thesis-template/thesis-template.typ": cover-page
///
/// #cover-page(
///   thesis-type: ...,
///   ...
/// )
/// ```
///
/// Compiling that file will then create the cover page.
///
/// *Important:*
/// - The cover is based on the #link("https://fbi.h-da.de/studium/studienorganisation/studienorganisation-b-sc-informatik/abschlussarbeit")[Documentation for Bachelor theses] (FAQ "Wie muss die Arbeit gebunden sein?"), but as mentioned there *you should clarify the content of the cover with your professor*.
/// - It depends on the copy shop where you are printing your thesis how / in which format they expect the cover page. They might even ask you to enter the information manually on-site. Therefore only use the cover page as rough sketch of how you would want it to look like.
#let cover-page(
  /// type of the thesis (Bachelor's thesis / Master's thesis)
  ///
  /// You can use the thesis template constants for this:
  ///
  /// ```typst
  /// #import "thesis-template/constants.typ": thesis-bachelor
  ///
  /// #cover-page(
  ///   thesis-type: thesis-bachelor,
  ///   ...
  /// )
  /// ```
  ///
  /// _Note:_ Even if the thesis is written in English, the hardcover (and this thesis type name) might have to be in German. Clarify this with your professor to be safe.
  /// -> str
  thesis-type: {
    import "constants.typ": thesis-bachelor
    thesis-bachelor
  },
  /// short title of the thesis
  ///
  /// This can be the same as the title of your thesis, or a shorter variant in case it would be too long for the hardcover.
  ///
  /// _Tip:_ You can use a Typst content value and include explicit line breaks with `\` for greater control over the line wrapping. For example: `[How to write a thesis\ in Typst]`
  ///
  /// _Note:_ Your professor might have preferences / recommendations regarding capitalization of words in the title (especially if the title is in English).
  ///
  /// -> str | content
  short-title: none,
  /// your name
  /// -> str
  author: none,
  /// submission date of the thesis, for example `datetime.today()` or `datetime(year: 2025, month: 1, day: 1)`
  ///
  /// *Important:* This date should be the same you used for the thesis. Be careful when you use `datetime.today()` and compile the documents on different days.
  /// -> datetime
  date: none,
) = {
  import "impl/arg-validation.typ": *
  check-arg(thesis-type, str)
  check-arg(short-title, arg-type-choice(str, content))
  check-arg(author, str)
  check-arg(date, datetime)

  import "constants.typ": lang-de
  import "impl/main-layout.typ": sans-font
  set text(lang: lang-de)
  set page(margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 30mm))

  v(25mm)

  align(center, text(font: sans-font, size: 2.5em, weight: 700, thesis-type))

  align(center, text(font: sans-font, size: 1.7em, weight: 700, short-title))

  v(10mm)

  align(center, text(font: sans-font, size: 1.5em, weight: 700, author))
  align(center, text(font: sans-font, size: 1.5em, weight: 700, date.display("[day].[month].[year]")))
}


// Note: Replace this custom `todo` function once Typst gets a built-in function for that
// or use a third-party package with more functionality?
// see also https://github.com/typst/typst/issues/814

/// Represents a TODO item, without creating any content.
#let todo(
  /// describes the TODO action, for example "reword this section"
  /// -> str
  comment,
) = {
  import "impl/arg-validation.typ": *
  check-arg(comment, str)

  context {
    import "impl/helper-functions.typ": fail-on-todo-state
    let fail-on-todo = fail-on-todo-state.get()
    // Verify that `set-up-todo` had been called before
    assert.eq(type(fail-on-todo), bool)
    if fail-on-todo {
      // TODO: This does not show a stack trace because it is inside `context`, making it difficult
      // to find the location where `todo()` is used, see https://github.com/typst/typst/issues/1747
      panic(
        "unresolved TODO"
          + if comment.len() == 0 {
            ""
          } else {
            ": " + comment
          },
      )
    }
    // else: Consider emitting a warning in the future, see https://github.com/typst/typst/issues/1322
  }
}

/// Creates a TODO element in the output. This is intended as placeholder for missing content.
/// For existing content which has to be adjusted, the function @todo or a regular `// TODO ...` comment
/// might be more suitable.
///
/// -> content
#let todo-content(
  /// provides additional information about the TODO; by default the comment is not included in the output
  /// -> str
  comment: "",
  /// whether the comment should be shown as content
  /// -> bool
  show-comment: false,
) = {
  import "impl/arg-validation.typ": *
  check-arg(comment, str)
  check-arg(show-comment, bool)

  todo(comment)

  strong(text(fill: red, "TODO" + if show-comment { " (" + comment + ")" } else { "" }))
}
