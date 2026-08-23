#import "/src/lib.typ": add, checklist

#let html-page(filename, page-title, body) = {
  document(filename, title: page-title)[
    #set heading(numbering: "1.", bookmarked: false)
    #html.elem("nav", attrs: (id: "sidebar"))[
      #outline(target: heading.where(bookmarked: false, outlined: true))
    ]
    // Main Content Container
    #html.elem("main", attrs: (id: "content"))[
      #body
    ]
  ]
}

#html-page("index.html", [Home])[
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))
  #include "features.typ"
  #link(<pdf>)[single PDF].
] <home>

#document("ag.pdf", title: [Full Book])[
  #set page(paper: "a4", margin: 2.5cm)
  #set text(size: 11pt)
  #include "features.typ"

= Addition Example

The sum of $4$ and $7$ is:
#rect(fill: luma(240), inset: 8pt)[
  $4 + 7 = #add(4, 7)$
]

#show: checklist

- [ ] Unchecked item
- [x] Checked item
] <pdf>
