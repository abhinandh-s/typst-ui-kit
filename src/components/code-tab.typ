
#let codetabs(..files) = context {
  let file-list = files.pos()

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
    #html.elem("div", attrs: (class: "code-tabcontent"))[
      #item.name
      #item.code
    ]
  ]
  }
}


  
   
  