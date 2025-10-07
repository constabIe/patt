// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#import "paperheader.typ": *
#import "features.typ": *

#let margin = (rest: 2.5cm)
#let leading = 0.65em

#let patt(
  title: [Title],
  author: "Firstname Lastname",
  email: "f.lastname@innopolis.university",
  group: "Group",
  date: datetime.today(),
  course: none,
  topic: none,
  bibliography: none,
  fontsize: 11pt,
  body,
) = {
  // <------------------=| Global variables |=------------------->
  let page_header = [
    #course #h(1fr) #text[#author]
    #v(-.77em)
    #line(length: 100%, stroke: .5pt)
  ]

  let margin = margin
  let leading = leading

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
    numbering: (ns, c) => {
      if ns != 1 {
        ns
      } else {
        ""
      }
    },
    number-align: center + bottom,
  )

  set text(
    font: "New Computer Modern",
    size: fontsize,
    lang: "en",
  )
  
  show heading: set block(above: 1.4em, below: 1em)

  set par(
    justify: true,
    linebreaks: "optimized"
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

  // <------------------=| Main content |=------------------->
  if body != none {  
    paperheader(
      title: title,
      date: date,
      author: author,
      group: group,
      email: email,
      course: course,
      topic: topic,
      margin: margin,
      leading: leading,
    )
    
    body
    
    if bibliography != none {
      pagebreak(weak: true)
      bibliography
    }
  }  
}
