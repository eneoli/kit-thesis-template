#import "@preview/outrageous:0.4.0"
#import "meta.typ": *

#set document(title: title, author: author, keywords: keywords)

#set page("a4",
  background: if isDraft { rotate(24deg, text(150pt, fill: rgb("dedede66"))[*DRAFT*]) },
)

// Title page
#include "common/cover.typ"
#pagebreak()

#set page("a4", margin: 30mm)
#set text(size: 12pt)

// Address page
#include "address.typ"
#pagebreak()

// Statutory Declaration
#include "common/statutory-declaration.typ"
#pagebreak(to: "odd")

// Begin numbering
#set page(numbering: "i")
#counter(page).update(1)

#set par(justify: true)

// Abstract
#include "abstract.typ"
#pagebreak(to: "odd")

// Table of Contents
#show outline.entry: outrageous.show-entry.with(
  ..outrageous.presets.outrageous-toc,
  fill: (none, line(length: 100%, stroke: (thickness: 1pt, dash: "loosely-dotted"))),
)

#text(size: 18pt, font: "Arial")[*Contents*]
#v(50pt)

#outline(title: none, indent: auto)
#pagebreak(to: "odd")

// Table of Figures
#show outline.entry: outrageous.show-entry.with(
  ..outrageous.presets.outrageous-figures,
)

#text(size: 21pt)[*List of Figures*]
#v(50pt)

#outline(title: "", target: figure.where(kind: image))

#pagebreak(to: "odd")

// Begin Content

#let ht-first = state("page-first-section", [])
#let ht-last  = state("page-last-section", [])

#set page(
  numbering: "1",
  header: context [
    #let loc = here()
    #let text = ""
    #let first-heading = query(heading.where(level: 1)).find(h => h.location().page() == loc.page())
    #let last-heading  = query(heading.where(level: 1)).rev().find(h => h.location().page() == loc.page())

    #if not first-heading == none {
      ht-first.update([
        #counter(heading).at(first-heading.location()).at(0) #first-heading.body
      ])

      ht-last.update([
        #counter(heading).at(last-heading.location()).at(0) #last-heading.body
      ])

      // if one or more headings on the page, do not display header
      text = none
    } else {
      text = ht-last.get()
      // no headings on the page, use last heading from variable
    }

    #if text != none [
      #stack(
        spacing: 0.5em,
        if calc.even(loc.page()) {
          align(left)[#text]
        } else {
          align(right)[#text]
        },
        line(length: 100%, stroke: 0.5pt)
      )
    ] else []
  ]
)

#counter(page).update(1)

#set text(size: 11pt)
#set par(justify: true)
#show heading.where(level: 1): set heading(supplement: [Chapter])
#set figure(gap: 1em)
#show figure.caption: c => [
  #text(weight: "bold")[
    #c.supplement #c.counter.display(c.numbering)
  ]
  #c.separator#c.body
]

#set heading(numbering: "1.1")
#show heading: it => [
  #set text(
    weight: if it.level == 1 {"bold"} else if it.level == 2 {"bold"} else {"semibold"},
    font: "Arial",
    size: if it.level == 1 {18pt} else if it.level == 2 {16pt} else {14pt}
  )
  
  #if it.level == 1 {pagebreak(weak: true, to: "odd"); v(2.5cm)} else if it.level == 3 {v(0.5em)}
  #block(it)
  #if it.level == 1 {v(0.75em)} else if it.level == 2 {v(0.5em)} else {v(0.25em)}
]

#include "content.typ"
