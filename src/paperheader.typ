// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#import "@preview/icu-datetime:0.2.0" as icu

#let paperheader(
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
