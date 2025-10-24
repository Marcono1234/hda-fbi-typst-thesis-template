# API documentation

Documentation for the `thesis-template` function. An automatically generated variant of this API documentation is also [available as PDF](https://marcono1234.github.io/hda-fbi-typst-thesis-template/api-docs.pdf).

Usage:

```typst
#import "thesis-template/thesis-template.typ": thesis-template

// Set up and apply the thesis template
#show: thesis-template.with(
  language: ...,
  ...
)

// Content of the thesis
...
```

Function parameters:

- `language` (`str`)\
  language of the thesis, can be either German (`"de"`) or English (`"en"`)\
  You can use the thesis template constants for this:

  ```typst
  #import "thesis-template/constants.typ": lang-en

  #show: thesis-template.with(
    language: lang-en,
    ...
  )
  ```

- `title` (`str` | `content`)\
  title of the thesis

- `degree` (`str`)\
  type of degree you are pursuing (Bachelor / Master); shown on the title page\
  You can use the thesis template constants for this:

  ```typst
  #import "thesis-template/constants.typ": degree-bachelor

  #show: thesis-template.with(
    degree: degree-bachelor,
    ...
  )
  ```

- `faculty` (`str`)\
  default: "Fachbereich Informatik"\
  _Note:_ Don't translate this when writing the thesis in English; it is shown on the title page which is usually always in German, regardless of language.

- `university` (`str`)\
  default: "Hochschule Darmstadt"\
  _Note:_ Don't translate this when writing the thesis in English; it is shown on the title page which is usually always in German, regardless of language.

- `prof-main` (`dictionary`)\
  your main professor ('Referent' / 'Referentin'):

  - `name` (`str`)\
    full name of the professor, e.g. "Prof. Dr. Jane Doe"

  - `female` (`bool`)\
    whether to use the female ("Referentin") or the male ("Referent") noun

- `prof-second` (`dictionary`)\
   your second professor ('Korreferent' / 'Korreferentin'):

  - `name` (`str`)\
     full name of the professor, e.g. "Prof. Dr. Jane Doe"

  - `female` (`bool`)\
     whether to use the female ("Korreferentin") or the male ("Korreferent") noun

- `author` (`str`)\
  your name

- `student-id` (`str`)\
  your student ID

- `signing-data` (`dictionary`)\
  submission / signing data:

  - `location` (`str`)\
    for example "Darmstadt"

  - `date` (`datetime`)\
    for example `datetime.today()` or `datetime(year: 2025, month: 1, day: 1)`

  - `signature` (`str` | `content`)\
    image of your handwritten signature; used for the "Eigenständigkeitserklärung"\
    Can be either:
    - (recommended) a file path, absolute to the Typst compile root (that is, a path starting with `/`), for example `/signature.svg` or `/signature.png`
    - an image, for example `image("my-signature.svg")` (in this case you manually have to set the proper image size, for example `height: 2.5em`)

    The image should consist only of the signature, ideally with transparent / white background and without excessive whitespace around it.

- `restricted` (`bool`)\
  default: `false`\
  whether the thesis should include a blocking notice ("Sperrvermerk"); this might be the case when it contains sensitive information

  **Important:** You should talk to your professor (and when you did your work at a company, also with your supervisor there) whether you should add a "Sperrvermerk". If so, you have to request it when registering your thesis (it is part of the registration form). It might also be possible to request this afterwards, clarify this with your professor.

- `abstract-de` / `abstract-en` (`content`)\
  the text of your abstract in German / English (note that _both_ have to be provided, regardless of the language of the thesis)

  You can write this content in a separate file and then use Typst's `include` to include it:

  ```typst
  #show: thesis-template.with(
    abstract-de: include "content/abstract-de.typ",
    ...
  )
  ```

- `acronyms` (`array`)\
  optional list of acronyms / abbreviations; uses the [Glossarium](https://typst.app/universe/package/glossarium/) package (see its documentation for the expected format)

  You can write the acronyms list in a separate file and define it for example as `#let acronyms = ( ... )` and then use Typst's `import` to include it:

  ```typst
  #show: thesis-template.with(
    acronyms: {
      import "content/acronyms.typ": acronyms
      acronyms
    },
    ...
  )
  ```

- `bib` (`str`)\
  file path to the bibliography / literature list, absolute to the Typst compile root (that is, a path starting with `/`)\
  The bibliography supports these formats:
  - BibLaTeX (for example `/bibliography.bib`)
  - [Hayagriva format](https://github.com/typst/hayagriva/blob/main/docs/file-format.md) (for example `/bibliography.yml`)
  
  BibLaTeX can be converted to Hayagriva using the [Hayagriva CLI](https://github.com/typst/hayagriva/?tab=readme-ov-file#installation) with `hayagriva literature.bib`.\
  See the [Typst documentation](https://typst.app/docs/reference/model/bibliography/) for more information.

- `fail-on-todo` (`bool`)\
  whether to fail if any TODO function calls are still in the document\
  The thesis template offers the custom `todo` and `todo-content` functions which you can use as placeholder or reminder for content which you have not written yet or want to rework later. See the [Example](./example/#readme) for how to use them.

  **Important:** While these TODO functions can be helpful, don't fully rely on them and instead manually check at the end that you did not overlook any TODOs.\
  Note also that `fail-on-todo` only affects reachable TODOs; if you have a TODO function call in a file but forget to include that file in the thesis, that TODO will not be noticed.
