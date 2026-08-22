#import "colors.typ": latte

#let _icons = (
  // Octicons use a 16x16 viewbox
  note: (
    path: "M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8Zm8-6.5a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13ZM6.5 7.75A.75.75 0 0 1 7.25 7h1a.75.75 0 0 1 .75.75v2.75h.25a.75.75 0 0 1 0 1.5h-2a.75.75 0 0 1 0-1.5h.25v-2h-.25a.75.75 0 0 1-.75-.75ZM8 6a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z",
    viewbox: "0 0 16 16"
  ),
  tip: (
    path: "M8 1.5c-2.363 0-4 1.69-4 3.75 0 .984.424 1.625.984 2.304l.214.253c.223.264.47.556.673.848.284.411.537.896.621 1.49a.75.75 0 0 1-1.484.211c-.04-.282-.163-.547-.37-.847a8.456 8.456 0 0 0-.542-.68c-.084-.1-.173-.205-.268-.32C3.201 7.75 2.5 6.766 2.5 5.25 2.5 2.31 4.863 0 8 0s5.5 2.31 5.5 5.25c0 1.516-.701 2.5-1.328 3.259-.095.115-.184.22-.268.319-.207.245-.383.453-.541.681-.208.3-.33.565-.37.847a.751.751 0 0 1-1.485-.212c.084-.593.337-1.078.621-1.489.203-.292.45-.584.673-.848.075-.088.147-.173.213-.253.561-.679.985-1.32.985-2.304 0-2.06-1.637-3.75-4-3.75ZM5.75 12h4.5a.75.75 0 0 1 0 1.5h-4.5a.75.75 0 0 1 0-1.5ZM6 15.25a.75.75 0 0 1 .75-.75h2.5a.75.75 0 0 1 0 1.5h-2.5a.75.75 0 0 1-.75-.75Z",
    viewbox: "0 0 16 16"
  ),
  important: (
    path: "M0 1.75C0 .784.784 0 1.75 0h12.5C15.216 0 16 .784 16 1.75v9.5A1.75 1.75 0 0 1 14.25 13H8.06l-2.573 2.573A1.458 1.458 0 0 1 3 14.543V13H1.75A1.75 1.75 0 0 1 0 11.25Zm1.75-.25a.25.25 0 0 0-.25.25v9.5c0 .138.112.25.25.25h2a.75.75 0 0 1 .75.75v2.19l2.72-2.72a.749.749 0 0 1 .53-.22h6.5a.25.25 0 0 0 .25-.25v-9.5a.25.25 0 0 0-.25-.25Zm7 2.25v2.5a.75.75 0 0 1-1.5 0v-2.5a.75.75 0 0 1 1.5 0ZM9 9a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z",
    viewbox: "0 0 16 16"
  ),
  warning: (
    path: "M6.457 1.047c.659-1.234 2.427-1.234 3.086 0l6.082 11.378A1.75 1.75 0 0 1 14.082 15H1.918a1.75 1.75 0 0 1-1.543-2.575Zm1.763.707a.25.25 0 0 0-.44 0L1.698 13.132a.25.25 0 0 0 .22.368h12.164a.25.25 0 0 0 .22-.368Zm.53 3.996v2.5a.75.75 0 0 1-1.5 0v-2.5a.75.75 0 0 1 1.5 0ZM9 11a1 1 0 1 1-2 0 1 1 0 0 1 2 0Z",
    viewbox: "0 0 16 16"
  ),
  caution: (
    path: "M4.47.22A.749.749 0 0 1 5 0h6c.199 0 .389.079.53.22l4.25 4.25c.141.14.22.331.22.53v6a.749.749 0 0 1-.22.53l-4.25 4.25A.749.749 0 0 1 11 16H5a.749.749 0 0 1-.53-.22L.22 11.53A.749.749 0 0 1 0 11V5c0-.199.079-.389.22-.53Zm.84 1.28L1.5 5.31v5.38l3.81 3.81h5.38l3.81-3.81V5.31L10.69 1.5ZM8 4a.75.75 0 0 1 .75.75v3.5a.75.75 0 0 1-1.5 0v-3.5A.75.75 0 0 1 8 4Zm0 8a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z",
    viewbox: "0 0 16 16"
  ),
  // This FontAwesome quote icon uses a 512x512 viewbox
  quote: (
    path: "M6.368 1.01a.75.75 0 0 1 .623.859L6.57 4.5h3.98l.46-2.868a.75.75 0 0 1 1.48.237L12.07 4.5h2.18a.75.75 0 0 1 0 1.5h-2.42l-.64 4h2.56a.75.75 0 0 1 0 1.5h-2.8l-.46 2.869a.75.75 0 0 1-1.48-.237l.42-2.632H5.45l-.46 2.869a.75.75 0 0 1-1.48-.237l.42-2.632H1.75a.75.75 0 0 1 0-1.5h2.42l.64-4H2.25a.75.75 0 0 1 0-1.5h2.8l.46-2.868a.75.75 0 0 1 .858-.622ZM9.67 10l.64-4H6.33l-.64 4Z",
    viewbox: "0 0 16 16"
  )
)

