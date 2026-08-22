#import "/src/lib.typ": alerts

#html.style("
  figure img {
    max-width: 100%;
    height: auto !important;
  }
  figcaption {
    font-style: italic;
    padding: 2px;
    text-align: center;
  }
")

#figure(
  image("8c346ecdd3a859b4d076baf9eb9698e1.jpg", width: 100%, height: auto),
  caption: [
    A step in the molecular testing
    pipeline of our lab.
  ],
)

#alerts.note[
  This is a GitHub-style note alert.
]

#alerts.warning[
  Be careful doing this!
]

#alerts.important[
  This is a very important message.
]

#alerts.tip[
  This is a GitHub-style note alert.
]

#alerts.caution[
  Be careful doing this!
]

// #alerts.quote[
//   This is a very important message.
// ]

