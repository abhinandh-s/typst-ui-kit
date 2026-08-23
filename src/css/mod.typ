#import "link.typ" as link
#import "code.typ" as code
#import "figure.typ" as figure

#let init = context {
  if target() == "html" {
    link.init
    code.init
    figure.init
  }
}