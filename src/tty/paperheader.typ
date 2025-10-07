// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#import "@preview/icu-datetime:0.2.0" as icu

#let paperheader(
  title: none,
  date: datetime.today(),
  author: none,
  group: none,
  email: none,
  course: none,
  topic: none,
  margin: (rest: 2.5cm),
  leading: .65em,
) = {
  let top-bottom-indent = 1.2em

  v(2 * top-bottom-indent)
  line(length: 100%)

  v(top-bottom-indent)
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
    v(top-bottom-indent)

    grid(
      rows: 2,
      columns: 2,
      gutter: .55em,
      [Course:], [#course],
      [Topic:], [#topic],
    )
  }

  v(top-bottom-indent)

  line(length: 100%)

  v(2 * top-bottom-indent + margin.rest)
}
