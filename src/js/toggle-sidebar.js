document.addEventListener("DOMContentLoaded", () => {
  const sidebar = document.getElementById("sidebar");
  const tocNav = sidebar.querySelector('nav[role="doc-toc"]');
  if (!tocNav) return;

  const scrollWrap = document.createElement("div");
  scrollWrap.className = "sidebar-scroll";
  tocNav.parentNode.insertBefore(scrollWrap, tocNav);
  scrollWrap.appendChild(tocNav);

  const header = document.createElement("div");
  header.className = "sidebar-header";
  header.innerHTML = `<h2>Contents</h2>`;
  sidebar.insertBefore(header, scrollWrap);

  sidebar.addEventListener("click", (e) => {
    if (e.target.closest("a")) {
      document.body.classList.remove("sidebar-toggled");
    }
  });
});