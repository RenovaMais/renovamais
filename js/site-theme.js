(function () {
  const root = document.documentElement;
  const storedTheme = localStorage.getItem('rm_theme');
  let currentTheme = storedTheme === 'dark' ? 'dark' : 'light';

  function updateControls() {
    const dark = currentTheme === 'dark';
    document.querySelectorAll('[data-theme-toggle]').forEach((button) => {
      button.setAttribute('aria-pressed', String(dark));
      button.setAttribute('aria-label', dark ? 'Mudar para tema claro' : 'Mudar para tema escuro');
    });
    document.querySelectorAll('[data-theme-icon-sun]').forEach((icon) => {
      icon.style.display = dark ? 'block' : 'none';
    });
    document.querySelectorAll('[data-theme-icon-moon]').forEach((icon) => {
      icon.style.display = dark ? 'none' : 'block';
    });
    document.querySelectorAll('[data-theme-symbol]').forEach((symbol) => {
      symbol.textContent = dark ? '☀' : '☾';
    });
  }

  function applyTheme(theme, persist) {
    currentTheme = theme === 'dark' ? 'dark' : 'light';
    root.setAttribute('data-theme', currentTheme);
    if (persist) localStorage.setItem('rm_theme', currentTheme);
    updateControls();
  }

  document.querySelectorAll('[data-theme-toggle]').forEach((button) => {
    button.addEventListener('click', () => {
      applyTheme(currentTheme === 'dark' ? 'light' : 'dark', true);
    });
  });

  applyTheme(currentTheme, false);
})();
