// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#let _rules(
  fontsize: 11pt,
  body,
) = {
  set text(
    font: "New Computer Modern",
    size: fontsize,
    lang: "en",
  )

  show heading: set block(above: 1.4em, below: 1em)

  set par(
    justify: true,
    linebreaks: "optimized",
  )

  set list(
    indent: .8em,
    spacing: 1em,
  )

  set enum(
    indent: .8em,
    spacing: 1em,
    numbering: "(1)",
  )

  set table(
    stroke: .5pt + black,
    align: center + horizon,
  )

  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )

  show link: set text(fill: blue)
  show link: underline

  body
}
