// =====================================================================
// topnav.typ
// A modular, HTML-target-only top navigation bar for Typst's HTML/bundle
// export, built from small component + helper functions.
//
// Layout:
//   [ hamburger                              pdf-icon  theme-button  … ]
//
// The bar is a plain block (no position: sticky/fixed) so it scrolls
// away with the page.
//
// Usage in your document:
//   #import "topnav.typ": topnav
//   #topnav()
//
// Everything below is a no-op when target() != "html" (e.g. PDF export),
// so this file is safe to import unconditionally from a shared template.
// =====================================================================


// ---------------------------------------------------------------------
// 1. DESIGN TOKENS
// ---------------------------------------------------------------------
// Central place for theme ids/labels + the raw CSS variable blocks.
// Add a new theme by adding one entry to `themes` and one `[data-theme]`
// block to `theme-tokens-css()`.

#let themes = (
  (id: "mocha",           label: "Catppuccin Mocha", swatch: rgb("#cba6f7")),
  (id: "latte",           label: "Catppuccin Latte", swatch: rgb("#8839ef")),
  (id: "nord",            label: "Nord",             swatch: rgb("#88c0d0")),
  (id: "dracula",         label: "Dracula",          swatch: rgb("#ff79c6")),
  (id: "solarized-light", label: "Solarized Light",  swatch: rgb("#2aa198")),
)

#let default-theme = "mocha"

#let theme-tokens-css() = "
:root {
  --radius-sm: 6px;
  --radius-md: 10px;
  --ease: cubic-bezier(0.4, 0, 0.2, 1);
  --dur: 220ms;
  --font-ui: -apple-system, \"Inter\", \"Segoe UI\", system-ui, sans-serif;
}

[data-theme=\"mocha\"] {
  --bg: #1e1e2e;
  --surface: #313244;
  --surface-2: #45475a;
  --border: #45475a;
  --text: #cdd6f4;
  --text-muted: #a6adc8;
  --accent: #cba6f7;
  --accent-soft: rgba(203, 166, 247, 0.16);
  --shadow: rgba(0, 0, 0, 0.45);
}
[data-theme=\"latte\"] {
  --bg: #eff1f5;
  --surface: #ffffff;
  --surface-2: #e6e9ef;
  --border: #ccd0da;
  --text: #4c4f69;
  --text-muted: #6c6f85;
  --accent: #8839ef;
  --accent-soft: rgba(136, 57, 239, 0.10);
  --shadow: rgba(76, 79, 105, 0.14);
}
[data-theme=\"nord\"] {
  --bg: #2e3440;
  --surface: #3b4252;
  --surface-2: #434c5e;
  --border: #4c566a;
  --text: #eceff4;
  --text-muted: #b8c0d3;
  --accent: #88c0d0;
  --accent-soft: rgba(136, 192, 208, 0.16);
  --shadow: rgba(0, 0, 0, 0.4);
}
[data-theme=\"dracula\"] {
  --bg: #282a36;
  --surface: #343746;
  --surface-2: #44475a;
  --border: #44475a;
  --text: #f8f8f2;
  --text-muted: #b6b8c2;
  --accent: #ff79c6;
  --accent-soft: rgba(255, 121, 198, 0.16);
  --shadow: rgba(0, 0, 0, 0.45);
}
[data-theme=\"solarized-light\"] {
  --bg: #fdf6e3;
  --surface: #ffffff;
  --surface-2: #eee8d5;
  --border: #d8d0b8;
  --text: #073642;
  --text-muted: #657b83;
  --accent: #2aa198;
  --accent-soft: rgba(42, 161, 152, 0.12);
  --shadow: rgba(7, 54, 66, 0.12);
}
"


// ---------------------------------------------------------------------
// 2. COMPONENT CSS
// ---------------------------------------------------------------------
// Split into small, independently readable chunks and joined at the end.
// Keeping the nav un-sticky is a deliberate omission: `.topnav` carries
// no `position` property at all, so it stays in normal document flow.

