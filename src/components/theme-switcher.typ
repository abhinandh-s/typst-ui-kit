#import "../colors.typ": latte
#import "../icons.typ" as icon

#let _list-item(name: "Dracula", short: "dracula") = context {
  if target() == "html" {
    // 1. Use html.elem because of data-theme-option
    html.elem("li", attrs: (
      role: "option",
      "data-theme-option": short,
      "aria-selected": "true", // Back to string for html.elem
    ))[
      // 2. Use html.elem because of data-swatch
      #html.elem("span", attrs: (
          class: "menu__swatch",
          "data-swatch": short
      ))
      #name
      #html.elem(
        "svg",
         attrs: (
           viewBox: "0 0 24 24",
           stroke: "currentColor", 
           "stroke-width": "2",
           class: "check",
           fill: "none",
         ),
         html.elem(
           "path", 
           attrs: (d: "M20 6L9 17l-5-5")
         )
       )
     ]
  }
}

#let theme-switcher() = context {
  if target() == "html" {
    css()
    js()
    // 3. Use html.elem because of data-theme-panel
    html.elem("div", attrs: (
        class: "panel-menu",
        "data-theme-panel": "data-theme-panel"
    ))[  
      // html.button works fine because aria-* are standard global attributes
      #html.button(
        .. (
          class: "btn-theme btn-theme--circle",
          "aria-haspopup": "listbox",
          "aria-expanded": false, // Typed layer needs actual boolean here
          "aria-label": "Choose theme",
        )
      )[
        #icon.palette
       ]
      #html.ul(
        class: "panel-menu__list",
        role: "listbox",
        hidden: true
      )[
        #_list-item(name: "Catppuccin Mocha", short: "mocha")
        #_list-item(name: "Catppuccin Latte", short: "latte")
        #_list-item(name: "Nord", short: "nord")
        #_list-item(name: "Dracula", short: "dracula")
      ]
    ]
  }
}


/*
<div class="panel-menu" data-theme-panel>
    <button class="btn-theme btn-theme--circle" aria-haspopup="listbox" aria-expanded="false" aria-label="Choose theme">
      <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="currentColor">
        <path d="M480.5 10.3L259.1 158c-29.1 19.4-47.6 50.9-50.6 85.3 62.3 12.8 111.4 61.9 124.3 124.3 34.5-3 65.9-21.5 85.3-50.6L565.7 95.5c6.7-10.1 10.3-21.9 10.3-34.1 0-33.9-27.5-61.4-61.4-61.4-12.1 0-24 3.6-34.1 10.3zM288 400c0-61.9-50.1-112-112-112S64 338.1 64 400c0 3.9 .2 7.8 .6 11.6 1.8 17.5-10.2 36.4-27.8 36.4L32 448c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0c61.9 0 112-50.1 112-112z"/>
      </svg>
    </button>
    <ul class="panel-menu__list" role="listbox" hidden>
      <li role="option" data-theme-option="mocha" aria-selected="true">
        <span class="menu__swatch" data-swatch="mocha"></span> Catppuccin Mocha
        <svg class="check" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6L9 17l-5-5"/></svg>
      </li>
      <li role="option" data-theme-option="latte">
        <span class="menu__swatch" data-swatch="latte"></span> Catppuccin Latte
        <svg class="check" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6L9 17l-5-5"/></svg>
      </li>
      <li role="option" data-theme-option="nord">
        <span class="menu__swatch" data-swatch="nord"></span> Nord
        <svg class="check" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6L9 17l-5-5"/></svg>
      </li>
      <li role="option" data-theme-option="dracula">
        <span class="menu__swatch" data-swatch="dracula"></span> Dracula
        <svg class="check" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6L9 17l-5-5"/></svg>
      </li>
      <li role="option" data-theme-option="solarized-light">
        <span class="menu__swatch" data-swatch="solarized-light"></span> Solarized Light
        <svg class="check" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6L9 17l-5-5"/></svg>
      </li>
    </ul>
  </div>
*/