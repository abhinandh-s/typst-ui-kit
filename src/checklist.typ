/// Returns the SVG box loaded from a file path for PDF/standard export
// make height settable too.
#let _get-svg-icon(checked: false, empty-path: "", checked-path: "") = {
  let path = if checked { checked-path } else { empty-path }
  box(baseline: 15%, image(path, height: 1em))
}

/// Returns the native HTML checkbox element for HTML export
#let _get-html-checkbox(checked: false) = {
  let attrs = (
    type: "checkbox",
    style: "margin: 0 .2em .25em -1.4em; vertical-align: middle;",
  )
  if checked {
    attrs.insert("checked", "checked")
  }
  box(html.elem("input", attrs: attrs))
}

/// Helper to detect if the compiler target is HTML
#let _is-html-target() = {
  "html" in dictionary(std) and target() == "html"
}

/// Parses a list item to determine if it is a checklist item.
/// Returns a dictionary: `(is-checklist: bool, is-checked: bool, content: content)`
#let _parse-checklist-item(item-body) = {
  if not (type(item-body) == content and item-body.func() == [].func()) {
    return (is-checklist: false, is-checked: false, content: item-body)
  }

  let children = item-body.children
  
  if children.len() < 5 or not (children.at(0) == [#"["] and children.at(2) == [#"]"] and children.at(3) == [ ]) {
    return (is-checklist: false, is-checked: false, content: item-body)
  }

  let marker = children.at(1)
  let marker-text = if marker == [ ] {
    " "
  } else if marker.has("text") {
    marker.text
  } else {
    none
  }

  if marker-text == " " {
    return (is-checklist: true, is-checked: false, content: children.slice(4).sum())
  } else if marker-text == "x" or marker-text == "X" {
    return (is-checklist: true, is-checked: true, content: children.slice(4).sum())
  }

  return (is-checklist: false, is-checked: false, content: item-body)
}

// # Public API
/// `checklist` function.
///
/// Example:
/// #show: checklist.with(empty-path: "assets/empty.svg", checked-path: "assets/checked.svg")
/// - [ ] Unchecked item
/// - [x] Checked item
#let checklist(
  empty-path: "../assets/icons/square.svg",
  checked-path: "../assets/icons/square-check.svg",
  body
) = {
  show list: it => {
    let has-checklist = false
    let items-list = ()
    let symbols-list = ()
    let is-html = _is-html-target()
    let default-marker = if type(it.marker) == array { it.marker.at(0) } else { it.marker }

    for list-item in it.children {
      let parsed = _parse-checklist-item(list-item.body)
      
      if parsed.is-checklist {
        has-checklist = true
        if is-html {
          items-list.push(
            list.item(_get-html-checkbox(checked: parsed.is-checked) + parsed.content)
          )
        } else {
          symbols-list.push(_get-svg-icon(
            checked: parsed.is-checked, 
            empty-path: empty-path, 
            checked-path: checked-path
          ))
          items-list.push(parsed.content)
        }
      } else {
        if is-html {
          items-list.push(list.item(list-item.body))
        } else {
          symbols-list.push(default-marker)
          items-list.push(list-item.body)
        }
      }
    }

    if has-checklist {
      if is-html {
        items-list.join() 
      } else {
        enum(
          numbering: (.., n) => { symbols-list.at(n - 1) },
          tight: it.tight,
          indent: it.indent,
          body-indent: it.body-indent,
          spacing: it.spacing,
          ..items-list,
        )
      }
    } else {
      it
    }
  }

  body
}