#let base-css() = "
* { box-sizing: border-box; }

html, body {
  margin: 0;
  background: var(--bg);
  color: var(--text);
  font-family: var(--font-ui);
  transition: background var(--dur) var(--ease), color var(--dur) var(--ease);
}

@media (prefers-reduced-motion: reduce) {
  * { transition-duration: 0.01ms !important; }
}

.icon { width: 20px; height: 20px; display: block; }
"

#let topnav-shell-css() = "
/* Plain flow element: no position:sticky / position:fixed anywhere here.
   It scrolls away with the page like any other block. */
.topnav {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 14px 20px;
  background: var(--surface);
  border-bottom: 1px solid var(--border);
}

.topnav__left,
.topnav__right {
  display: flex;
  align-items: center;
  gap: 10px;
}
"

#let nav-btn-css() = "
.nav-btn {
  width: 40px;
  height: 40px;
  display: grid;
  place-items: center;
  border-radius: var(--radius-md);
  border: 1px solid transparent;
  background: transparent;
  color: var(--text);
  cursor: pointer;
  transition: background var(--dur) var(--ease), border-color var(--dur) var(--ease), transform 120ms var(--ease);
}
.nav-btn:hover { background: var(--surface-2); border-color: var(--border); }
.nav-btn:active { transform: scale(0.94); }
.nav-btn:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }

.nav-btn--ghost-slot {
  border: 1px dashed var(--border);
  color: var(--text-muted);
  opacity: 0.5;
}
"

#let theme-popup-css() = "
.panel-menu { position: relative; }

.menu__swatch {
  width: 14px; height: 14px; border-radius: 50%;
  border: 1px solid var(--border); flex-shrink: 0;
}

.panel-menu__list {
  position: absolute;
  top: calc(100% + 10px);
  right: 0;
  min-width: 220px;
  margin: 0;
  padding: 6px;
  list-style: none;
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-md);
  box-shadow: 0 12px 32px var(--shadow);
  z-index: 20;
}
.panel-menu__list li {
  display: flex; align-items: center; gap: 10px;
  padding: 9px 10px; border-radius: var(--radius-sm);
  font-size: 0.86rem; cursor: pointer; color: var(--text);
}
.panel-menu__list li:hover,
.panel-menu__list li:focus-visible { background: var(--accent-soft); outline: none; }
.panel-menu__list li .check { width: 15px; height: 15px; margin-left: auto; opacity: 0; color: var(--accent); }
.panel-menu__list li[aria-selected=\"true\"] .check { opacity: 1; }
"

#let hamburger-drawer-css() = "
.drawer-backdrop {
  position: fixed; inset: 0;
  background: rgba(0,0,0,0.4);
  opacity: 0; pointer-events: none;
  transition: opacity var(--dur) var(--ease);
  z-index: 30;
}
.drawer-backdrop.open { opacity: 1; pointer-events: auto; }

.drawer {
  position: fixed; top: 0; left: 0; bottom: 0;
  width: 240px;
  background: var(--surface);
  border-right: 1px solid var(--border);
  transform: translateX(-100%);
  transition: transform var(--dur) var(--ease);
  z-index: 31;
  padding: 20px;
}
.drawer.open { transform: translateX(0); }
.drawer h3 { margin: 0 0 12px; font-size: 0.9rem; color: var(--text-muted); }
.drawer a {
  display: block; padding: 10px 8px; border-radius: var(--radius-sm);
  color: var(--text); text-decoration: none; font-size: 0.92rem;
}
.drawer a:hover { background: var(--surface-2); }
"

// Joins every CSS chunk (tokens + components) into one stylesheet string.
#let full-css() = (
  theme-tokens-css()
  + base-css()
  + topnav-shell-css()
  + nav-btn-css()
  + theme-popup-css()
  + hamburger-drawer-css()
)


