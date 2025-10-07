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
    column-gutter: .55em,
    align: (center + horizon, left),
    text(weight: "bold", style: "italic")[Answer.],
    rect(stroke: .5pt, body),
  )
}