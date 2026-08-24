document.addEventListener("DOMContentLoaded", () => {
  const sidebar = document.getElementById("sidebar");
  const body = document.body;

  document.addEventListener("click", (e) => {
    const isOpen = body.classList.contains("sidebar-toggled");
    if (!isOpen) return;

    const clickedInsideSidebar = sidebar.contains(e.target);
    const clickedToggleBtn = document.getElementById("sidebar-toggle").contains(e.target);

    if (!clickedInsideSidebar && !clickedToggleBtn) {
      body.classList.remove("sidebar-toggled");
    }
  });

  sidebar.addEventListener("click", (e) => {
    if (e.target.closest("a")) {
      body.classList.remove("sidebar-toggled");
    }
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const toggleBtn = document.getElementById("sidebar-toggle");
  const body = document.body;

  if (toggleBtn) {
    toggleBtn.addEventListener("click", () => {
      body.classList.toggle("sidebar-toggled");
    });
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const sidebar = document.getElementById("sidebar");
  const tocNav = sidebar.querySelector('nav[role="doc-toc"]');
  if (!tocNav) return;

  // Wrap the toc in a header + scroll region + search box, without touching your original HTML file
  const scrollWrap = document.createElement("div");
  scrollWrap.className = "sidebar-scroll";
  tocNav.parentNode.insertBefore(scrollWrap, tocNav);
  scrollWrap.appendChild(tocNav);

  const header = document.createElement("div");
  header.className = "sidebar-header";
  header.innerHTML = `
    <h2>Contents</h2>
    <div class="sidebar-search">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
        <circle cx="11" cy="11" r="7"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
      </svg>
      <input type="text" id="toc-search" placeholder="Search pages…" autocomplete="off" />
    </div>
  `;
  sidebar.insertBefore(header, scrollWrap);

  const emptyMsg = document.createElement("div");
  emptyMsg.className = "sidebar-empty";
  emptyMsg.id = "toc-empty";
  emptyMsg.textContent = "No matching pages.";
  scrollWrap.appendChild(emptyMsg);

  // Highlight the current page link
  const links = Array.from(tocNav.querySelectorAll("a"));
  const currentPath = window.location.pathname.split("/").pop() || "index.html";
  const currentHash = window.location.hash;

  links.forEach((a) => {
    const href = a.getAttribute("href") || "";
    const [hrefPath, hrefHash] = href.split("#");
    const linkPath = hrefPath || currentPath;
    const matchesPath = linkPath === currentPath || (linkPath === "" && currentPath === "index.html");
    const matchesHash = hrefHash ? "#" + hrefHash === currentHash : true;

    if (matchesPath && (currentHash ? matchesHash : true)) {
      a.classList.add("active");
    }
  });

  // If nothing matched by hash, fall back to matching just the file
  if (!tocNav.querySelector("a.active")) {
    const firstPathMatch = links.find((a) => {
      const hrefPath = (a.getAttribute("href") || "").split("#")[0];
      return hrefPath === currentPath;
    });
    if (firstPathMatch) firstPathMatch.classList.add("active");
  }

  // Scroll active link into view within the sidebar
  const activeLink = tocNav.querySelector("a.active");
  if (activeLink) {
    activeLink.scrollIntoView({ block: "center" });
  }

  // Search / filter
  const searchInput = document.getElementById("toc-search");
  const items = Array.from(tocNav.querySelectorAll("li"));

  searchInput.addEventListener("input", () => {
    const q = searchInput.value.trim().toLowerCase();

    if (!q) {
      items.forEach((li) => li.classList.remove("filtered-out"));
      emptyMsg.classList.remove("show");
      return;
    }

    let anyVisible = false;
    items.forEach((li) => {
      const text = li.textContent.toLowerCase();
      if (text.includes(q)) {
        li.classList.remove("filtered-out");
        anyVisible = true;
      } else {
        li.classList.add("filtered-out");
      }
    });

    emptyMsg.classList.toggle("show", !anyVisible);
  });
});