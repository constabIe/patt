// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

#import "@preview/icu-datetime:0.1.2": fmt-date

#let paper-header(
  title: none,
  date: datetime.today(),
  author: none,
  group: none,
  email: none,
  course: none,
  topic: none,
  margin: (rest: 2.5cm),
  spacing: .65em,
) = {
  line(length: 100%)
  
  v(spacing * 2)
  text(size: 20pt, weight: "bold", title)
  h(1fr)
  text(style: "italic", (author, group).join(", "))
  linebreak()
  text(font: "New Computer Modern")[
    #fmt-date(date, locale: "en", length: "medium")
  ]
  h(1fr)
  text(style: "italic", email)
  
  v(spacing * 2)
    grid(
      rows: 2,
      columns: 2,
      row-gutter: .65em,
      column-gutter: .5em,
      [#text(style: "italic")[Course:]], [#course],
      [#text(style: "italic")[Topic:]], [#topic],
    )
  v(spacing * 2)
  
  line(length: 100%)
  
  v(margin.rest)
}