/**
 * Reference: https://bootsnipp.com/snippets/featured/link-to-top-page
 */

export function back2top() {
  const btn = document.getElementById('back-to-top');

  if (!btn) {
    return;
  }

  const updateVisibility = () => {
    btn.classList.toggle('show', window.scrollY > 0);
  };

  updateVisibility();
  window.addEventListener('scroll', updateVisibility, { passive: true });

  btn.addEventListener('click', () => {
    const behavior = window.matchMedia('(prefers-reduced-motion: reduce)').matches
      ? 'auto'
      : 'smooth';

    window.scrollTo({ top: 0, behavior });
  });
}
