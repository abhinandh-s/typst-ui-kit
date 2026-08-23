#import "link.typ" as link

#let init = context {
  if target() == "html" {
    link.init
  }
}