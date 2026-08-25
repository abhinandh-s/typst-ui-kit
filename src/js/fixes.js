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

// inject favicon into `<head>`
const addFavicon = (href, type) => {
  const link = document.createElement('link');
  link.rel = 'icon';
  link.href = href;
  if (type) link.type = type;
  document.head.appendChild(link);
};

addFavicon('images/favicon.svg', 'image/svg+xml');
addFavicon('images/favicon.ico', 'image/x-icon');
