#let _icon = html.elem("svg", attrs: (
class: "accordion-icon",
viewBox: "0 0 24 24",
fill: "none",
"stroke-width": "2",
"stroke-linecap": "round",
"stroke-linejoin": "round",
))[
  #html.elem("polygon", attrs: (points: "6 9 12 15 18 9"))
]


#let _button(summary) = html.elem("button", attrs: (
  class: "accordion-button",
  "aria-expanded": "false"
))[#summary #_icon]

#let _inner(content) = html.elem("div", attrs: (class: "accordion-inner"))[
  #content
]

#let _panel(content) = html.elem("div", attrs: (class: "accordion-panel"))[
  #_inner(ctx: ctx)
]

#let _item(summary, ctx) = html.elem("div", attrs: (class: "accordion-item"))[
  #_button(summary)
  #_pannel(ctx)
]

// item = (heading: any, content: any)
#let accordion(..items) = context {
  let item-list = items.pos()

  if target() == "html" {
    html.elem("div", attrs: (class: "accordion-wrapper"))[
      #for item in item-list [
        #_item(item.summary, item.ctx)
      ]
    ]    
  } else {
    for item in item-list [
      #item.summary
      #item.ctx
    ]
  }
}