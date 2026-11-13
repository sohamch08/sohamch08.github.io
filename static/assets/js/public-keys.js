(() => {
  const resetTimers = new WeakMap();

  // Keep the text in the page so clipboard writes happen directly on the click,
  // including in browsers that require transient user activation.
  function selectKey(field) {
    field.focus({ preventScroll: true });
    const range = document.createRange();
    range.selectNodeContents(field);
    const selection = window.getSelection();
    selection.removeAllRanges();
    selection.addRange(range);
  }

  function legacyCopy(field, button) {
    const copyField = document.createElement('textarea');
    copyField.value = field.value;
    copyField.readOnly = true;
    copyField.setAttribute('aria-hidden', 'true');
    copyField.style.cssText = 'position: fixed; top: 0; left: -9999px; font-size: 16px;';
    document.body.appendChild(copyField);
    let copied = false;

    try {
      copyField.focus({ preventScroll: true });
      copyField.select();
      copyField.setSelectionRange(0, copyField.value.length);
      copied = document.execCommand('copy');
    } catch {
      copied = false;
    } finally {
      copyField.remove();
      button.focus({ preventScroll: true });
    }

    return copied;
  }

  async function copyText(text, button) {
    if (window.isSecureContext && navigator.clipboard?.writeText) {
      try {
        await navigator.clipboard.writeText(text);
        return true;
      } catch {
        return legacyCopy({ value: text }, button);
      }
    }
    return legacyCopy({ value: text }, button);
  }

  function openKeyViewer(field, keyTitle, trigger, message = '') {
    const content = document.createElement('div');
    const visibleField = document.createElement('pre');
    visibleField.className = 'public-key-modal-text';
    visibleField.tabIndex = 0;
    visibleField.textContent = field.value.replace(/\r?\n$/, '');
    visibleField.setAttribute('aria-label', `${keyTitle} text`);

    if (message) {
      const notice = document.createElement('p');
      notice.textContent = message;
      content.append(notice);
    }

    content.append(visibleField);
    window.SiteModal.open({ title: keyTitle, content, trigger, fitContent: true });
    return visibleField;
  }

  document.querySelectorAll('[data-key-copy-target]').forEach((button) => {
    const field = document.getElementById(button.dataset.keyCopyTarget);
    const keyTitle = button.dataset.keyTitle;
    const icon = button.querySelector('i');
    const originalIcon = icon.className;
    const originalTitle = button.title;
    const status = document.getElementById('sidebar-key-status');
    button.hidden = false;

    button.addEventListener('click', async () => {
      clearTimeout(resetTimers.get(button));
      status.textContent = '';
      if (await copyText(field.value, button)) {
        icon.className = 'fa-solid fa-check';
        button.title = `${keyTitle} copied!`;
        status.textContent = `${keyTitle} copied to clipboard.`;
        resetTimers.set(button, setTimeout(() => {
          icon.className = originalIcon;
          button.title = originalTitle;
          status.textContent = '';
        }, 3000));
      } else {
        const message = 'Automatic copying is blocked. The key is selected below. Use your device’s Copy command, or download it from the Contact page.';
        selectKey(openKeyViewer(field, keyTitle, button, message));
        status.textContent = message;
      }
    });
  });

  document.querySelectorAll('[data-public-key]').forEach((card) => {
    const button = card.querySelector('.public-key-copy');
    const viewButton = card.querySelector('.public-key-view');
    const field = document.getElementById(viewButton.dataset.keyTarget);
    const keyTitle = card.querySelector('h3').textContent;
    const label = card.querySelector('[data-copy-label]');
    const status = card.querySelector('.public-key-status');
    button.hidden = false;
    viewButton.hidden = false;

    viewButton.addEventListener('click', () => {
      openKeyViewer(field, keyTitle, viewButton);
    });

    button.addEventListener('click', async () => {
      clearTimeout(resetTimers.get(card));
      card.classList.remove('is-copied', 'is-error');
      status.textContent = '';
      const copied = await copyText(field.value, button);

      if (copied) {
        card.classList.add('is-copied');
        label.textContent = 'Copied!';
        status.textContent = 'Public key copied to clipboard.';
        resetTimers.set(card, setTimeout(() => {
          card.classList.remove('is-copied');
          label.textContent = 'Copy key';
          status.textContent = '';
        }, 3000));
      } else {
        const message = 'Automatic copying is blocked. The key is selected below. Use your device’s Copy command, or download the file.';
        selectKey(openKeyViewer(field, keyTitle, button, message));
        card.classList.add('is-error');
        label.textContent = 'Try again';
        status.textContent = message;
      }
    });
  });

})();
