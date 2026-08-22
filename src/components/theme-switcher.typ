#import "../colors.typ": latte

#let css() = context {
  if target() == "html" {
    html.style("
      
/*
  THEME TOKENS
  ============
  Each [data-theme=\"…\"] block is a complete, self-contained theme.
  Add a theme: copy a block, rename it, add its id/label to THEMES in the script below.
*/
:root {
  --radius-sm: 6px;
  --radius-md: 10px;
  --radius-lg: 16px;
  --radius-pill: 999px;
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

* { box-sizing: border-box; }

html, body {
  margin: 0;
  min-height: 100vh;
  background: var(--bg);
  color: var(--text);
  font-family: var(--font-ui);
  transition: background var(--dur) var(--ease), color var(--dur) var(--ease);
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
}

@media (prefers-reduced-motion: reduce) {
  * { transition-duration: 0.01ms !important; animation-duration: 0.01ms !important; }
}

.icon { width: 18px; height: 18px; }

/* ---------- trigger button ---------- */
.btn-theme {
  font-family: inherit;
  cursor: pointer;
  border: 1px solid var(--border);
  background: var(--surface-2);
  color: var(--text);
  transition: background var(--dur) var(--ease), border-color var(--dur) var(--ease),
              transform 120ms var(--ease), color var(--dur) var(--ease);
}
.btn-theme:hover { border-color: var(--accent); }
.btn-theme:active { transform: scale(0.94); }
.btn-theme:focus-visible {
  outline: 2px solid var(--accent);
  outline-offset: 2px;
}
.btn-theme--circle {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  display: grid;
  place-items: center;
  position: relative;
}

/* ---------- popup (swatch-list style) ---------- */
.panel-menu { position: relative; display: inline-block; }

.menu__swatch {
  width: 14px;
  height: 14px;
  border-radius: 50%;
  border: 1px solid var(--border);
  flex-shrink: 0;
}
[data-swatch=\"mocha\"] { background: #cba6f7; }
[data-swatch=\"latte\"] { background: #8839ef; }
[data-swatch=\"nord\"] { background: #88c0d0; }
[data-swatch=\"dracula\"] { background: #ff79c6; }
[data-swatch=\"solarized-light\"] { background: #2aa198; }

.panel-menu__list {
  position: absolute;
  top: calc(100% + 10px);
  left: 50%;
  transform: translateX(-50%);
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
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 9px 10px;
  border-radius: var(--radius-sm);
  font-size: 0.86rem;
  cursor: pointer;
  color: var(--text);
}
.panel-menu__list li:hover,
.panel-menu__list li:focus-visible { background: var(--accent-soft); outline: none; }
.panel-menu__list li .check { width: 15px; height: 15px; margin-left: auto; opacity: 0; color: var(--accent); }
.panel-menu__list li[aria-selected=\"true\"] .check { opacity: 1; }


    ")
  }
}


#let js() = context {
  if target() == "html" {
    html.script("(function () {
  // ---- Registry: add a theme here + a matching [data-theme] block in <style> ----
  const THEMES = [
    { id: `mocha`,           label: `Catppuccin Mocha` },
    { id: `latte`,           label: `Catppuccin Latte` },
    { id: `nord`,            label: `Nord` },
    { id: `dracula`,         label: `Dracula` },
    { id: `solarized-light`, label: `Solarized Light` },
  ];
  const STORAGE_KEY = `theme-preference`;

  function resolveInitial() {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored && THEMES.some((t) => t.id === stored)) return stored;
    return window.matchMedia && window.matchMedia(`(prefers-color-scheme: dark)`).matches ? `mocha` : `latte`;
  }

  function applyTheme(id) {
    document.documentElement.setAttribute(`data-theme`, id);
    localStorage.setItem(STORAGE_KEY, id);
  }

  applyTheme(resolveInitial());

  // ---- popup wiring ----
  const panel = document.querySelector(`[data-theme-panel]`);
  const trigger = panel.querySelector(`button[aria-haspopup]`);
  const list = panel.querySelector(`.panel-menu__list`);
  const options = [...panel.querySelectorAll(`[data-theme-option]`)];

  function closePanel() {
    list.hidden = true;
    trigger.setAttribute(`aria-expanded`, `false`);
  }
  function openPanel() {
    list.hidden = false;
    trigger.setAttribute(`aria-expanded`, `true`);
    const current = document.documentElement.getAttribute(`data-theme`);
    const active = options.find((o) => o.dataset.themeOption === current);
    (active || options[0]).focus();
  }
  function syncSelected() {
    const current = document.documentElement.getAttribute(`data-theme`);
    options.forEach((o) => o.setAttribute(`aria-selected`, String(o.dataset.themeOption === current)));
  }

  trigger.addEventListener(`click`, () => (list.hidden ? openPanel() : closePanel()));

  options.forEach((opt) => {
    opt.tabIndex = -1;
    opt.addEventListener(`click`, () => {
      applyTheme(opt.dataset.themeOption);
      syncSelected();
      closePanel();
      trigger.focus();
    });
    opt.addEventListener(`keydown`, (e) => {
      if (e.key === `Enter` || e.key === ` `) {
        e.preventDefault();
        opt.click();
      } else if (e.key === `Escape`) {
        closePanel();
        trigger.focus();
      } else if (e.key === `ArrowDown` || e.key === `ArrowUp`) {
        e.preventDefault();
        const dir = e.key === `ArrowDown` ? 1 : -1;
        const idx = options.indexOf(document.activeElement);
        const next = options[(idx + dir + options.length) % options.length];
        next.focus();
      }
    });
  });

  document.addEventListener(`click`, (e) => {
    if (!panel.contains(e.target)) closePanel();
  });
  document.addEventListener(`keydown`, (e) => {
    if (e.key === `Escape` && !list.hidden) closePanel();
  });

  syncSelected();
})();")
  }
}


#let _list-item(name: "Dracula", short: "dracula") = context {
  if target() == "html" {
    html.li(.. (
      role: "option",
      "data-theme-option": short,
      "aria-selected": "true",
    ))[
      #html.span(
        .. (
          class: "menu__swatch",
          "data-swatch": short
        )
      )
      #name
      #html.elem(
        "svg",
         attrs: (
           viewBox: "0 0 24 24",
           stroke:"currentColor", 
           "stroke-width":"2",
           class: "check",
           fill: "none",
         ),
         html.elem(
           "path", 
           attrs: (d: "M20 6L9 17l-5-5")
         )
       )
     ]
  }
}

#let theme-switcher() = context {
  if target() == "html" {
    css()
    js()
    html.elem("div",
      attrs: (
        class: "panel-menu",
        "data-theme-panel": "data-theme-panel"
      )
    )[  
      #html.button(
        .. (
          class: "btn-theme btn-theme--circle",
          "aria-haspopup": "listbox",
          "aria-expanded": "false",
          "aria-label": "Choose theme",
        )
      )[
        #html.elem(
           "svg",
           attrs: (
             viewBox: "0 0 576 512",
             class: "icon",
             fill: "currentColor",
           ),
           html.elem(
             "path", 
             attrs: (d: "M480.5 10.3L259.1 158c-29.1 19.4-47.6 50.9-50.6 85.3 62.3 12.8 111.4 61.9 124.3 124.3 34.5-3 65.9-21.5 85.3-50.6L565.7 95.5c6.7-10.1 10.3-21.9 10.3-34.1 0-33.9-27.5-61.4-61.4-61.4-12.1 0-24 3.6-34.1 10.3zM288 400c0-61.9-50.1-112-112-112S64 338.1 64 400c0 3.9 .2 7.8 .6 11.6 1.8 17.5-10.2 36.4-27.8 36.4L32 448c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0c61.9 0 112-50.1 112-112z")
           )
         )
       ]
      #html.ul(
        class: "panel-menu__list",
        role: "listbox",
        hidden: "hidden"
      )[
        #_list-item(name: "Catppuccin Mocha", short: "mocha")
        #_list-item(name: "Catppuccin Latte", short: "latte")
        #_list-item(name: "Nord", short: "nord")
        #_list-item(name: "Dracula", short: "dracula")
      ]
    ]
  }
}
