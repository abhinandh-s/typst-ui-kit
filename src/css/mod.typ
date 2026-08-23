#import "link.typ" as link
#import "code.typ" as code

#let init = context {
  if target() == "html" {
    link.init
    code.init
  }
}