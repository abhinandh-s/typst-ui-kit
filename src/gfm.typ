#let alert-css = html.style("
  .markdown-alert {
  border-left: .25em solid var(--borderColor-default, var(--color-border-default));
  color: inherit;
  margin-bottom: 16px;
  padding: .5rem 1em
}
.markdown-alert>:last-child {
  margin-bottom: 0!important
}
.markdown-alert .markdown-alert-title {
  align-items: center;
  display: flex;
  font-size: 14px;
  font-weight: 500;
  line-height: 1
}
.markdown-alert .markdown-alert-title img {
  margin-right: 8px!important;
  margin-right: var(--base-size-8,8px) !important;
}
.markdown-alert.markdown-alert-note {
  border-left-color: var(--borderColor-accent-emphasis,var(--color-accent-emphasis))
}
.markdown-alert.markdown-alert-note .markdown-alert-title {
  color: var(--color-accent-fg);
  color: var(--fgColor-accent,var(--color-accent-fg))
}
.markdown-alert.markdown-alert-tip {
  border-left-color: var(--borderColor-success-emphasis,var(--color-success-emphasis))
}
.markdown-alert.markdown-alert-tip .markdown-alert-title {
  color: var(--color-success-fg);
  color: var(--fgColor-success,var(--color-success-fg))
}
.markdown-alert.markdown-alert-important {
  border-left-color: var(--borderColor-done-emphasis,var(--color-done-emphasis))
}
.markdown-alert.markdown-alert-important .markdown-alert-title {
  color: var(--color-done-fg);
  color: var(--fgColor-done,var(--color-done-fg))
}
.markdown-alert.markdown-alert-warning {
  border-left-color: var(--borderColor-attention-emphasis,var(--color-attention-emphasis))
}
.markdown-alert.markdown-alert-warning .markdown-alert-title {
  color: var(--color-attention-fg);
  color: var(--fgColor-attention,var(--color-attention-fg))
}
.markdown-alert.markdown-alert-caution {
  border-left-color: var(--borderColor-danger-emphasis,var(--color-danger-emphasis))
}
.markdown-alert.markdown-alert-caution .markdown-alert-title {
  color: var(--color-danger-fg);
  color: var(--fgColor-danger,var(--color-danger-fg))
}
")

// Create a state to track if the CSS has been added to the document yet
#let css-injected = state("github-alert-css", false)

#let github-alert(kind, title, icon-file, accent-color, bg-color, body) = context {
  if target() == "html" {
    
    // Check state: if false, output CSS and flip state to true
    if not css-injected.get() {
      css-injected.update(true)
      alert-css
    }

    html.blockquote(
      class: "markdown-alert markdown-alert-" + kind,
      dir: auto
    )[
      #html.p(
        class: "markdown-alert-title", dir: auto)[
       #box(image(icon-file, height: 1em))
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
