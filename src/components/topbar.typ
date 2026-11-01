#import "../icons.typ" as icon

#let topbar(
  pdf-path: "book.pdf",
  show-pdf: true,
) = context {
  if target() == "html" {
    let has-pdf = show-pdf and pdf-path != none

    html.elem("div", attrs: (class: "top-bar"))[
      #html.button(id: "sidebar-toggle", class: "btn icon-btn")[ #icon.three-bars-24px ]
      #html.elem("div", attrs: (class: "top-bar-right"))[
        #if has-pdf {
          html.elem("a", attrs: (
            href: pdf-path,
            class: "btn icon-btn",
            target: "_blank",
            title: "Download PDF",
          ))[ #icon.pdf ]
        }
        #html.button(id: "theme-toggle", class: "btn icon-btn")[ #icon.paintbrush-24px ]
      ]
    ]
  }
}


/*
#import "../icons.typ" as icon

#let topbar(pdf-path: "book.pdf") = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "top-bar"))[  
      #html.button(id: "sidebar-toggle", class: "btn icon-btn")[ #icon.three-bars-24px ]
      #html.elem("div", attrs: (class: "top-bar-right"))[
        #html.elem("a", attrs: (href: pdf-path, class: "btn icon-btn", target: "_blank", title: "Download PDF"))[ #icon.pdf ]
        #html.button(id: "theme-toggle", class: "btn icon-btn")[ #icon.paintbrush-24px ]
      ]
    ]
  }
}

*/