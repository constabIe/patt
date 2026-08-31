// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>
//
// Main entry point of the template. Wires together the page setup, the
// styling rules and the header modules.

#import "header.typ": _paperheader, _running-header
#import "rules.typ": _rules

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
) = {
  if body == none {
    return
  }

  set document(
    title: [#course, #title],
    author: author,
    date: date,
  )

  set page(
    paper: "a4",
    header: context {
      if here().page() != 1 {
        _running-header(author: author, course: course)
      }
    },
    numbering: "1",
    number-align: center + bottom,
  )

  show: _rules.with(fontsize: fontsize)

  if documenttitle != none {
    documenttitle
  } else {
    _paperheader(
      title: title,
      date: date,
      author: author,
      group: group,
      email: email,
      course: course,
      topic: topic,
    )
  }

  context v(2.5 / 21 * page.width)

  body
}
