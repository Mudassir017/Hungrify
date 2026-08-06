/**
 * Theme management: toggle, localStorage persistence, system preference detection.
 * Backend-friendly — no DOM coupling beyond theme toggle button.
 */
(function () {
  'use strict';

  const STORAGE_KEY = 'theme';
  const DARK_CLASS = 'dark-theme';

  function getSystemPreference() {
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }

  function getSavedTheme() {
    return localStorage.getItem(STORAGE_KEY);
  }

  function applyTheme(theme) {
    const isDark = theme === 'dark';
    document.documentElement.classList.add('theme-transition');
    document.documentElement.classList.toggle(DARK_CLASS, isDark);
    document.documentElement.setAttribute('data-theme', theme);
    updateToggleState(isDark);
    window.setTimeout(() => {
      document.documentElement.classList.remove('theme-transition');
    }, 350);
  }

  function updateToggleState(isDark) {
    const toggle = document.getElementById('theme-toggle');
    if (!toggle) return;
    toggle.setAttribute('aria-pressed', String(isDark));
    toggle.setAttribute('aria-label', isDark ? 'Switch to light theme' : 'Switch to dark theme');
  }

  function resolveTheme() {
    const saved = getSavedTheme();
    if (saved === 'dark' || saved === 'light') return saved;
    return getSystemPreference();
  }

  function initTheme() {
    applyTheme(resolveTheme());

    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
      if (!getSavedTheme()) {
        applyTheme(e.matches ? 'dark' : 'light');
      }
    });
  }

  function initThemeToggle() {
    const toggle = document.getElementById('theme-toggle');
    if (!toggle) return;

    updateToggleState(document.documentElement.classList.contains(DARK_CLASS));

    toggle.addEventListener('click', () => {
      const isDark = !document.documentElement.classList.contains(DARK_CLASS);
      const theme = isDark ? 'dark' : 'light';
      localStorage.setItem(STORAGE_KEY, theme);
      applyTheme(theme);
    });
  }

  window.HungrifyTheme = { initTheme, initThemeToggle, applyTheme };
})();
