// (c) 2025 Almir Avhadiev <almir.avhadiev@gmail.com>

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
        #text(weight: "bold")[#name$quad$]
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
        #text(weight: "bold", style: "italic")[Solution.$thick$] #solution #h(1fr) $qed$
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
    column-gutter: leading,
    align: (center + horizon, left),
    text(weight: "bold", style: "italic")[Answer.], rect(stroke: .5pt, body),
  )
}