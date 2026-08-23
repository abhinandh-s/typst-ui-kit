document.addEventListener("DOMContentLoaded", () => {
    const toggleBtn = document.getElementById("sidebar-toggle");
    const sidebar = document.getElementById("sidebar");

    toggleBtn.addEventListener("click", () => {
      document.body.classList.toggle("sidebar-toggled");
    });

    sidebar.addEventListener("click", (event) => {
      if (event.target.closest("a")) {
        document.body.classList.remove("sidebar-toggled");
      }
    });

    // close when clicking outside the sidebar
    document.addEventListener("click", (event) => {
      const isOpen = document.body.classList.contains("sidebar-toggled");
      if (!isOpen) return;

      const clickedInsideSidebar = sidebar.contains(event.target);
      const clickedToggleBtn = toggleBtn.contains(event.target);

      if (!clickedInsideSidebar && !clickedToggleBtn) {
        document.body.classList.remove("sidebar-toggled");
      }
    });
  });