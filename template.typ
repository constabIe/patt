// #import "src/lib.typ": *
#import "@local/patt:0.1.0": *

#show: patt.with(
  title: lorem(3),
  author: "John Doe",
  group: "A113",
  email: "j.doe@email.com",
  date: datetime.today(),
  course: lorem(2),
  topic: lorem(5),
  fontsize: 10pt,
)

#task(
  name: [Problem $XX$.],
  description: [
    #lorem(50) 
  ],
  solution: [
    #lorem(90)
    #answer[#lorem(10)] #vanswer
  ]
)
