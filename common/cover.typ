#import "../meta.typ": *

#set page(
  margin: 30pt,
)

#rect(
  width: 100%,
  height: 95%,
  radius: (
    top-right: 15pt,
    bottom-left: 15pt,
  ), 
  stroke: rgb("#8a8a8a") + 1pt,
  inset: 1cm, [
    #grid(
      columns: (auto),
      rows: (auto),
      [#image("../assets/Logo_KIT.svg", width: 115pt)],
    )

    #pad(top: 75pt)[
      #align(center)[
        #block(width: 75%)[
          #text(font: "Liberation Sans", weight: "bold", size: 24pt)[#title]
        ]
      ]
    ]

    #pad(top: 45pt)[
      #align(center)[
        #block(width: 50%)[
            #text(size: 12pt)[#thesisType #linebreak() of]
          ]
      ]
    ]

    #pad(top: 30pt)[
      #align(center)[
        #text(font: "Liberation Sans", weight: "bold", size: 18pt)[#author]
      ]
    ]

    #pad(top: 30pt)[
      #align(center)[
        #text(size: 12pt)[
          at the Department of #department#linebreak()#institute
        ]
      ]
    ]

    #pad(top: 50pt)[
      #align(center,
        [#grid(
          columns: (auto, auto),
          rows: (auto),
          align: (left, left),
          column-gutter: 5em,
          row-gutter: 1em,
          [#text(size: 12pt)[First Reviewer:]],
          [#text(size: 12pt)[#reviewerOne]],

          { if reviewerTwo != none [#text(size: 12pt)[Second Reviewer:]] },
          { if reviewerTwo != none [#text(size: 12pt)[#reviewerTwo]] },

          grid.cell(colspan: 2, v(1em)),

          {if advisorTwo == none [#text(size: 12pt)[Advisor:]] else [#text(size: 12pt)[First Advisor:]]},
          [#text(size: 12pt)[#advisorOne]],

          { if advisorTwo != none [#text(size: 12pt)[Second Advisor:]] },
          { if advisorTwo != none [#text(size: 12pt)[#advisorTwo]] },
        )]
      )
    ]
    #pad(top: 40pt)[
      #align(center)[
        #grid(
          columns: (auto, auto),
          rows: (auto),
          column-gutter: 2.5em,
          align: (left, right),
          [Completion period:],
          [#completionPeriod],
        )
      ]
    ]
  ]
)

#block(inset: 5pt)[
  #text(
    font: "Liberation Sans",
    size: 8pt
  )[KIT – The Research University in the Helmholtz Association #h(1fr)] #text(font: "Liberation Sans", weight: "bold", size: 22pt)[www.kit.edu]
]