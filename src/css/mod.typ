#let init = context {
  if target() == "html" {
    html.style(
      read("variables.css")
      + read("base.css")
      + read("topbar.css")
      + read("theme-button.css")
      + read("comment-box.css")
      /*
      + read("body.css")
      + read("link.css")
      + read("code.css")
      + read("figure.css")
      + read("blockquotes.css")
      + read("lists.css")
      + read("floating-toc.css")
      */
    )
  }
}
