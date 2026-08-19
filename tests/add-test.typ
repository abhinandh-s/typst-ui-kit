#import "/src/lib.typ": add

#assert(add(2, 3) == 5, message: "2 + 3 should equal 5")
#assert(add(-1, 1) == 0, message: "-1 + 1 should equal 0")
#assert(add(2.5, 1.5) == 4.0, message: "2.5 + 1.5 should equal 4.0")

#let result = add(10, 20)
Test passed: 10 + 20 = #result
