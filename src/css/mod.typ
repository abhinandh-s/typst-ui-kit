#import "link.typ" as link
#import "code.typ" as code
#import "figure.typ" as figure
#import "body.typ" as body

#let init = context {
  if target() == "html" {
    body.init
    link.init
    code.init
    figure.init
  }
}