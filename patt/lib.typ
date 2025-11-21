// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#import "paperheader.typ": *
#import "features.typ": *

#let patt(
  title: [Title],
  author: "Firstname Lastname",
  email: "f.lastname@innopolis.university",
  group: "Group",
  date: datetime.today(),
  course: none,
  topic: none,
  documenttitle: none,
  fontsize: 11pt,
  body,
) = context {
  if body != none {
    let page_header = [
      #course #h(1fr) #text[#author]
      #v(-.77em)
      #line(length: 100%, stroke: .5pt)
    ]
    
    set document(
      title: [#course, #title],
      author: author,
      date: date,
    )
    
    set page(
      paper: "a4",
      header: context {
        if (here().page() != 1) { page_header }
      },
      numbering: "1",
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
    
    if documenttitle != none {
      documenttitle
    } else {
      paperheader(
        title: title,
        date: date,
        author: author,
        group: group,
        email: email,
        course: course,
        topic: topic,
      )
    }
    v(2.5 / 21 * page.width)
    
    body
  }
}
