#import "../lib.typ": *

#let webpage(filename, page-title, body) = {
  document(filename, title: page-title)[
    #set heading(numbering: "1.", bookmarked: false)
    #css.init
    #js.init
    #html.elem("nav", attrs: (id: "sidebar"))[
      #outline(target: heading.where(bookmarked: false, outlined: true))
    ]
    #floating-toc
    #html.elem("main", attrs: (id: "content"))[
      #topbar(pdf-path: "ag.pdf")
      #body
    ]

  ]
}