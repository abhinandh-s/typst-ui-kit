#let toast(label, message, duration: 3000) = {
  let js-call = "Toast.show('" + message + "', " + str(duration) + ")"
  html.elem("button", attrs: (class:"toast-button", onclick: js-call), label)
}