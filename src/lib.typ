/// Adds two numbers together.
///
/// - a (int, float): The first number.
/// - b (int, float): The second number.
/// -> int, float: The sum of `a` and `b`.
#let add(a, b) = {
  a + b
}

#import "checklist.typ": checklist
#import "gfm.typ" as alerts
#import "colors.typ": *
#import "css/mod.typ" as css
#import "js/mod.typ" as js

#import "components/floating-toc.typ": floating-toc
#import "components/topbar.typ": topbar
#import "components/navigation.typ": *
#import "components/copyrights.typ" as copyright

#import "templates/webpage.typ": webpage
