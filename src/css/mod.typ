#import "link.typ" as link
#import "code.typ" as code
#import "figure.typ" as figure
#import "body.typ" as body
#import "variables.typ" as variables

#let init = context {
  if target() == "html" {
    html.style(variables.init + body.init)
    
    // link.init
    // code.init
    // figure.init
  }
}