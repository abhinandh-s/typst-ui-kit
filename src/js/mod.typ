#let init = html.script(
  read("theme.js")
  + read("toggle-sidebar.js")
  + read("floating-toc.js")
  + read("fixes.js")
  + read("code-tab.js")
  // must be last, position is important!
  + read("comment-box.js")
)