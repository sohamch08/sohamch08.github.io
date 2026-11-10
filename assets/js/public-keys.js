(() => {
  const resetTimers = new WeakMap();

  // Keep the text in the page so clipboard writes happen directly on the click,
  // including in browsers that require transient user activation.
  function selectKey(field) {
    field.closest('details').open = true;
    field.focus({ preventScroll: true });
    field.select();
    field.setSelectionRange(0, field.value.length);
  }

  function legacyCopy(field, button) {
    const details = field.closest('details');
    const wasOpen = details.open;
    let copied = false;

    try {
      selectKey(field);
      copied = document.execCommand('copy');
    } catch {
      copied = false;
    }

    if (copied) {
      details.open = wasOpen;
      button.focus({ preventScroll: true });
    }

    return copied;
  }

  document.querySelectorAll('[data-public-key]').forEach((card) => {
    const button = card.querySelector('.public-key-copy');
    const field = card.querySelector('.public-key-text');
    const label = card.querySelector('[data-copy-label]');
    const status = card.querySelector('.public-key-status');
    button.hidden = false;

    // Clicking the card or its Copy button copies the complete public key.
    card.querySelector('.public-key-identity').addEventListener('click', (event) => {
      if (!event.target.closest('.public-key-copy')) {
        button.click();
      }
    });

    button.addEventListener('click', async () => {
      clearTimeout(resetTimers.get(card));
      card.classList.remove('is-copied', 'is-error');
      status.textContent = '';
      let copied = false;

      if (window.isSecureContext && navigator.clipboard?.writeText) {
        try {
          await navigator.clipboard.writeText(field.value);
          copied = true;
        } catch {
          copied = legacyCopy(field, button);
        }
      } else {
        copied = legacyCopy(field, button);
      }

      if (copied) {
        card.classList.add('is-copied');
        label.textContent = 'Copied!';
        status.textContent = 'Public key copied to clipboard.';
        resetTimers.set(card, setTimeout(() => {
          card.classList.remove('is-copied');
          label.textContent = 'Copy';
          status.textContent = '';
        }, 3000));
      } else {
        selectKey(field);
        card.classList.add('is-error');
        label.textContent = 'Try again';
        status.textContent = 'Automatic copying is blocked. The key is selected below. Use your device’s Copy command, or download the file.';
      }
    });
  });
})();
