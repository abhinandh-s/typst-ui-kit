#let init = context {
  if target() == "html" {
    html.style(
      read("variables.css") +
      read("body.css")
    )
    // link.init
    // code.init
    // figure.init
  }
}