// Helper to pull the specific data or fallback to note data
#let get_icon_data(name) = _icons.at(name, default: _icons.note)

#let github-alert(kind, title, accent-color, bg-color, body) = context {
  let icon-data = get_icon_data(kind)

  if target() == "html" {
    html.blockquote(
      class: "markdown-alert markdown-alert-" + kind,
      dir: auto,
      style: "border-left: 0.25em solid " + accent-color.to-hex() + "; padding: 0.5rem 1em; margin-bottom: 16px; background-color: " + bg-color.to-hex() + ";"
    )[
      #html.p(
        class: "markdown-alert-title",
        style: "font-family: monospace; color: " + accent-color.to-hex() + "; display: flex; align-items: center; font-weight: 600; margin-bottom: 8px;",
        dir: auto
      )[
       #html.elem(
         "svg",
         attrs: (
           viewBox: icon-data.viewbox, // Uses dynamic viewbox
           width: "16",
           height: "16",
           class: "octicon",
           fill: "currentColor",
           style: "margin-right: 8px;"
         ),
         html.elem(
           "path", 
           attrs: (d: icon-data.path) // Uses dynamic path
         )
       )
       #title
      ]
    #body
    ]
  } else {
    // Dynamic SVG for PDF injection
    let dynamic-svg = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"" + icon-data.viewbox + "\" fill=\"" + accent-color.to-hex() + "\"><path d=\"" + icon-data.path + "\"/></svg>"

    block(
      width: 100%,
      stroke: (left: 4pt + accent-color),
      inset: (x: 1em, top: 0.6em, bottom: 0.8em),
      fill: bg-color,
      radius: (right: 3pt),
      [
        #text(fill: accent-color, weight: "bold")[
          #box(baseline: 0.25em)[
            #image(bytes(dynamic-svg), format: "svg", width: 1.1em, height: 1.1em)
          ]
          #h(0.3em) #title
        ]
        #v(0.5em, weak: true)
        #body
      ]
    )
  }
} 

#let note(body) = github-alert("note", "Note", latte.blue, latte.blue.transparentize(90%), body)
#let tip(body) = github-alert("tip", "Tip", latte.green, latte.green.transparentize(90%), body)
#let important(body) = github-alert("important", "Important", latte.mauve, latte.mauve.transparentize(90%), body)
#let warning(body) = github-alert("warning", "Warning", latte.yellow, latte.yellow.transparentize(90%), body)
#let caution(body) = github-alert("caution", "Caution",  latte.red, latte.red.transparentize(90%), body)
#let quote(body) = github-alert("quote", "Quote", rgb("#656d76"), rgb("#656d761a"), body)
