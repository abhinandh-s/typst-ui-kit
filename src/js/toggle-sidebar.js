document.addEventListener("DOMContentLoaded", () => {
  const sidebar = document.getElementById("sidebar");
  const body = document.body;
  const toggleBtn = document.getElementById("sidebar-toggle");

  // Restructure the toc into header + scroll area
  const tocNav = sidebar.querySelector('nav[role="doc-toc"]');
  if (tocNav) {
    const scrollWrap = document.createElement("div");
    scrollWrap.className = "sidebar-scroll";
    tocNav.parentNode.insertBefore(scrollWrap, tocNav);
    scrollWrap.appendChild(tocNav);

    const header = document.createElement("div");
    header.className = "sidebar-header";
    header.innerHTML = `<h2>Contents</h2>`;
    sidebar.insertBefore(header, scrollWrap);
  }

  // Toggle sidebar open/closed on button click
  if (toggleBtn) {
    toggleBtn.addEventListener("click", () => {
      body.classList.toggle("sidebar-toggled");
    });
  }

  // Click outside sidebar closes it
  document.addEventListener("click", (e) => {
    if (!body.classList.contains("sidebar-toggled")) return;
    const clickedInsideSidebar = sidebar.contains(e.target);
    const clickedToggleBtn = toggleBtn && toggleBtn.contains(e.target);
    if (!clickedInsideSidebar && !clickedToggleBtn) {
      body.classList.remove("sidebar-toggled");
    }
  });

  // Clicking a link inside the sidebar closes it
  sidebar.addEventListener("click", (e) => {
    if (e.target.closest("a")) {
      body.classList.remove("sidebar-toggled");
    }
  });
});