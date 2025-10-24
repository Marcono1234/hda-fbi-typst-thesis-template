# h_da FbI Thesis Template

_Unofficial_ thesis template for the Darmstadt University of Applied Sciences ([Hochschule Darmstadt, h_da](https://h-da.de)), department of Computer Science ([Fachbereich Informatik, FbI](https://fbi.h-da.de/)).

This template is written in [Typst](https://typst.app/) — a typesetting tool "designed to be an alternative both to advanced tools like LaTeX and simpler tools like Word and Google Docs" ([Typst documentation](https://typst.app/docs/)).

The template is based on:

- brunoxylo's unofficial [thesis-typst-template](https://github.com/brunoxylo/thesis-typst-template)
- Prof. von Rüden's official LaTeX [thesis-template](https://github.com/mbredel/thesis-template)
- [Documentation for Bachelor theses][fbi-abschlussarbeit-docs] of the h_da department of Computer Science
- Prof. von Rüden's ["Empfehlungen zu Abschlussarbeiten"][fbi-abschlussarbeit-recommendations]

> [!IMPORTANT]\
> Before using this template, clarify with your professor whether they permit usage of Typst and this template, or whether they insist on usage of the official LaTeX template.

## Repository structure

- [`template/`](./template/)\
  The actual template source.
- [`example/`](./example/)\
  Example usage of the template.

## Usage

### Setting up Typst

Required Typst version: 0.14.0 or newer

There are multiple ways to use Typst:

- [Web App](https://typst.app/pricing/)
- [Command Line Interface (CLI)](https://typst.app/open-source/#download) ([GitHub repository](https://github.com/typst/typst?tab=readme-ov-file#installation))
- [VS Code Extension](https://github.com/Myriad-Dreamin/tinymist/tree/main/editors/vscode#readme) (third-party)

This thesis template is currently not available in the Typst package registry ("Typst Universe"), therefore using the CLI or the VS Code Extension is recommended, but using the Web App might work as well if you manually upload the thesis template to your project.

### Using the template

> [!TIP]\
> The [Example](./example/#readme) contains a complete example for how to use the template and how the result looks like.

This thesis template is currently not available in the Typst package registry ("Typst Universe"); the recommended way to use the template is to either:

- [Download the GitHub repository as ZIP](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/archive/refs/heads/main.zip), and extract the content of the `template` directory in a directory called `thesis-template` inside your thesis project directory\
(the ZIP might contain a nested directory with repository and branch name; skip that nested directory and only use its content)

- When using Git: Add the thesis template as Git submodule to your thesis project:

    ```sh
    git submodule add -- https://github.com/Marcono1234/hda-fbi-typst-thesis-template.git thesis-template
    ```

    When using this approach your imports have to import from `thesis-template/template/...`.\
    To update the submodule in the future, use `git submodule update --recursive` in the root of your project. If you clone your thesis Git repository on a different machine, use `git clone --recurse-submodules ...`.

- Use Git to clone the thesis template into your current project:

    ```sh
    git clone https://github.com/Marcono1234/hda-fbi-typst-thesis-template.git thesis-template
    ```

    When using this approach your imports have to import from `thesis-template/template/...`.

    _Note:_ If you are already using Git for your project, the proper approach is to add the template as Git submodule, see the option above. Otherwise you might end up with a Git repository nested within a Git repository, which does not work properly (Git also warns about this on the console).

> [!NOTE]\
> This project contains a symlink in the `example` directory, which can cause warnings when extracting the ZIP content of the repository or when cloning it with Git. These warnings can be ignored because the `example` directory is irrelevant when using the template for your own thesis.

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

See the [API documentation](./api-docs.md) for the details about the `thesis-template` function parameters.

> [!IMPORTANT]\
> This template tries to adhere to the requirements of the university.
> For example some parts of the thesis have to be provided in German or English regardless of the language of the thesis.
> Do not edit or remove parts from the template unless you are sure that they incorrect. Please report any deviations from the requirements [as issue](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/issues).

#### Cover

This thesis template also provides a function for creating the content of the hardcover of the thesis, see the `cover-page` function in `thesis-template.typ`. It follows the [Documentation for Bachelor theses][fbi-abschlussarbeit-docs] (FAQ "Wie muss die Arbeit gebunden sein?"), but as mentioned there you should clarify the content of the cover with your professor.

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

### Building the thesis

Assuming you used the project layout recommended above, you can run the following Typst CLI command to build the thesis:

```sh
typst compile thesis.typ
```

This creates the file `thesis.pdf` in the current directory.

(This works the same way for `cover.typ` too, in case you are [using the cover template as well](#cover).)

## Limitations

- Typst is still a relatively new language, so chances are lower that fellow students or professors can help you in case you encounter problems. On the other hand, Typst might be easier to set up and to use than LaTeX. It also has an [official forum](https://forum.typst.app/) where you can find lots of information and ask questions.

- Professors might have additional requirements or preferences for the layout. For example some professors might prefer large figures to 'float' to the top of pages (can be achieved with [Typst's `figure.placement`](https://typst.app/docs/reference/model/figure/#parameters-placement)). Ask your professor about their preferences and whether it affects grading, and listen to their feedback when you hand in the first drafts of your thesis.

- This template tries to adhere to the official [recommendations][fbi-abschlussarbeit-recommendations] and [requirements][fbi-abschlussarbeit-docs] for theses at the FbI of the h_da. However, these requirements might change over time. If you notice any deviations from the recommendations, from the requirements, or if a professor tells you that something is missing or something is wrong with the template, please report it [as issue](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/issues).

  To be safe, double check that your thesis fulfills all current recommendations and requirements, in case they have changed in the meantime or there is something wrong with this template.

- This template currently only supports one-sided printing. Printing two-sided likely causes undesired results such as incorrect margins.\
If you are interested in two-sided printing, have a look at [this feature request](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/issues/2). However, you should clarify with your professor if they permit two-sided printing in the first place. Two-sided printing is only [recommended][fbi-abschlussarbeit-recommendations] when the thesis has a large number of pages (section "2.2.1 Seitenformat").

- This template is currently mainly intended for Bachelor theses. While it might fulfill the requirements for Master theses as well, this is not guaranteed. If you are using it for a Master's thesis, please provide feedback [under this issue](https://github.com/Marcono1234/hda-fbi-typst-thesis-template/issues/3).

[fbi-abschlussarbeit-docs]: https://fbi.h-da.de/studium/studienorganisation/studienorganisation-b-sc-informatik/abschlussarbeit
[fbi-abschlussarbeit-recommendations]: https://fbi.h-da.de/fileadmin/Group_Dekanat/Dokumente/Studium/Group_Bachelor-Koordinator/BSc/empfehlungen_zu_abschlussarbeiten.pdf
