/**
 * UI interactions: favorites, forms, add-to-cart feedback.
 */
(function () {
  'use strict';

  function initFavorites() {
    document.querySelectorAll('.favorite-btn').forEach((btn) => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        const active = btn.classList.toggle('active');
        btn.textContent = active ? '♥' : '♡';
        btn.setAttribute('aria-label', active ? 'Remove from favorites' : 'Add to favorites');
        btn.setAttribute('aria-pressed', String(active));
      });
    });
  }

  function initSearchForm() {
    const form = document.getElementById('search-form');
    if (!form) return;

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const input = document.getElementById('search-input');
      const query = input?.value.trim();
      if (query) {
        window.location.hash = 'restaurants';
        input.blur();
      }
    });
  }

  function initNewsletterForm() {
    const form = document.getElementById('newsletter-form');
    if (!form) return;

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const input = document.getElementById('newsletter-email');
      const email = input?.value.trim();
      if (!email) return;

      const btn = form.querySelector('button[type="submit"]');
      if (btn) {
        const original = btn.textContent;
        btn.textContent = 'Subscribed!';
        btn.disabled = true;
        setTimeout(() => {
          btn.textContent = original;
          btn.disabled = false;
          form.reset();
        }, 2500);
      }
    });
  }

  function initAddToCart() {
    document.querySelectorAll('.add-to-cart').forEach((btn) => {
      btn.addEventListener('click', () => {
        const original = btn.textContent;
        btn.textContent = 'Added!';
        btn.classList.add('added');
        btn.disabled = true;
        setTimeout(() => {
          btn.textContent = original;
          btn.classList.remove('added');
          btn.disabled = false;
        }, 1500);
      });
    });
  }

  window.HungrifyUI = {
    initFavorites,
    initSearchForm,
    initNewsletterForm,
    initAddToCart
  };
})();
