#import "/src/lib.typ": alerts

#html.style(```
  figure img {
  max-width: 100%;
  height: auto;
  }
```)

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
