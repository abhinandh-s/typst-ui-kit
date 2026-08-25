#import "/src/lib.typ": *

#webpage("index.html", [Home])[
  #title()
  #outline(target: heading.where(bookmarked: false, outlined: true))
  #include "features.typ"
  #link(<pdf>)[single PDF].

  #nav(none, <text>)
] <home>

#webpage("text.html", [Text Formating])[
  #title()
  #include "text.typ"
  #nav(<home>, none)
] <text>

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


#font.export("FiraCode-Regular")