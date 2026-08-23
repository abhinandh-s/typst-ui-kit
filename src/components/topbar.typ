#import "../icons.typ" as icon

#let _topbar-js = html.script("
document.addEventListener('DOMContentLoaded', () => {
  const toggleBtn = document.getElementById('sidebar-toggle');
  const sidebar = document.getElementById('sidebar');

  toggleBtn.addEventListener('click', () => {
    document.body.classList.toggle('sidebar-toggled');
  });

  sidebar.addEventListener('click', (event) => {
    if (event.target.closest('a')) {
      document.body.classList.remove('sidebar-toggled');
    }
  });
});
")

#let _topbar-css = html.style(read("topbar.css"))

#let topbar = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "top-bar"))[
  
  #html.button(id: "sidebar-toggle", class: "btn icon-btn")[
    #icon.menu
  ]
  #html.elem("div", attrs: (class: "top-bar-right"))[
    #html.elem("a", attrs: (href: "ag.pdf", class: "btn icon-btn", target: "_blank", title: "Download PDF"))[
      #icon.pdf
    ]
    #html.button(id: "theme-toggle", class: "btn icon-btn")[
      #icon.palette
    ]
  ]
]
}
}

#let init = context {
  if target() == "html" {
    _topbar-js
    _topbar-css
  }
}