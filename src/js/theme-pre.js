let savedTheme = localStorage.getItem('theme');
  if (!savedTheme) {
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    savedTheme = prefersDark ? 'dark' : 'light';
  } 

document.documentElement.setAttribute('data-theme', savedTheme);

console.log(`[theme]: set to ${savedTheme}`)