// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>
//
// Private module: everything related to page and document headers.

#import "@preview/icu-datetime:0.2.2" as icu

// Running header shown at the top of every page except the first one.
#let _running-header(
  author: none,
  course: none,
) = [
  #course #h(1fr) #text[#author]
  #v(-.77em)
  #line(length: 100%, stroke: .5pt)
]

// Title block rendered at the top of the first page.
#let _paperheader(
  title: none,
  date: none,
  author: none,
  group: none,
  email: none,
  course: none,
  topic: none,
) = context {
  line(length: 100%)

  v(par.spacing)
  grid(
    columns: (1fr, 1fr),
    rows: 2,
    column-gutter: .55em,
    align: (left + horizon, right),
    [
      #text(size: 2em, weight: "bold", title)
    ],
    [
      #grid(
        columns: 2,
        align: (left, left),
        gutter: .55em,
        [Date: ], [#icu.fmt(date, locale: "en-US", length: "long")],
        [Name: ], [#author],
        [Group: ], [#group],
        [Email: ], [#email],
      )
    ],
  )

  if course != none and topic != none {
    v(par.spacing)

    grid(
      rows: 2,
      columns: 2,
      gutter: .55em,
      [Course:], [#course],
      [Topic:], [#topic],
    )
  }

  v(par.spacing)

  line(length: 100%)
}
