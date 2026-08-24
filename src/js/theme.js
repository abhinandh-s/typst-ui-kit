(function () {
  const THEMES = [
    "mocha",
    "macchiato",
    "frappe",
    "latte",
    "tokyo-night",
    "tokyo-night-storm",
    "tokyo-night-light",
    "everforest-dark-medium",
    "everforest-dark-hard",
    "everforest-light-medium"
  ];
  const STORAGE_KEY = "theme";

  function resolveInitial() {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored && THEMES.includes(stored)) return stored;
    return window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches
      ? "mocha"
      : "latte";
  }

  function applyTheme(id) {
    document.documentElement.setAttribute("data-theme", id);
    localStorage.setItem(STORAGE_KEY, id);
  }

  // Initial paint configuration
  applyTheme(resolveInitial());

  window.addEventListener("DOMContentLoaded", () => {
    const panel = document.querySelector("[data-theme-panel]");
    if (!panel) return;

    const trigger = panel.querySelector("#theme-toggle");
    const list = panel.querySelector(".tb-list");
    const options = Array.from(panel.querySelectorAll("[data-theme-option]"));

    function closePanel() {
      list.hidden = true;
      trigger.setAttribute("aria-expanded", "false");
    }

    function openPanel() {
      list.hidden = false;
      trigger.setAttribute("aria-expanded", "true");
      const current = document.documentElement.getAttribute("data-theme");
      const active = options.find((o) => o.dataset.themeOption === current);
      (active || options[0]).focus();
    }

    function syncSelected() {
      const current = document.documentElement.getAttribute("data-theme");
      options.forEach((o) =>
        o.setAttribute("aria-selected", String(o.dataset.themeOption === current))
      );
    }

    trigger.addEventListener("click", (e) => {
      e.stopPropagation();
      list.hidden ? openPanel() : closePanel();
    });

    options.forEach((opt) => {
      opt.addEventListener("click", () => {
        applyTheme(opt.dataset.themeOption);
        syncSelected();
        closePanel();
        trigger.focus();
      });

      opt.addEventListener("keydown", (e) => {
        if (e.key === "Enter" || e.key === " ") {
          e.preventDefault();
          opt.click();
        } else if (e.key === "Escape") {
          closePanel();
          trigger.focus();
        } else if (e.key === "ArrowDown" || e.key === "ArrowUp") {
          e.preventDefault();
          const dir = e.key === "ArrowDown" ? 1 : -1;
          const idx = options.indexOf(document.activeElement);
          const next = options[(idx + dir + options.length) % options.length];
          next.focus();
        }
      });
    });

    document.addEventListener("click", (e) => {
      if (!panel.contains(e.target)) closePanel();
    });

    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape" && !list.hidden) closePanel();
    });

    syncSelected();
  });
})();
