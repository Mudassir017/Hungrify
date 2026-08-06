/**
 * Renders the hero featured recommendation card from backend data.
 */
(function () {
  'use strict';

  const SELECTORS = {
    card: '#hero-recommendation',
    title: '#rec-title-label',
    availability: '#rec-availability',
    dishImage: '#rec-dish-image',
    cuisine: '#rec-cuisine',
    dishName: '#rec-dish-name',
    restaurant: '#rec-restaurant-name',
    description: '#rec-dish-desc',
    rating: '#rec-rating-value',
    delivery: '#rec-delivery-time',
    price: '#rec-dish-price',
    cta: '#rec-cta'
  };

  function formatPrice(price, currency) {
    if (price == null) return '';
    try {
      return new Intl.NumberFormat(undefined, {
        style: 'currency',
        currency: currency || 'INR'
      }).format(price);
    } catch {
      return `$${Number(price).toFixed(2)}`;
    }
  }

  function formatDeliveryTime(minutes) {
    if (minutes == null) return '';
    return `${minutes} min`;
  }

  function setAvailability(el, status, label) {
    if (!el) return;
    const isAvailable = status === 'available' || status === 'open';
    el.textContent = label || (isAvailable ? 'Available' : 'Unavailable');
    el.classList.toggle('open', isAvailable);
    el.classList.toggle('closed', !isAvailable);
  }

  function render(data) {
    const card = document.querySelector(SELECTORS.card);
    if (!card || !data) return;

    const titleEl = document.querySelector(SELECTORS.title);
    const availEl = document.querySelector(SELECTORS.availability);
    const imgEl = document.querySelector(SELECTORS.dishImage);
    const cuisineEl = document.querySelector(SELECTORS.cuisine);
    const nameEl = document.querySelector(SELECTORS.dishName);
    const restEl = document.querySelector(SELECTORS.restaurant);
    const descEl = document.querySelector(SELECTORS.description);
    const ratingEl = document.querySelector(SELECTORS.rating);
    const deliveryEl = document.querySelector(SELECTORS.delivery);
    const priceEl = document.querySelector(SELECTORS.price);
    const ctaEl = document.querySelector(SELECTORS.cta);

    if (titleEl) titleEl.textContent = data.recommendationTitle || '';
    setAvailability(availEl, data.availability, data.availabilityLabel);

    if (imgEl) {
      imgEl.src = data.dishImage || '';
      imgEl.alt = data.dishImageAlt || data.dishName || 'Featured dish';
    }

    if (cuisineEl) cuisineEl.textContent = data.cuisine || '';
    if (nameEl) nameEl.textContent = data.dishName || '';
    if (restEl) restEl.textContent = data.restaurantName ? `by ${data.restaurantName}` : '';
    if (ratingEl) ratingEl.textContent = data.rating != null ? Number(data.rating).toFixed(1) : '';
    if (deliveryEl) deliveryEl.textContent = formatDeliveryTime(data.deliveryTimeMinutes);
    if (priceEl) priceEl.textContent = formatPrice(data.price, data.currency);

    if (descEl) {
      if (data.description) {
        descEl.textContent = data.description;
        descEl.hidden = false;
      } else {
        descEl.textContent = '';
        descEl.hidden = true;
      }
    }

    if (ctaEl) {
      ctaEl.textContent = data.ctaLabel || 'Order Now';
      ctaEl.href = data.ctaUrl || '#restaurants';
      ctaEl.setAttribute('aria-label', `${data.ctaLabel || 'Order'} ${data.dishName || 'featured dish'}`);
    }

    card.setAttribute('aria-busy', 'false');
    card.classList.remove('is-loading');
    card.classList.add('is-loaded');
  }

  function showError() {
    const card = document.querySelector(SELECTORS.card);
    if (!card) return;
    card.setAttribute('aria-busy', 'false');
    card.classList.remove('is-loading');
    card.classList.add('is-error');
    card.innerHTML = '<p class="rec-error">Unable to load featured recommendation. Please try again later.</p>';
  }

  async function initFeaturedRecommendation() {
    const card = document.querySelector(SELECTORS.card);
    if (!card) return;

    try {
      const data = await window.HungrifyData.getFeaturedRecommendation();
      render(data);
    } catch {
      showError();
    }
  }

  window.HungrifyFeatured = { initFeaturedRecommendation, render };
})();
