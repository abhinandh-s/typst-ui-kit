#let _fw-js = html.script("
  document.addEventListener('DOMContentLoaded', () => {
  const island = document.getElementById('island');
  const overlay = document.getElementById('overlay');
  const floatingWindow = document.getElementById('floatingWindow');
  const fwClose = document.getElementById('fwClose');
  const fwBody = document.getElementById('fwBody');
  const fwProgressBar = document.getElementById('fwProgressBar');

  // Start hidden on page load
  island.classList.add('hidden');

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
  const jitterThreshold = 6; // ignore tiny scroll jitter
  const showThreshold = 120; // minimum scroll distance from top before showing

  function onScroll() {
    const currentY = window.scrollY;
    const diff = currentY - lastScrollY;

    // Hide if user is near the very top of the page
    if (currentY < showThreshold) {
      island.classList.add('hidden');
      lastScrollY = currentY;
      ticking = false;
      return;
    }

    // Handle scroll direction when past the threshold
    if (Math.abs(diff) > jitterThreshold) {
      if (diff > 0) {
        // Scrolling down -> hide
        island.classList.add('hidden');
      } else {
        // Scrolling up -> show
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
    _island-wrap
    _overlay
    _floating-window
    _fw-js
  }
}