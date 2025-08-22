# Usage example

This directory shows how the thesis template can be used. It also highlights some of Typst's functionality. However, if you are new to Typst it is highly recommended to have a look at the [Typst documentation](https://typst.app/docs/) as well. It is pretty extensive, contains examples and a tutorial.

The entrypoints are [`thesis.typ`](./thesis.typ) (for the thesis) and [`cover.typ`](./cover.typ) (for the hardcover content).\
`thesis-template` contains the content of the template, that is, the content of the root directory of this repository.

> [!TIP]\
> Have a look at the generated PDF files here:
> - [thesis](https://marcono1234.github.io/hda-fbi-typst-thesis-template/examples/thesis.pdf)
> - [cover](https://marcono1234.github.io/hda-fbi-typst-thesis-template/examples/cover.pdf)

> [!IMPORTANT]\
> This example is only intended to show how the thesis template can be used. Do not use it as reference for how to structure your thesis; instead have a look at Prof. von Rüden's ["Empfehlungen zu Abschlussarbeiten"][fbi-abschlussarbeit-recommendations] and the material from the Scientific Writing courses (Prof. Zander provides [some of it publicly](https://zander-swcs.netlify.app/)) or talk to your professor if you are unsure about something.

> [!NOTE]\
> To mimic how real usage of the template would look like, this example includes the template in the `thesis-template` directory. However, to avoid code duplication in this repository, that directory is simply a symlink with target `..`.\
This symlink might cause problems when cloning the Git repository, especially on Windows (see related [Stack Overflow answer](https://stackoverflow.com/a/59761201)), or for tools and editors due to the recursive symlink (`example -> thesis-template -> example -> ...`). If this causes issues for you, simply delete the `thesis-template` file / directory, create a new directory with that name and copy the contents of the root directory of this repository there (Git might report untracked files then, but for this example that can be ignored).

## Building the thesis PDF

Within this `example` directory, run:

```sh
typst compile thesis.typ
```

This creates a file named `thesis.pdf` in the current directory.

(This works the same way for `cover.typ` as well.)

## IDE setup

When using the [Tinymist VS Code extension](https://github.com/Myriad-Dreamin/tinymist/tree/main/editors/vscode#readme) (third-party), do the following:\
Open [`thesis.typ`](./thesis.typ), then run the command "> Typst Preview: Preview Opened File" or "> Typst: Export the Opened File as PDF".

[fbi-abschlussarbeit-recommendations]: https://fbi.h-da.de/fileadmin/Group_Dekanat/Dokumente/Studium/Group_Bachelor-Koordinator/BSc/empfehlungen_zu_abschlussarbeiten.pdf
