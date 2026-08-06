/**
 * Navigation: mobile menu, active link highlighting, scroll spy.
 */
(function () {
  'use strict';

  function initMobileMenu() {
    const hamburger = document.querySelector('.hamburger');
    const navMenu = document.getElementById('nav-menu');
    const navActions = document.querySelector('.nav-actions');
    if (!hamburger || !navMenu) return;

    function setMenuOpen(open) {
      hamburger.classList.toggle('active', open);
      navMenu.classList.toggle('active', open);
      if (navActions) navActions.classList.toggle('mobile-visible', open);
      hamburger.setAttribute('aria-expanded', String(open));
      document.body.classList.toggle('nav-open', open);
    }

    hamburger.addEventListener('click', () => {
      setMenuOpen(!navMenu.classList.contains('active'));
    });

    navMenu.querySelectorAll('.nav-link').forEach((link) => {
      link.addEventListener('click', () => setMenuOpen(false));
    });

    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && navMenu.classList.contains('active')) {
        setMenuOpen(false);
        hamburger.focus();
      }
    });
  }

  function initScrollSpy() {
    const sections = document.querySelectorAll('main section[id], footer[id]');
    const navLinks = document.querySelectorAll('.nav-link[href^="#"]');
    if (!sections.length || !navLinks.length) return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) return;
          const id = entry.target.getAttribute('id');
          navLinks.forEach((link) => {
            const href = link.getAttribute('href');
            link.classList.toggle('active', href === `#${id}`);
          });
        });
      },
      { rootMargin: '-40% 0px -55% 0px', threshold: 0 }
    );

    sections.forEach((section) => observer.observe(section));
  }

  function initBackToTop() {
    const btn = document.querySelector('.back-to-top');
    if (!btn) return;

    const toggleVisibility = () => {
      btn.classList.toggle('visible', window.scrollY > 400);
    };

    window.addEventListener('scroll', toggleVisibility, { passive: true });
    toggleVisibility();
  }
  
  function initUserDropdown() {

      const userBtn = document.getElementById("userMenuBtn");
      const dropdown = document.getElementById("dropdownMenu");

      if (!userBtn || !dropdown) return;

      userBtn.addEventListener("click", function (e) {

          e.stopPropagation();

          dropdown.classList.toggle("show");

          this.classList.toggle("active");

      });

      document.addEventListener("click", function () {

          dropdown.classList.remove("show");

          userBtn.classList.remove("active");

      });

  }

  window.HungrifyNav = {
      initMobileMenu,
      initScrollSpy,
      initBackToTop,
      initUserDropdown
  };
})();
