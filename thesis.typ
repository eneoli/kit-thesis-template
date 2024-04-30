#import "@preview/outrageous:0.1.0"
#import "meta.typ": *

#set document(title: title, author: author, keywords: keywords)

#set page("a4",
  background: if isDraft { rotate(24deg, text(150pt, fill: rgb("dedede66"))[*DRAFT*]) },
)

// Title page
#include "common/cover.typ"
#pagebreak()

#set page("a4", margin: 30mm)
#set text(size: 12pt, font: "Computer Modern")

// Address page
#include "address.typ"
#pagebreak()

// Statutory Declaration
#include "common/statutory-declaration.typ"
#pagebreak(to: "odd")

// Begin numbering
#set page(numbering: "i")
#counter(page).update(1)

// Abstract
#include "abstract.typ"
#pagebreak(to: "odd")

// Table of Contents

#show outline.entry: outrageous.show-entry.with(
  ..outrageous.presets.outrageous-toc,
  font: "Computer Modern",
  fill: (none, line(length: 100%, stroke: (thickness: 1pt, dash: "loosely-dotted"))),
)

#text(size: 21pt)[*Contents*]
#v(50pt)

#outline(title: none)
#pagebreak(to: "odd")

// Table of Figures

#show outline.entry: outrageous.show-entry.with(
  ..outrageous.presets.outrageous-figures,
  font: "Computer Modern",
)

#text(size: 21pt)[*List of Figures*]
#v(50pt)

#outline(title: "", target: figure.where(kind: image))
#pagebreak(to: "odd")

// Begin Content

#show heading.where(level: 1): it => [
    #pagebreak(weak: true)
    #it
]

#set heading(numbering: "1.1")

#let ht-first = state("page-first-section", [])
#let ht-last = state("page-last-section", [])

#set page(
  numbering: "1",
  header: locate(
        loc => [
            #let text = ""
            #let first-heading = query(heading.where(level: 1), loc).find(h => h.location().page() == loc.page())
            #let last-heading = query(heading.where(level: 1), loc).rev().find(h => h.location().page() == loc.page())
            #{
              if not first-heading == none {
                ht-first.update([
                  #counter(heading).at(first-heading.location()).at(0) #first-heading.body
                ])
                ht-last.update([
                  #counter(heading).at(last-heading.location()).at(0) #last-heading.body
                ])
                // if one or more headings on the page, use first heading
                text = ht-last.display()
              } else {
                text = ht-last.display()
                // no headings on the page, use last heading from variable
              }
              [
                #stack(
                  spacing: 0.5em,
                  if calc.even(loc.page()) {
                    align(left)[#text]
                  } else {
                    align(right)[#text]
                  },
                    line(length: 100%)
                )
              ]
          }
        ]
    )
)
#counter(page).update(1)

#include "content.typ"