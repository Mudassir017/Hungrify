/**
 * Data service — fetches dynamic content from backend API with local JSON fallback.
 * Priority: inline JSP JSON → Servlet API → static JSON file.
 */
(function () {
  'use strict';

  const FEATURED_API = '/api/featured-recommendation';
  const FEATURED_FALLBACK = 'data/featured-recommendation.json';
  const INLINE_DATA_ID = 'featured-recommendation-data';

  function getInlineData() {
    const el = document.getElementById(INLINE_DATA_ID);
    if (!el || !el.textContent.trim()) return null;
    try {
      return JSON.parse(el.textContent);
    } catch {
      return null;
    }
  }

  async function fetchJSON(url) {
    const response = await fetch(url);
    if (!response.ok) throw new Error(`HTTP ${response.status}`);
    return response.json();
  }

  async function getFeaturedRecommendation() {
    const inline = getInlineData();
    if (inline) return inline;

    try {
      return await fetchJSON(FEATURED_API);
    } catch {
      return fetchJSON(FEATURED_FALLBACK);
    }
  }

  window.HungrifyData = { getFeaturedRecommendation };
})();
