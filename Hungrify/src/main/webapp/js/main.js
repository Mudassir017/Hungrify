/**
 * Hungrify — main application entry point.
 */
(function () {
  'use strict';

  document.addEventListener('DOMContentLoaded', () => {
    window.HungrifyTheme.initThemeToggle();
    window.HungrifyNav.initMobileMenu();
    window.HungrifyNav.initScrollSpy();
    window.HungrifyNav.initBackToTop();
	window.HungrifyNav.initUserDropdown();
    window.HungrifyFeatured.initFeaturedRecommendation();
    window.HungrifyUI.initFavorites();
    window.HungrifyUI.initSearchForm();
    window.HungrifyUI.initNewsletterForm();
    window.HungrifyUI.initAddToCart();
  });
})();
