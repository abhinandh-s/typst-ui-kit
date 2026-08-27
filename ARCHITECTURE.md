# Icons

`src/icons.typ`

Context aware icons. Api isn't stable, but this is almost it. 


```typ
#let _icon(path, h: "24", w: "24", vh: "24", vw: "24",  fill: "currentColor", frac: 1.0) = context {
   let percent = str(calc.round(frac * 100, digits: 1)) + "%"

  if target() == "html" {
    html.elem("svg", attrs: (
      xmlns: "http://www.w3.org/2000/svg",
      viewBox: "0 0 " + vh + " " + vw,
      height: h,
      width: w,
    ))[
      #html.elem("defs")[
        #html.elem("linearGradient", attrs: (id: "grad"))[
          #html.elem("stop", attrs: (
          offset: percent,
          "stop-color": fill,
        ))
          #html.elem("stop", attrs: (
          offset: percent,
          "stop-color": "transparent"
        ))
      ]
      ]
      #html.elem("path", attrs: (
        d: path, 
        fill: "url(#grad)",
        stroke: fill,
        "stroke-width": "1.5",
      ))[]
    ]
  } else {
     image(bytes(
      "<svg xmlns=\"http://www.w3.org/2000/svg\" height=\""+ h + "\" width=\"" + w + "\" viewBox=\"0 0 " + vh + " " + vw + "\">
    <defs>
      <linearGradient id=\"grad\">
        <stop offset=\"" + percent + "\" stop-color=\"" + fill + "\"/>
        <stop offset=\"" + percent + "\" stop-color=\"transparent\"/>
      </linearGradient>
    </defs>
    <!-- We draw the solid path, add a stroke for the outline, and fill it with the gradient -->
    <path d=\"" + path + "\" fill=\"url(#grad)\" stroke=\"" + fill + "\" stroke-width=\"1.5\" />
  </svg>"
    ), format: "svg", width: 1.1em, height: 1.1em)
  }
}

#let font-awesome(vh: "640", vw: "640", ..args) = _icon(vh: vh, vw: vw, ..args)

#let octicon-16(vh: "16", vw: "16", h: "16", w: "16", ..args) = _icon(vh: vh, vw: vw, h: h, w: w, ..args)
#let octicon-24(vh: "24", vw: "24", h: "24", w: "24", ..args) = _icon(vh: vh, vw: vw, h: h, w: w, ..args)


#let _fa-icons = (
  circle: "M64 320C64 178.6 178.6 64 320 64C461.4 64 576 178.6 576 320C576 461.4 461.4 576 320 576C178.6 576 64 461.4 64 320z"
)


#let get_fa_icon_path(name) = _fa-icons.at(name, default: _icons.star)

#let circle(..args) = font-awesome(_fa-icons.circle, ..args)



= Tests

#circle(fill:"blue")
```