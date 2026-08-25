#let FiraCode-Regular = read("../fonts/FiraCode-Regular.woff2", encoding: none)

#let export(name) = [
  #asset("fonts/" + #name + ".woff2", read("../fonts/" + #name + ".woff2", encoding: none))
]
