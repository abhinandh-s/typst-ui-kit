#import "/src/lib.typ": add, checklist

= Addition Example

The sum of $4$ and $7$ is:
#rect(fill: luma(240), inset: 8pt)[
  $4 + 7 = #add(4, 7)$
]

#show: checklist

- [ ] Unchecked item
- [x] Checked item
