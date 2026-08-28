<div class="accordion-item">
    <button  aria-controls="panel-1">
      Section 1
      <svg >
        <polyline ></polyline>
      </svg>
    </button>
    >
  </div>



#let _wrapper(..items) = #html.elem("div", attrs: (class: "accordion-wrapper"))[
  #for i in item-lists {
    #_item
  }
]

#let _item = #html.elem("div", attrs: (class: "accordion-item"))[
  #_button
  #_pannel(content)
]

#let _icon = #html.elem("svg", attrs: (
class: "accordion-icon",
viewBox: "0 0 24 24",
fill: "none",
"stroke-width": "2",
"stroke-linecap": "round",
"stroke-linejoin": "round",
))[
        #html.elem("polygon", attrs: (points: "6 9 12 15 18 9"))
      ]


#let _button(heading) = #html.elem("button", attrs: (
  class: "accordion-button",
  "aria-expanded": "false"
))[#heading #_icon]

#let _panel(content) = #html.elem("div", attrs: (class: "accordion-panel"))[
  #_inner(content)
]

#let _inner(content) = #html.elem("div", attrs: (class: "accordion-inner"))[
  #content
]

// item = (heading: any, content: any)
#let accordion(..items) = context {
  let item-list = items.pos()

  if target() == "html" {
    let header = html.elem("div", attrs: (class: "code-tab-header"))[
      #for item in file-list [
        #html.elem("button", attrs: (class: "code-tablinks"))[#item.name]
      ]
    ]
    let contents = for item in file-list [
      #html.elem("div", attrs: (class: "code-tabcontent"))[
        #item.code
      ]
    ]
    html.elem("div", attrs: (class: "code-tab-wrapper"))[
      #header
      #contents
    ]
  } else {
    for item in file-list [
      #item.name
      #item.code
    ]
  }
}