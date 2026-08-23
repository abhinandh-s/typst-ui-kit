
(function () {
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
})();