// ---------------------------------------------------------------------
// 3. CLIENT-SIDE JS
// ---------------------------------------------------------------------
// Split into a few focused snippets, joined into a single IIFE.
// Swatch colors are injected from the `themes` array above so JS and
// CSS never fall out of sync.

#let theme-persistence-js() = "
  const THEMES = " + repr(themes.map(t => t.id)) + ".map(String);
  const STORAGE_KEY = `theme-preference`;

  function resolveInitial() {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored && THEMES.includes(stored)) return stored;
    return window.matchMedia && window.matchMedia(`(prefers-color-scheme: dark)`).matches
      ? THEMES[0]
      : (THEMES[1] || THEMES[0]);
  }

  function applyTheme(id) {
    document.documentElement.setAttribute(`data-theme`, id);
    localStorage.setItem(STORAGE_KEY, id);
  }

  applyTheme(resolveInitial());
"

#let theme-popup-js() = "
  const panel = document.querySelector(`[data-theme-panel]`);
  if (panel) {
    const trigger = panel.querySelector(`button[aria-haspopup]`);
    const list = panel.querySelector(`.panel-menu__list`);
    const options = [...panel.querySelectorAll(`[data-theme-option]`)];

    function closePanel() { list.hidden = true; trigger.setAttribute(`aria-expanded`, `false`); }
    function openPanel() {
      list.hidden = false;
      trigger.setAttribute(`aria-expanded`, `true`);
      const current = document.documentElement.getAttribute(`data-theme`);
      (options.find(o => o.dataset.themeOption === current) || options[0]).focus();
    }
    function syncSelected() {
      const current = document.documentElement.getAttribute(`data-theme`);
      options.forEach(o => o.setAttribute(`aria-selected`, String(o.dataset.themeOption === current)));
    }

    trigger.addEventListener(`click`, (e) => {
      e.stopPropagation();
      list.hidden ? openPanel() : closePanel();
    });
    options.forEach((opt) => {
      opt.tabIndex = -1;
      opt.addEventListener(`click`, () => {
        applyTheme(opt.dataset.themeOption);
        syncSelected();
        closePanel();
        trigger.focus();
      });
      opt.addEventListener(`keydown`, (e) => {
        if (e.key === `Enter` || e.key === ` `) { e.preventDefault(); opt.click(); }
        else if (e.key === `Escape`) { closePanel(); trigger.focus(); }
        else if (e.key === `ArrowDown` || e.key === `ArrowUp`) {
          e.preventDefault();
          const dir = e.key === `ArrowDown` ? 1 : -1;
          const idx = options.indexOf(document.activeElement);
          options[(idx + dir + options.length) % options.length].focus();
        }
      });
    });
    document.addEventListener(`click`, (e) => { if (!panel.contains(e.target)) closePanel(); });
    document.addEventListener(`keydown`, (e) => { if (e.key === `Escape` && !list.hidden) closePanel(); });
    syncSelected();
  }
"

#let hamburger-drawer-js() = "
  const hamburgerBtn = document.getElementById(`hamburgerBtn`);
  const drawer = document.getElementById(`drawer`);
  const backdrop = document.getElementById(`drawerBackdrop`);
  if (hamburgerBtn && drawer && backdrop) {
    function openDrawer() {
      drawer.classList.add(`open`);
      backdrop.classList.add(`open`);
      hamburgerBtn.setAttribute(`aria-expanded`, `true`);
    }
    function closeDrawer() {
      drawer.classList.remove(`open`);
      backdrop.classList.remove(`open`);
      hamburgerBtn.setAttribute(`aria-expanded`, `false`);
    }
    hamburgerBtn.addEventListener(`click`, (e) => {
      e.stopPropagation();
      drawer.classList.contains(`open`) ? closeDrawer() : openDrawer();
    });
    backdrop.addEventListener(`click`, closeDrawer);
  }
"

