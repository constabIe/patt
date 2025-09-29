// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#import "paperheader.typ": *

#let margin = (rest: 2.5cm)
#let spacing = 0.65em

#let tty(
  title: [Assignment],
  author: "Firstname Lastname",
  email: "f.lastname@innopolis.university",
  group: "Group",
  date: datetime.today(),
  course: [Physics I (Mechanics)],
  topic: [Kinematics],
  bibliography: none,
  body,
) = {
  // <------------------=| Global variables |=------------------->
  let page_header = [
    #course #h(1fr) #text(style: "italic")[#author]
    #v(-8.5pt)
    #line(length: 100%, stroke: .5pt)
  ]

  let margin = margin
  let spacing = spacing

  // <------------------=| Format rules |=------------------->
  set document(
    title: [#course, #title],
    author: author,
    date: date,
  )

  set page(
    paper: "a4",
    margin: margin,
    header: context {
      if (here().page() != 1) { page_header }
    },
    numbering: "1",
    number-align: bottom + center,
  )

  set text(
    font: "New Computer Modern",
    size: 10pt,
    lang: "en",
  )

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
    numbering: "(a)",
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

  // Display block code in a larger block
  // with more padding.
  show raw.where(block: true): block.with(
    fill: luma(240),
    inset: 10pt,
    radius: 4pt,
  )

  // <------------------=| Paper header |=------------------->
  paper-header(
    title: title,
    date: date,
    author: author,
    group: group,
    email: email,
    course: course,
    topic: topic,
  )
  body

  if bibliography != none {
    pagebreak()
    bibliography
  }
}

// <------------------=| Functions |=------------------->

#let task(
  name: "Task.",
  description: none,
  solution: none,
  newpage: true,
) = {
  if description != none {
    block(width: 100%)[
      #if name != none [
        #text(weight: "bold")[#name$space$]
      ]
      #description
    ]

    if solution != none {
      v(-1.2em)
      linebreak()
      line(
        length: 100%,
        stroke: (thickness: .25pt, dash: (6.21pt, 6.21pt)),
      )
      linebreak()
      v(-1.2em)
      block(width: 100%)[
        #text(weight: "bold", style: "italic")[Solution.$space$] #solution #h(1fr) $qed$
      ]

      if newpage {
        pagebreak(weak: true)
      } else {
        for i in range(1, 5) { linebreak() }
      }
    } else {
      for i in range(1, 5) { linebreak() }
    }
  }
}

#let answer-sing = text(weight: "bold", style: "italic")[Answer.]

#let answer(body) = {
  grid(
    columns: 2,
    column-gutter: spacing,
    align: (center + horizon, left),
    text(weight: "bold", style: "italic")[Answer.], rect(stroke: .5pt, body),
  )
}
