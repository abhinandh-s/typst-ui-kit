
#let octicon(path, hw: "24", fill: "currentColor") = context {
  if target() == "html" {
    html.elem("svg", attrs: (
      xmlns: "http://www.w3.org/2000/svg",
      viewBox: "0 0 " + hw + " " + hw,
      height: hw,
      width: hw,
      fill: fill,
    ))[#html.elem("path", attrs: (d: path))[]]
  } else {
     image(bytes(
      "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 " + hw + " " + hw + "\" fill=\"" + fill + "\"><path d=\"" + path + "\"/></svg>"
    ), format: "svg", width: 1.1em, height: 1.1em)
  }
}

#let dot-24(..args) = octicon("M12 18a6 6 0 1 1 0-12 6 6 0 0 1 0 12Zm0-1.5a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9Z", ..args)
#let dot-fill-24(..args) = octicon("M12 18a6 6 0 1 0 0-12 6 6 0 0 0 0 12Z", ..args)
#let heart-24(..args) = octicon("m12 20.703.343.667a.748.748 0 0 1-.686 0l-.003-.002-.007-.003-.025-.013a31.138 31.138 0 0 1-5.233-3.576C3.8 15.573 1 12.332 1 8.514v-.001C1 5.053 3.829 2.5 6.736 2.5 9.03 2.5 10.881 3.726 12 5.605 13.12 3.726 14.97 2.5 17.264 2.5 20.17 2.5 23 5.052 23 8.514c0 3.818-2.801 7.06-5.389 9.262a31.148 31.148 0 0 1-5.233 3.576l-.025.013-.007.003-.002.001ZM6.736 4C4.657 4 2.5 5.88 2.5 8.514c0 3.107 2.324 5.96 4.861 8.12a29.655 29.655 0 0 0 4.566 3.175l.073.041.073-.04c.271-.153.661-.38 1.13-.674.94-.588 2.19-1.441 3.436-2.502 2.537-2.16 4.861-5.013 4.861-8.12C21.5 5.88 19.343 4 17.264 4c-2.106 0-3.801 1.389-4.553 3.643a.751.751 0 0 1-1.422 0C10.537 5.389 8.841 4 6.736 4Z", ..args)
#let heart-fill-24(..args) = octicon("M14 20.408c-.492.308-.903.546-1.192.709-.153.086-.308.17-.463.252h-.002a.75.75 0 0 1-.686 0 16.709 16.709 0 0 1-.465-.252 31.147 31.147 0 0 1-4.803-3.34C3.8 15.572 1 12.331 1 8.513 1 5.052 3.829 2.5 6.736 2.5 9.03 2.5 10.881 3.726 12 5.605 13.12 3.726 14.97 2.5 17.264 2.5 20.17 2.5 23 5.052 23 8.514c0 3.818-2.801 7.06-5.389 9.262A31.146 31.146 0 0 1 14 20.408Z", ..args)
#let square-24(..args) = octicon("M6 7.75C6 6.784 6.784 6 7.75 6h8.5c.966 0 1.75.784 1.75 1.75v8.5A1.75 1.75 0 0 1 16.25 18h-8.5A1.75 1.75 0 0 1 6 16.25Zm1.75-.25a.25.25 0 0 0-.25.25v8.5c0 .138.112.25.25.25h8.5a.25.25 0 0 0 .25-.25v-8.5a.25.25 0 0 0-.25-.25Z", ..args)
#let square-fill-24(..args) = octicon("M7.75 6h8.5c.966 0 1.75.784 1.75 1.75v8.5A1.75 1.75 0 0 1 16.25 18h-8.5A1.75 1.75 0 0 1 6 16.25v-8.5C6 6.784 6.784 6 7.75 6Z", ..args)
#let sparkle-24(..args) = octicon("M11.191.565c.275-.754 1.342-.753 1.618 0l1.918 5.238a5.83 5.83 0 0 0 3.47 3.47l5.237 1.918c.755.275.755 1.342 0 1.618l-5.237 1.918a5.83 5.83 0 0 0-3.47 3.47l-1.918 5.237c-.276.755-1.343.755-1.618 0l-1.918-5.237a5.83 5.83 0 0 0-3.47-3.47L.565 12.809c-.753-.276-.754-1.342 0-1.618l5.238-1.918a5.83 5.83 0 0 0 3.47-3.47L11.191.565Zm-.505 5.756a7.336 7.336 0 0 1-4.365 4.365L2.73 12l3.591 1.315a7.333 7.333 0 0 1 4.365 4.365L12 21.269l1.315-3.589a7.33 7.33 0 0 1 4.365-4.365L21.269 12l-3.589-1.314a7.333 7.333 0 0 1-4.365-4.365L12 2.73l-1.314 3.591Z", ..args)
#let sparkle-fill-24(..args) = octicon("M11.296 1.924c.24-.656 1.168-.656 1.408 0l.717 1.958a11.25 11.25 0 0 0 6.697 6.697l1.958.717c.657.24.657 1.168 0 1.408l-1.958.717a11.25 11.25 0 0 0-6.697 6.697l-.717 1.958c-.24.657-1.168.657-1.408 0l-.717-1.958a11.25 11.25 0 0 0-6.697-6.697l-1.958-.717c-.656-.24-.656-1.168 0-1.408l1.958-.717a11.25 11.25 0 0 0 6.697-6.697l.717-1.958Z", ..args)
#let star-24(..args) = octicon("M12 .25a.75.75 0 0 1 .673.418l3.058 6.197 6.839.994a.75.75 0 0 1 .415 1.279l-4.948 4.823 1.168 6.811a.751.751 0 0 1-1.088.791L12 18.347l-6.117 3.216a.75.75 0 0 1-1.088-.79l1.168-6.812-4.948-4.823a.75.75 0 0 1 .416-1.28l6.838-.993L11.328.668A.75.75 0 0 1 12 .25Zm0 2.445L9.44 7.882a.75.75 0 0 1-.565.41l-5.725.832 4.143 4.038a.748.748 0 0 1 .215.664l-.978 5.702 5.121-2.692a.75.75 0 0 1 .698 0l5.12 2.692-.977-5.702a.748.748 0 0 1 .215-.664l4.143-4.038-5.725-.831a.75.75 0 0 1-.565-.41L12 2.694Z", ..args)
#let star-fill-24(..args) = octicon("m12.672.668 3.059 6.197 6.838.993a.75.75 0 0 1 .416 1.28l-4.948 4.823 1.168 6.812a.75.75 0 0 1-1.088.79L12 18.347l-6.116 3.216a.75.75 0 0 1-1.088-.791l1.168-6.811-4.948-4.823a.749.749 0 0 1 .416-1.279l6.838-.994L11.327.668a.75.75 0 0 1 1.345 0Z", ..args)

