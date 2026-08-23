#import "/src/lib.typ": alerts,init
// , theme-switcher
// #import "/src/topnav.typ": topnav
// #topnav()
// #theme-switcher()



#let _fw-js() = html.script("
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

  fwfwBody.addEventListener('scroll'updateProgress, { passive: true });

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
")

#let _fw-css() = html.style("
  :root {
    color-scheme: dark;
  }

  * { box-sizing: border-box; }

  body {
    margin: 0;
    font-family: -apple-system, BlinkMacSystemFont, \"Segoe UI\", Roboto, sans-serif;
    background: #0b0b0d;
    color: #f2f2f2;
  }

  /* ---------- Page content (just to allow scrolling) ---------- */
  .content {
    padding: 24px;
    max-width: 640px;
    margin: 0 auto;
  }

  .content h1 {
    font-size: 22px;
    margin-top: 100px;
  }

  .block {
    height: 300px;
    border-radius: 16px;
    background: linear-gradient(135deg, #1c1c1f, #262629);
    margin: 20px 0;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #666;
    font-size: 14px;
  }

  /* ---------- The Pill ---------- */
  .island-wrap {
    position: fixed;
    top: 14px;
    left: 0;
    right: 0;
    display: flex;
    justify-content: center;
    z-index: 100;
    pointer-events: none; /* let clicks pass through wrapper */
  }

  .island {
    pointer-events: auto;
    background: #000;
    color: #fff;
    border-radius: 999px;
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 10px 18px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.4);
    cursor: pointer;
    user-select: none;

    transform: translateY(0) scale(1);
    opacity: 1;
    transition: transform 0.35s cubic-bezier(0.34, 1.56, 0.64, 1),
                opacity 0.25s ease,
                border-radius 0.3s ease;
  }

  .island.hidden {
    transform: translateY(-140%) scale(0.85);
    opacity: 0;
    pointer-events: none;
  }

  .island .dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #34c759;
    flex: none;
  }

  .island .label {
    font-size: 13px;
    font-weight: 500;
    white-space: nowrap;
  }

  /* ---------- Overlay + Floating window ---------- */
  .overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.5);
    backdrop-filter: blur(2px);
    z-index: 150;
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.25s ease;
  }

  .overlay.show {
    opacity: 1;
    pointer-events: auto;
  }

  .floating-window {
    position: fixed;
    top: 60px;
    left: 50%;
    width: min(90vw, 380px);
    max-height: 50vh; /* half screen on mobile */
    background: #1c1c1f;
    border-radius: 22px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.5);
    z-index: 160;
    overflow: hidden;
    display: flex;
    flex-direction: column;

    transform: translate(-50%, -20px) scale(0.9);
    opacity: 0;
    pointer-events: none;
    transition: transform 0.3s cubic-bezier(0.34, 1.56, 0.64, 1),
                opacity 0.25s ease;
  }

  .floating-window.show {
    transform: translate(-50%, 0) scale(1);
    opacity: 1;
    pointer-events: auto;
  }

  .fw-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 14px 18px;
    border-bottom: 1px solid rgba(255,255,255,0.08);
    flex: none;
  }

  .fw-header h2 {
    font-size: 15px;
    margin: 0;
    font-weight: 600;
  }

  .fw-close {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: rgba(255,255,255,0.08);
    border: none;
    color: #fff;
    font-size: 15px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  /* Scroll progress indicator (thin bar under header) */
  .fw-progress-track {
    height: 3px;
    background: rgba(255,255,255,0.08);
    flex: none;
    position: relative;
  }

  .fw-progress-bar {
    height: 100%;
    width: 0%;
    background: #34c759;
    border-radius: 0 2px 2px 0;
    transition: width 0.08s linear;
  }

  .fw-body {
    padding: 16px 18px 22px;
    overflow-y: auto;
    font-size: 14px;
    line-height: 1.6;
    color: #cfcfcf;

    /* Firefox scrollbar */
    scrollbar-width: thin;
    scrollbar-color: rgba(255,255,255,0.25) transparent;
  }

  .fw-body p { margin: 0 0 12px; }

  /* Webkit scrollbar (Chrome, Safari, iOS Safari) */
  .fw-body::-webkit-scrollbar {
    width: 5px;
  }

  .fw-body::-webkit-scrollbar-track {
    background: transparent;
  }

  .fw-body::-webkit-scrollbar-thumb {
    background: rgba(255,255,255,0.25);
    border-radius: 10px;
  }

  .fw-body::-webkit-scrollbar-thumb:hover {
    background: rgba(255,255,255,0.4);
  }

  /* ---------- Mobile-only visibility ---------- */
  .desktop-note {
    display: none;
    position: fixed;
    top: 14px;
    left: 50%;
    transform: translateX(-50%);
    background: #1c1c1f;
    color: #999;
    font-size: 13px;
    padding: 10px 16px;
    border-radius: 999px;
    z-index: 100;
  }

  @media (min-width: 769px) {
    .island-wrap, .floating-window, .overlay {
      display: none !important;
    }
    .desktop-note {
      display: block;
    }
  }
")
#let _fw-header = html.elem("div", attrs: (class: "fw-header"))[
      #html.h2()[Details]
      #html.button(class: "fw-close", id: "fwClose")[✕]
]
#let _fw-progress-track = html. elem("div", attrs: (class: "fw-progress-track"))[
      #html.elem("div", attrs: (class: "fw-progress-bar", id: "fwProgressBar"))
]
#let _fw-body = html.elem("div", attrs: (class: "fw-body", id: "fwBody"))[
      #html.p()[This is the floating window content. It opens when you tap the pill.]
      #html.p()[It takes up to half the screen height on mobile, and closes when you tap the close button or tap anywhere outside it.]
      #html.p()[Swap this content for whatever you actually need — a status, a mini player, notifications, etc.]
      #html.p()[Here's some extra filler text so you can see the scroll behavior in action. Scroll within this box and watch the green bar under the header fill up.]
      #html.p()[Paragraph five. The scrollbar itself is also styled thin and subtle so it doesn't look like a default browser scrollbar.]
      #html.p()[Paragraph six. On iOS Safari the native scrollbar is usually invisible until you scroll, so this progress bar is the more reliable indicator there.]
      #html.p()[Paragraph seven. Keep scrolling.]
      #html.p()[Paragraph eight. Almost at the bottom now.]
      #html.p()[Paragraph nine. The bar should be nearly full.]
      #html.p()[Paragraph ten — the last one. The bar should now be at 100%.]
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
      #html.span(class: "label")[Tap for details]
    ]
]
#let _toc() = context {
  if target() = "html" {
    _fw-js()
    _fw-css()
    _island-wrap
    _overlay
    _floating-window
  }
}

