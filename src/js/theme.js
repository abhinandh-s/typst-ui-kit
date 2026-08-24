let savedTheme = localStorage.getItem('theme');
  if (!savedTheme) {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    savedTheme = prefersDark ? 'dark' : 'light';
  } 

document.documentElement.setAttribute('data-theme', savedTheme);

console.log(`[theme]: set to ${savedTheme}`)

const themes = ['dark', 'light'];

let currentTheme = document.documentElement.getAttribute('data-theme') || 'dark';

function toggleTheme() {
  let index = themes.indexOf(currentTheme);
  currentTheme = themes[(index + 1) % themes.length];

  document.documentElement.setAttribute('data-theme', currentTheme);
  localStorage.setItem('theme', currentTheme);
  console.log(`[theme]: set to ${currentTheme}`)
}

window.addEventListener('DOMContentLoaded', () => {
  const btn = document.getElementById('theme-toggle');
  if (btn) {
      btn.onclick = toggleTheme;
  }
});


