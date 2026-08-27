#import "/src/lib.typ": rating

#table(
  columns: (1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Movies/Series*], [*Rating*],
  ),
  [Breaking Bad], [#rating(rating: 4, icon: "sparkle")],
  [Better Call Soul],
  [#rating(rating: 4)],
  [Breaking Bad], [#rating(rating: 4.5, icon: "dot")],
  [Breaking Bad], [#rating(rating: 4.9, icon: "square")],
  [Breaking Bad], [#rating(rating: 4.3, icon: "heart")],
)

#rating(rating: 3.4) \
#rating(rating: 4.8, icon: "heart") \
#rating(rating: 1.5, icon: "sparkle") \
#rating(rating: 7.8, total: 10, icon: "heart") \