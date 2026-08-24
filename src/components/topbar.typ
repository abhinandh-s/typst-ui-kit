#import "../icons.typ" as icon

#let theme-item(id, label, swatch-color) = {
  html.elem("li", attrs: (
    class: "tb-option",
    role: "option",
    "data-theme-option": id,
    tabindex: "-1"
  ))[
    #html.elem("span", attrs: (class: "tb-swatch", style: "background: " + swatch-color))[]
    #html.elem("span", attrs: (class: "tb-label"))[#label]
    #html.elem("svg", attrs: (class: "tb-check", viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", "stroke-width": "2"))[
      #html.elem("path", attrs: (d: "M20 6L9 17l-5-5"))[]
    ]
  ]
}

#let topbar(pdf-path: "book.pdf") = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "top-bar"))[  
      #html.button(id: "sidebar-toggle", class: "btn icon-btn")[ #icon.three-bars-24px ]
      
      #html.elem("div", attrs: (class: "top-bar-right"))[
        #html.elem("a", attrs: (href: pdf-path, class: "btn icon-btn", target: "_blank", title: "Download PDF"))[ #icon.pdf ]
        
        #html.elem("div", attrs: (class: "tb-menu", "data-theme-panel": "true"))[
          #html.button(
            id: "theme-toggle", 
            class: "btn icon-btn tb-trigger", 
            attrs: ("aria-haspopup": "listbox", "aria-expanded": "false", "aria-label": "Choose theme")
          )[ #icon.paintbrush-24px ]

          #html.elem("ul", attrs: (class: "tb-list", role: "listbox", hidden: "true"))[
            #theme-item("mocha", "Catppuccin Mocha", "#cba6f7")
            #theme-item("macchiato", "Catppuccin Macchiato", "#c6a0f6")
            #theme-item("frappe", "Catppuccin Frappé", "#ca9ee6")
            #theme-item("latte", "Catppuccin Latte", "#8839ef")
            #theme-item("tokyo-night", "Tokyo Night", "#7aa2f7")
            #theme-item("tokyo-night-storm", "Tokyo Night Storm", "#7dcfff")
            #theme-item("tokyo-night-light", "Tokyo Night Light", "#34548a")
            #theme-item("everforest-dark-medium", "Everforest Dark", "#a7c080")
            #theme-item("everforest-dark-hard", "Everforest Hard", "#83c092")
            #theme-item("everforest-light-medium", "Everforest Light", "#8da101")
          ]
        ]
      ]
    ]
  }
}
