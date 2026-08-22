#html.style("
  .gh-alert {
    margin: 16px 0;
    padding: 0.6em 1em 0.8em;
    border-left: 4px solid;
    border-radius: 0 3px 3px 0;
    font-size: 14px;
    line-height: 1.5;
  }
  .gh-alert-title {
    display: flex;
    align-items: center;
    gap: 0.3em;
    font-weight: bold;
    margin: 0 0 8px 0;
  }
  .gh-alert-title {
    display: flex;
    align-items: center;
    gap: 0.3em;
  }
  .gh-alert p:last-child {
    margin-bottom: 0;
  }
")

#let github-alert(kind, title, icon-file, accent-color, bg-color, body) = context {
  if target() == "html" {
    html.elem("div", attrs: (
      class: "gh-alert gh-alert-" + kind,
      style: "border-left-color: " + accent-color.to-hex() + "; background-color: " + bg-color.to-hex() + ";"
    ))[
      #html.elem("p", attrs: (class: "gh-alert-title"))[
        #box(image(icon-file, height: 1.1em))
        #title
      ]
      #body
    ]
  } else {
    block(
      width: 100%,
      stroke: (left: 4pt + accent-color),
      inset: (x: 1em, top: 0.6em, bottom: 0.8em),
      fill: bg-color,
      radius: (right: 3pt),
      [
        #text(fill: accent-color, weight: "bold")[
          #box(baseline: 0.25em)[#image(icon-file, width: 1.1em, height: 1.1em)]
          #h(0.3em) #title
        ]
        #v(0.5em, weak: true)
        #body
      ]
    )
  }
}

#let note(body) = github-alert("note", "Note", "../assets/icons/note.svg", rgb("#0969da"), rgb("#0969da1a"), body)
#let tip(body) = github-alert("tip", "Tip", "../assets/icons/tip.svg", rgb("#1a7f37"), rgb("#1a7f371a"), body)
#let important(body) = github-alert("important", "Important", "../assets/icons/important.svg", rgb("#8250df"), rgb("#8250df1a"), body)
#let warning(body) = github-alert("warning", "Warning", "../assets/icons/warning.svg", rgb("#bf8700"), rgb("#bf87001a"), body)
#let caution(body) = github-alert("caution", "Caution", "../assets/icons/caution.svg", rgb("#d1242f"), rgb("#d1242f1a"), body)
#let quote(body) = github-alert("quote", "Quote", "../assets/icons/quote.svg", rgb("#656d76"), rgb("#656d761a"), body)