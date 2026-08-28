document.addEventListener("DOMContentLoaded", () => {  
  const accordionButtons = document.querySelectorAll('.accordion-wrapper .accordion-button');

  accordionButtons.forEach(button => {
    button.addEventListener("click", function() {
      // Toggle 'active' state on the clicked button
      const isActive = this.classList.toggle("active");
        
      this.setAttribute("aria-expanded", isActive);

      const panel = this.nextElementSibling;

      if (panel.style.maxHeight) {
        // Close the panel
        panel.style.maxHeight = null;
      } else {
        // Open the panel using scrollHeight
        panel.style.maxHeight = panel.scrollHeight + "px";
      } 
    });
  });
});