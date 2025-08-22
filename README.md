# h_da FbI Thesis Template

_Unofficial_ thesis template for the Darmstadt University of Applied Sciences ([Hochschule Darmstadt, h_da](https://h-da.de)), department of Computer Science ([Fachbereich Informatik, FbI](https://fbi.h-da.de/)).

This template is written in [Typst](https://typst.app/) — a typesetting tool "designed to be an alternative both to advanced tools like LaTeX and simpler tools like Word and Google Docs" ([Typst documentation](https://typst.app/docs/)).

The template is based on:

- brunoxylo's unofficial [thesis-typst-template](https://github.com/brunoxylo/thesis-typst-template)
- Prof. von Rüden's official LaTeX [thesis-template](https://github.com/mbredel/thesis-template)
- [Documentation for Bachelor theses][fbi-abschlussarbeit-docs] of the h_da department of Computer Science
- Prof. von Rüden's ["Empfehlungen zu Abschlussarbeiten"][fbi-abschlussarbeit-recommendations]

> [!IMPORTANT]\
> Before using this template, clarify with your professor whether they permit usage of Typst and this template, or whether they insist on usage of the official LaTeX template. Also keep in mind that Typst is still a relatively new language, so chances are lower that fellow students or professors can help you in case you encounter problems. On the other hand, Typst might be easier to set up and use than LaTeX and has an [official forum](https://forum.typst.app/) where you can find a lot of information and ask questions.
>
> Also note that professors might have additional requirements or preferences for the layout (though it might not affect grading). For example some professors might prefer large figures to 'float' to the top of pages (can be achieved with [Typst's `figure.placement`](https://typst.app/docs/reference/model/figure/#parameters-placement)). Ask your professor about this, and listen to their feedback when you hand in the first drafts of your thesis.

> [!IMPORTANT]\
> This template tries to follow Prof. von Rüden's "Empfehlungen zu Abschlussarbeiten". If you notice any deviations from these recommendations, from the official requirements, or if a professor tells you that something is missing / wrong with the template, please report it [as issue](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/issues).
>
> To be safe, double check that your thesis fulfills all requirements and recommendations, in case they have changed in the meantime or there is an issue with this template.

> [!NOTE]\
> The thesis template currently only supports one-sided printing. Printing two-sided likely causes undesired results such as incorrect margins.\
> If you are interested in two-sided printing, have a look at [this feature request](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/issues/2). However, you should clarify with your professor if they permit two-sided printing in the first place.

## Usage

### Setting up Typst

There are multiple ways to use Typst:

- [Web App](https://typst.app/pricing/)
- [Command Line Interface (CLI)](https://typst.app/open-source/#download) ([GitHub repository](https://github.com/typst/typst?tab=readme-ov-file#installation))
- [VS Code Extension](https://github.com/Myriad-Dreamin/tinymist/tree/main/editors/vscode#readme) (third-party)

This thesis template is currently not available in the Typst package registry ("Typst Universe"), therefore using the CLI or the VS Code Extension is recommended, but using the Web App might work as well if you manually upload the thesis template to your project.

### Using the template

This thesis template is currently not available in the Typst package registry ("Typst Universe"); the recommended way to use it is to either:

- [Download the GitHub repository as ZIP](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/archive/refs/heads/main.zip), and extract it in a directory called `thesis-template` inside your thesis project directory\
(the ZIP might contain a nested directory with repository and branch name; skip that nested directory and only use its content)

- When using Git: Add the thesis template as Git submodule to your thesis project:

    ```sh
    git submodule add -- https://github.com/Marcono1234/hda-fbi-typst-thesis-template.git thesis-template
    ```

    To update the submodule in the future, use `git submodule update --recursive`. If you clone your thesis Git repository on a different machine, use `git clone --recurse-submodules ...`.

- Use Git to 'download' the thesis template into your current project:

    ```sh
    git clone https://github.com/Marcono1234/hda-fbi-typst-thesis-template.git thesis-template
    ```

    Optional: Afterwards delete the `thesis-template/.git` directory to turn it into regular directory.

    _Note:_ If you are already using Git for your project, the proper approach is to add the template as Git submodule, see the option above. Otherwise you might end up with a Git repository nested within a Git repository, which does not work properly (Git also warns about this on the console).

> [!NOTE]\
> The usage example in the `example` directory contains a symlink. This might cause warnings when extracting the ZIP content of the repository or when adding it as Git submodule. However, to use the template for your own thesis the `example` directory is irrelevant and therefore any warnings related to it can be ignored.

> [!TIP]\
> The [Example](./example/#readme) contains a complete example for how to use the template and how the result looks like.

The recommended directory structure for your thesis looks like the following.

- `thesis-template/`\
  the thesis template directory you set up with the steps above

- `thesis.typ`\
  the main entry point of your thesis; this is the file you compile with Typst

- `package-imports.typ` (optional)\
  single file where you import all packages from [Typst Universe](https://typst.app/universe/), to manage their versions in a single place

- `bibliography.bib` / `bibliography.yml`\
  your bibliography / literature list

- `signature.svg` / `signature.png`\
  image of your handwritten signature

  _Tip:_ If you are using Git and planning to publish the thesis source code later, consider adding the signature file to `.gitignore` to prevent misuse. Though keep in mind that the Git history of your project might include other sensitive information as well.

- `content/`\
  the actual content of your thesis

  - `abstract-de.typ`\
    abstract in German

  - `abstract-en.typ`\
    abstract in English

  - `acronyms.typ` (optional)\
    list of acronyms / abbreviations

  - `chapters/`
    - `01-introduction.typ`
    - `02-...`
    - ...

In `thesis.typ` you then import and apply the thesis template like this:

```typst
#import "thesis-template/thesis-template.typ": thesis-template
#import "thesis-template/constants.typ": degree-bachelor, lang-en

// Set up and apply the thesis template
#show: thesis-template.with(
  language: lang-en,
  title: [Creating a thesis with Typst],
  degree: degree-bachelor,
  ...
)

#include "content/chapters/01-introduction.typ"
#include "content/chapters/02-..."
...
```

Thesis template parameters:\
([generated API documentation](https://marcono1234.github.io/hda-fbi-typst-thesis-template/api-docs.pdf))

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

> [!IMPORTANT]\
> Some parts of the thesis have to be provided in German / English regardless of the language of the thesis. **Do not edit or remove them.** See the [Documentation for Bachelor theses][fbi-abschlussarbeit-docs] of the h_da department of Computer Science.
>
> - no information should be removed from the title page
> - German & English abstract\
>   (if you choose a language other than German or English, you have to add an additional abstract in that language, and possibly tweak the template in other ways)
> - "Eigenständigkeitserklärung" in German
> - "Sperrvermerk" (optional) in German
>
> All of this is automatically applied when you use the thesis template, there should be no need to manually add any of this.

#### Cover

This thesis template also provides a function for creating the content of the hardcover of the thesis, see the `cover-page` function in `thesis-template.typ`. It follows the [Documentation for Bachelor theses][fbi-abschlussarbeit-docs] (FAQ "Wie muss die Arbeit gebunden sein?"), but as mentioned there **you should clarify the content of the cover with your professor**.

> [!NOTE]\
> It depends on the copy shop where you are printing your thesis how / in which format they expect the cover page. They might even ask you to enter the information manually on-site. Therefore only use the cover page as rough sketch of how you would want it to look like.

If you want to create a cover page, it is recommended to create a `cover.typ` file with the following content:

```typst
#import "thesis-template/thesis-template.typ": cover-page

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
```

Compiling that file will then create the cover page. The [Example](./example/#readme) contains an example for this as well.

#### Building the thesis

Assuming you used the project layout recommended above, you can run the following Typst CLI command to build the thesis:

```sh
typst compile thesis.typ
```

This creates the file `thesis.pdf` in the current directory.

(This works the same way for `cover.typ` as well.)

[fbi-abschlussarbeit-docs]: https://fbi.h-da.de/studium/studienorganisation/studienorganisation-b-sc-informatik/abschlussarbeit
[fbi-abschlussarbeit-recommendations]: https://fbi.h-da.de/fileadmin/Group_Dekanat/Dokumente/Studium/Group_Bachelor-Koordinator/BSc/empfehlungen_zu_abschlussarbeiten.pdf