// Wraps every JS chunk in a single IIFE.
#let full-js() = (
  "(function () {"
  + theme-persistence-js()
  + theme-popup-js()
  + hamburger-drawer-js()
  + "})();"
)


// ---------------------------------------------------------------------
// 4. INJECTION HELPERS
// ---------------------------------------------------------------------
// Small wrappers so the CSS/JS only get emitted (once) when we're
// actually targeting HTML.

#let inject-css() = context {
  if target() == "html" {
    html.style(full-css())
  }
}

#let inject-js() = context {
  if target() == "html" {
    html.script(full-js())
  }
}


// ---------------------------------------------------------------------
// 5. SMALL SVG ICON HELPERS
// ---------------------------------------------------------------------
// Each returns an <svg> as Typst HTML content. Keeping them as
// standalone functions makes it trivial to swap an icon later.

#let _svg-icon(view-box: "0 0 24 24", fill: "none", stroke: none, stroke-width: none, path-d: (), extra: none) = {
  let attrs = (
    viewBox: view-box,
    class: "icon",
    fill: fill,
  )
  if stroke != none { attrs.insert("stroke", stroke) }
  if stroke-width != none { attrs.insert("stroke-width", stroke-width) }
  html.elem("svg", attrs: attrs,
    if extra != none { extra } else {
      for d in path-d {
        html.elem("path", attrs: (d: d, "stroke-linecap": "round"))
      }
    }
  )
}

#let icon-hamburger() = _svg-icon(
  stroke: "currentColor",
  stroke-width: "2",
  path-d: ("M3 6h18M3 12h18M3 18h18",),
)

#let icon-pdf() = _svg-icon(
  fill: "currentColor",
  path-d: (
    "M0 64C0 28.7 28.7 0 64 0L224 0l0 128c0 17.7 14.3 32 32 32l128 0 0 288c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 64zm384 64l-128 0L256 0 384 128zM64 320c0-8.8 7.2-16 16-16l16 0c22.1 0 40 17.9 40 40s-17.9 40-40 40l-8 0 0 24c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-40 0-48zm32 32c4.4 0 8-3.6 8-8s-3.6-8-8-8l-8 0 0 16 8 0zm80-32c0-8.8 7.2-16 16-16l16 0c17.7 0 32 14.3 32 32l0 32c0 17.7-14.3 32-32 32l-16 0c-8.8 0-16-7.2-16-16l0-64zm32 64c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l0 64zm64-64c0-8.8 7.2-16 16-16l24 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-8 0 0 16 8 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-8 0 0 16c0 8.8-7.2 16-16 16s-16-7.2-16-16l0-32 0-32z",
  ),
  view-box: "0 0 384 512",
)

#let icon-palette() = _svg-icon(
  fill: "currentColor",
  path-d: (
    "M480.5 10.3L259.1 158c-29.1 19.4-47.6 50.9-50.6 85.3 62.3 12.8 111.4 61.9 124.3 124.3 34.5-3 65.9-21.5 85.3-50.6L565.7 95.5c6.7-10.1 10.3-21.9 10.3-34.1 0-33.9-27.5-61.4-61.4-61.4-12.1 0-24 3.6-34.1 10.3zM288 400c0-61.9-50.1-112-112-112S64 338.1 64 400c0 3.9 .2 7.8 .6 11.6 1.8 17.5-10.2 36.4-27.8 36.4L32 448c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0c61.9 0 112-50.1 112-112z",
  ),
  view-box: "0 0 576 512",
)

#let icon-check() = _svg-icon(
  stroke: "currentColor",
  stroke-width: "2",
  path-d: ("M20 6L9 17l-5-5",),
)

#let icon-dots() = _svg-icon(
  stroke: "currentColor",
  stroke-width: "2",
  extra: (
    html.elem("circle", attrs: (cx: "5",  cy: "12", r: "1.5"))
    + html.elem("circle", attrs: (cx: "12", cy: "12", r: "1.5"))
    + html.elem("circle", attrs: (cx: "19", cy: "12", r: "1.5"))
  ),
)


