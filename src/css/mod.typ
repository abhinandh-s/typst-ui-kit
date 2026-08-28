#let init = context {
  if target() == "html" {
    html.style(
      read("variables.css")
      + read("base.css")
      + read("fixes.css")
      + read("code.css")
      + read("figure.css")
      + read("alerts.css")
      + read("topbar.css")
      + read("theme-button.css")
      + read("comment-box.css")
      + read("floating-toc.css")
      + read("bottom-nav.css")
      + read("extras.css")
      + read("code-tab.css")
      + read("accordion.css")
    )
  }
}
