/// Function which applies a custom style to the content
#let custom-style(doc) = {
  // Set background color for code blocks
  show raw.where(block: true): r => {
    rect(fill: rgb(245, 245, 245), r)
  }

  // Adjust how tables are rendered
  show table: t => {
    // Show headers as bold
    show table.cell.where(y: 0): strong

    // Center cell content and avoid excessive large space when text is wrapped
    set table.cell(align: horizon + center)
    set par(justify: false)

    t
  }

  doc
}
