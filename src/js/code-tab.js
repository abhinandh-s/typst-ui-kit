(function () {
      // Event delegation for switching tabs
      document.addEventListener("click", function (event) {
        const btn = event.target.closest(".code-tablinks");
        if (!btn) return;

        const wrapper = btn.closest(".code-tab-wrapper");
        if (!wrapper) return;

        const buttons = Array.from(wrapper.querySelectorAll(".code-tablinks"));
        const contents = Array.from(wrapper.querySelectorAll(".code-tabcontent"));
        const targetIndex = buttons.indexOf(btn);

        buttons.forEach(b => b.classList.remove("active"));
        contents.forEach(c => c.classList.remove("active"));

        btn.classList.add("active");
        if (contents[targetIndex]) {
          contents[targetIndex].classList.add("active");
        }
      });

      // Initialize default active tabs on load
      function initTabs() {
        document.querySelectorAll(".code-tab-wrapper").forEach(wrapper => {
          const firstBtn = wrapper.querySelector(".code-tablinks");
          const firstContent = wrapper.querySelector(".code-tabcontent");
          if (firstBtn && !wrapper.querySelector(".code-tablinks.active")) {
            firstBtn.classList.add("active");
          }
          if (firstContent && !wrapper.querySelector(".code-tabcontent.active")) {
            firstContent.classList.add("active");
          }
        });
      }

      if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", initTabs);
      } else {
        initTabs();
      }
})();