#let declaration(author, signing-data) = {
  import "../../constants.typ": lang-de
  set text(lang: lang-de)

  heading(numbering: none, outlined: false, bookmarked: true, "Erklärung")

  v(1em)

  // Must be in German, regardless of language of thesis
  // Based on https://github.com/mbredel/thesis-template/blob/master/frontbackmatter/Declaration.tex
  // (which is based on https://h-da.de/fileadmin/h_da/Hochschule/Presse_Publikationen/Hochschulanzeiger/2019/ABPO_AEnderung_2019-07-02.pdf "Anlage 4: Plagiate"?)
  [
    Ich versichere hiermit, dass ich die vorliegende Arbeit selbstständig verfasst und keine anderen als die im Literaturverzeichnis angegebenen Quellen benutzt habe. \
    #v(0.1em)
    Alle Stellen, die wörtlich oder sinngemäß aus veröffentlichten oder noch nicht veröffentlichten Quellen entnommen sind, sind als solche kenntlich gemacht. \
    #v(0.1em)
    Die Zeichnungen oder Abbildungen in dieser Arbeit sind von mir selbst erstellt worden oder mit einem entsprechenden Quellennachweis versehen. \
    #v(0.1em)
    Diese Arbeit ist in gleicher oder ähnlicher Form noch bei keiner anderen Prüfungsbehörde eingereicht worden. \
  ]

  v(5mm)

  import "../helper-functions.typ": format-date-de
  let signing-date = format-date-de(signing-data.date)
  align(left, text(style: "italic", signing-data.location + ", " + signing-date))

  // Signature can be provided either as content (for custom styling) or as image path
  let signature-data = signing-data.signature
  let signature-image = if type(signature-data) == content { signature-data } else {
    image(signature-data, height: 2.5em)
  }
  let signature = pad(3pt, signature-image)

  align(
    right,
    pad(
      right: 20pt,
      grid(
        align(center, signature),
        grid.hline(),
        v(7pt),
        align(center, author),
      ),
    ),
  )
}
