document.addEventListener('DOMContentLoaded', function() {
    const nav = document.querySelector('.bottom-nav');
    const endnotes = document.querySelector('section[role=\"doc-endnotes\"]');
    
    if (endnotes) {
      const divider = document.createElement('hr');
      divider.className = 'footnotes-divider';
      endnotes.insertAdjacentElement('beforebegin', divider);
      
      if (nav) {
        endnotes.insertAdjacentElement('afterend', nav);
      }
    } else if (nav) {
      document.body.appendChild(nav);
    }
});