#_toc()


// ===================

#init.css()
#init.js()

#figure(
  image("8c346ecdd3a859b4d076baf9eb9698e1.jpg", width: 100%, height: auto),
  caption: [
    A step in the molecular testing
    pipeline of our lab.
  ],
)

= Headers

= First level title
== Second level title
=== Third level title
==== Fourth level title
===== Fifth level title

= Code

Inline `code span in` a paragraph.

```
This
  is
    code
      fence
```

```java
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
    System.out.println("This is some Java code!");
  }
}
```
This is a code block:

```
/**
 * Sorts the specified array into ascending numerical order.
 *
 * <p>Implementation note: The sorting algorithm is a Dual-Pivot Quicksort
 * by Vladimir Yaroslavskiy, Jon Bentley, and Joshua Bloch. This algorithm
 * offers O(n log(n)) performance on many data sets that cause other
 * quicksorts to degrade to quadratic performance, and is typically
 * faster than traditional (one-pivot) Quicksort implementations.
 *
 * @param a the array to be sorted
 */
public static void sort(byte[] a) {
    DualPivotQuicksort.sort(a);
}
```

= Admonishments / Alerts

#alerts.note[
  This is a GitHub-style note alert.
]

#alerts.warning[
  Be careful doing this!
]

#alerts.important[
  This is a very important message.
]

#alerts.tip[
  This is a GitHub-style note alert.
]

#alerts.caution[
  Be careful doing this!
]

#alerts.quote[
  This is a very important message.
]

#alerts.decree[
  This is a very important message. \
  - point 01
  - point 02
]