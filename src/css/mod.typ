#let init = context {
  if target() == "html" {
    html.style(
      read("variables.css")
      + read("base.css")
      + read("code.css")
      + read("figure.css")
      + read("alerts.css")
      + read("topbar.css")
      + read("theme-button.css")
      + read("comment-box.css")
      + read("floating-toc.css")
      /*
      + read("body.css")
      + read("link.css")
      + read("blockquotes.css")
      + read("lists.css")
      */
    )
  }
}
