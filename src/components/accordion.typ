<div class="accordion-item">
    <button class="accordion-button" aria-expanded="false" aria-controls="panel-1">
      Section 1
      <svg >
        <polyline ></polyline>
      </svg>
    </button>
    <div class="accordion-panel" id="panel-1">
      <div class="accordion-inner">
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
      </div>
    </div>
  </div>



#let _wrapper(..items) = #html.elem("div", attrs: (class: "accordion-wrapper"))[
  #..items
]

#let _item = #html.elem("div", attrs: (class: "accordion-item"))[
  #..items
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


#let _button = #html.elem("button", attrs: (class: "code-tablinks"))[#item.name]
#let _panel =
#let _inner = 

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