#import "../css/mod.typ" as css
#import "../js/mod.typ" as js

#import "../components/floating-toc.typ": floating-toc
#import "../components/topbar.typ": topbar

#let webpage(filename, page-title, pdf-path: "book.pdf", body) = {
  document(filename, title: page-title)[
    #html.head([
      #html.link(rel: "icon", href: "images/favicon.svg", type: "image/svg+xml")
      #html.link(rel: "icon", href: "images/favicon.ico", type: "image/x-icon")
    ])
    #set heading(numbering: "1.", bookmarked: false)
    #css.init
    #js.init
    #html.elem("nav", attrs: (id: "sidebar"))[
      #outline(target: heading.where(bookmarked: false, outlined: true), depth: 2)
    ]
    #floating-toc
    #html.elem("main", attrs: (id: "content"))[
      #topbar(pdf-path: pdf-path)
      #body
    ]

  ]
}