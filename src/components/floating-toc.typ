#let _fw-header = html.elem("div", attrs: (class: "fw-header"))[
      #html.h2()[Table of Contents]
      #html.button(class: "fw-close", id: "fwClose")[✕]
]
#let _fw-progress-track = html. elem("div", attrs: (class: "fw-progress-track"))[
      #html.elem("div", attrs: (class: "fw-progress-bar", id: "fwProgressBar"))
]
#let _fw-body = html.elem("div", attrs: (class: "fw-body", id: "fwBody"))[
        #outline(target: heading.where(bookmarked: false, outlined: true), depth: 2)
]
#let _floating-window = html.elem("div", attrs: (class: "floating-window", id: "floatingWindow"))[
  #_fw-header
  #_fw-progress-track 
  #_fw-body
]

#let _overlay = html.elem("div", attrs: (class: "overlay", id: "overlay"))
#let _island-wrap = html.elem("div", attrs: (class: "island-wrap"))[
    #html.elem("div", attrs: (class: "island", id: "island"))[
      #html.span(class:"dot")
      #html.span(class: "label")[Table of Contents]
    ]
]
#let floating-toc = context {
  if target() == "html" {
    _island-wrap
    _overlay
    _floating-window
  }
}
