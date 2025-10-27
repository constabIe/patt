// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

// <------------------=| Functions |=------------------->

#let task(
  name: "Task.",
  description: none,
  solution: none,
  newpage: true,
) = context {
  if description != none {
    block(width: 100%)[
      #if name != none [
        #text(weight: "bold")[#name$quad$]
      ]
      #description
    ]

    if solution != none {
      v(-2 * par.leading)
      linebreak()
      line(
        length: 100%,
        stroke: (thickness: .25pt, dash: (6.21pt, 6.21pt)),
      )
      linebreak()
      v(-2 * par.leading)
      block(width: 100%)[
        #text(weight: "bold", style: "italic")[Solution.$space$] #solution #h(1fr) $qed$
      ]

      if newpage {
        pagebreak(weak: true)
      }
    }
  }
}

#let answer(body) = {
  grid(
    columns: 2,
    column-gutter: .75em,
    align: (center + horizon, auto),
    text(weight: "bold", style: "italic")[Answer.], rect(stroke: .5pt, body),
  )
}

#let vanswer = context v(-2 * par.spacing)
