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
  inset: 20pt, [
    #grid(
      columns: (auto),
      rows: (auto),
      [#image("../assets/Logo_KIT.png", width: 115pt)],
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

    #pad(top: 120pt)[
      #align(center,
        [#grid(
          columns: (auto, auto),
          rows: (auto),
          align: (left, left),
          gutter: (10pt, 15pt, 10pt, 15pt, 10pt, 15pt),
          [#text(size: 12pt)[First examiner:]],
          [#text(size: 12pt)[#reviewerOne]],

          { if reviewerTwo != none [#text(size: 12pt)[Second examiner:]] },
          { if reviewerTwo != none [#text(size: 12pt)[#reviewerTwo]] },

          [#text(size: 12pt)[First advisor:]],
          [#text(size: 12pt)[#advisorOne]],

          { if advisorTwo != none [#text(size: 12pt)[Second advisor:]] },
          { if advisorTwo != none [#text(size: 12pt)[#advisorTwo]] },
        )]
      )
    ]
  ]
)

#block(inset: 5pt)[
  #text(
    font: "Liberation Sans",
    size: 8pt
  )[KIT – The Research University in the Helmholtz Association #h(1fr)] #text(font: "Liberation Sans", weight: "bold", size: 22pt)[www.kit.edu]
]