/* Icon template

#let dot-24(..args) = octicon("", ..args)
#let dot-fill-24(..args) = octicon("", ..args)

*/

#let _icons = (
  star: (icon: star-24, fill: star-fill-24),
  dot: (icon: dot-24, fill: dot-fill-24),
  heart: (icon: heart-24, fill: heart-fill-24),
  square: (icon: square-24, fill: square-fill-24),
  sparkle: (icon: sparkle-24, fill: sparkle-fill-24)
)

#let get_icon_data(name) = _icons.at(name, default: _icons.star)

#let rating(rating: 0, total: 5, shape: "star") = context {
  let icon-data = get_icon_data(shape) 
  let empty-icon = icon-data.icon
  let filled-icon = icon-data.fill
     // or should we do it with a table? :)
      {
      for i in range(0, rating) {
          [
          #box(baseline: 0.25em)[
            #filled-icon()
          ]
        ]
      }
      for i in range(0, total - rating) {
          [
          #box(baseline: 0.25em)[
            #empty-icon()
          ]
        ]
      }
    }
  

}

// #set rating-total: 10
// #set rating-default: 7
// #set rating-icon: star




#table(
  columns: (1fr, auto),
  inset: 10pt,
  align: horizon,
  table.header(
    [*Movies/Series*], [*Rating*],
  ),
  [Breaking Bad], [#rating(rating: 4, shape: "sparkle")],
  [Better Call Soul],
  [#rating(rating: 4)],
  [Breaking Bad], [#rating(rating: 4, shape: "dot")],
  [Breaking Bad], [#rating(rating: 4, shape: "square")],
  [Breaking Bad], [#rating(rating: 4, shape: "heart")],
)