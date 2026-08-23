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
#import "initial.typ" as init
#import "css/mod.typ" as css
#import "js/mod.typ" as js


#import "components/theme-switcher.typ": theme-switcher