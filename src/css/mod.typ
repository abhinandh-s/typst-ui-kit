#let init = context {
  if target() == "html" {
    html.style(
      read("variables.css")
      + read("body.css")
      + read("link.css")
      + read("code.css")
      + read("figure.css") 
    )
  }
}
