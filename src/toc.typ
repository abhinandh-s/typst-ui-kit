#let _fw-js = html.script("
  document.addEventListener('DOMContentLoaded', () => {
    const island = document.getElementById('island');
    const overlay = document.getElementById('overlay');
    const floatingWindow = document.getElementById('floatingWindow');
    const fwClose = document.getElementById('fwClose');
    const fwBody = document.getElementById('fwBody');
    const fwProgressBar = document.getElementById('fwProgressBar');

    // Scroll progress indicator for floating window content
    function updateProgress() {
      const scrollable = fwBody.scrollHeight - fwBody.clientHeight;
      const pct = scrollable > 0 ? (fwBody.scrollTop / scrollable) * 100 : 0;
      fwProgressBar.style.width = pct + '%';
    }

    fwBody.addEventListener('scroll', updateProgress, { passive: true });

    // Scroll show/hide
    let lastScrollY = window.scrollY;
    let ticking = false;
    const threshold = 6; // ignore tiny scroll jitter

    function onScroll() {
      const currentY = window.scrollY;
      const diff = currentY - lastScrollY;

      if (Math.abs(diff) > threshold) {
        if (diff > 0 && currentY > 40) {
          // scrolling down the page -> hide
          island.classList.add('hidden');
        } else {
          // scrolling up -> show
          island.classList.remove('hidden');
        }
        lastScrollY = currentY;
      }
      ticking = false;
    }

    window.addEventListener('scroll', () => {
      if (!ticking) {
        window.requestAnimationFrame(onScroll);
        ticking = true;
      }
    }, { passive: true });

    // Open / close floating window
    function openWindow() {
      overlay.classList.add('show');
      floatingWindow.classList.add('show');
      fwBody.scrollTop = 0;
      updateProgress();
    }

    function closeWindow() {
      overlay.classList.remove('show');
      floatingWindow.classList.remove('show');
    }

    island.addEventListener('click', openWindow);
    fwClose.addEventListener('click', closeWindow);
    overlay.addEventListener('click', closeWindow);

    // Prevent clicks inside the window from bubbling to overlay
    floatingWindow.addEventListener('click', (e) => e.stopPropagation());
  });
")


#let _fw-css = html.style("

")
#let _fw-header = html.elem("div", attrs: (class: "fw-header"))[
      #html.h2()[Table of Contents]
      #html.button(class: "fw-close", id: "fwClose")[✕]
]
#let _fw-progress-track = html. elem("div", attrs: (class: "fw-progress-track"))[
      #html.elem("div", attrs: (class: "fw-progress-bar", id: "fwProgressBar"))
]
#let _fw-body = html.elem("div", attrs: (class: "fw-body", id: "fwBody"))[
        #outline(target: heading.where(bookmarked: false, outlined: true))
]
#let _floating-window = html.elem("div", attrs: (class: "floating-window", id: "floatingWindow"))[
  #_fw-header
  #_fw-progress-track 
  #_fw-body
]

#let _overlay = html.elem("div", attrs: (class: "overlay", id: "overlay"))
#let _island-wrap = html.elem("div", attrs: (class: "island-wrap"))[
    #html.elem("div", attrs: (class: "island", id: "island"))[
      #html.span(class:"dot")
      #html.span(class: "label")[Table of Contents]
    ]
]
#let floating-toc() = context {
  if target() == "html" {
    _fw-css
    _island-wrap
    _overlay
    _floating-window
    _fw-js
  }
}