// ---------------------------------------------------------------------
// 6. NAV BUTTON COMPONENTS
// ---------------------------------------------------------------------

// A plain icon button, e.g. hamburger / PDF export.
#let nav-icon-button(
  icon,
  label: "",
  id: none,
  extra-class: "",
  extra-attrs: (:),
) = context {
  if target() == "html" {
    let attrs = (
      class: "nav-btn " + extra-class,
      "aria-label": label,
    )
    if id != none { attrs.insert("id", id) }
    attrs += extra-attrs
    html.button(attrs: attrs, icon)
  }
}

// One row in the theme popup list.
#let _theme-option-item(theme, selected: false) = context {
  if target() == "html" {
    html.li(
      attrs: (
        role: "option",
        "data-theme-option": theme.id,
        "aria-selected": str(selected),
      ),
      html.span(attrs: (
        class: "menu__swatch",
        style: "background:" + theme.swatch.to-hex(),
      ))
        + " " + theme.label + " "
        + icon-check()
    )
  }
}

// The theme button: icon trigger + popup list of all registered themes.
#let theme-button(initial: default-theme) = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "panel-menu", "data-theme-panel": "true"))[
      #html.button(attrs: (
        class: "nav-btn",
        "aria-haspopup": "listbox",
        "aria-expanded": "false",
        "aria-label": "Choose theme",
      ))[#icon-palette()]
      #html.ul(attrs: (class: "panel-menu__list", role: "listbox", hidden: "hidden"))[
        #for theme in themes [
          #_theme-option-item(theme, selected: theme.id == initial)
        ]
      ]
    ]
  }
}

// Reserved slot for future buttons — visually present, functionally inert.
#let nav-placeholder-slot(label: "More options (coming soon)") = nav-icon-button(
  icon-dots(),
  label: label,
  extra-class: "nav-btn--ghost-slot",
  extra-attrs: (disabled: "disabled"),
)


// ---------------------------------------------------------------------
// 7. HAMBURGER DRAWER (bare-bones side panel driven by the hamburger)
// ---------------------------------------------------------------------
// `links` is an array of (label, href) pairs.

#let hamburger-drawer(title: "Menu", links: ()) = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "drawer-backdrop", id: "drawerBackdrop"))[]
    html.elem("aside", attrs: (class: "drawer", id: "drawer"))[
      #html.h3()[#title]
      #for (text, href) in links [
        #html.a(attrs: (href: href))[#text]
      ]
    ]
  }
}


// ---------------------------------------------------------------------
// 8. TOP-LEVEL ASSEMBLY
// ---------------------------------------------------------------------
// `drawer-links`: array of (label, href) shown in the hamburger drawer.
// `right-slots`: extra content (functions returning html content) to
//                 append after the theme button, for buttons "yet to come".

#let topnav(
  drawer-title: "Menu",
  drawer-links: (("Dashboard", "#"), ("Documents", "#"), ("Settings", "#"), ("Help", "#")),
  initial-theme: default-theme,
  right-slots: (nav-placeholder-slot,),
) = context {
  if target() == "html" {
    inject-css()
    inject-js()

    html.elem("nav", attrs: (class: "topnav"))[
      #html.elem("div", attrs: (class: "topnav__left"))[
        #nav-icon-button(
          icon-hamburger(),
          label: "Open menu",
          id: "hamburgerBtn",
          extra-attrs: ("aria-haspopup": "true", "aria-expanded": "false"),
        )
      ]
      #html.elem("div", attrs: (class: "topnav__right"))[
        #nav-icon-button(icon-pdf(), label: "Export PDF")
        #theme-button(initial: initial-theme)
        #for slot in right-slots [ #slot() ]
      ]
    ]

    #hamburger-drawer(title: drawer-title, links: drawer-links)
  }
}