#let prev(target) = link(target)[
  #html.elem("div", attrs: (class: "nav-btn"))[#icon-prev]
]

#let next(target) = link(target)[
  #html.elem("div", attrs: (class: "nav-btn"))[#icon-next]
]

#let nav(p, n) = html.elem("div", attrs: (class: "bottom-nav"))[
  #if p != none [ #prev(p) ] else [ #html.elem("span")[] ]
  #if n != none [ #next(n) ] else [ #html.elem("span")[] ]
]