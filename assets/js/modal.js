(() => {
  let activeDialog = null;

  function open({ title, content, trigger = document.activeElement, fitContent = false }) {
    if (activeDialog) {
      activeDialog.close();
      activeDialog.remove();
      activeDialog = null;
    }

    const dialog = document.createElement('dialog');
    dialog.className = 'site-modal';
    dialog.tabIndex = -1;
    if (fitContent) {
      dialog.classList.add('site-modal-fit-content');
    }
    dialog.setAttribute('aria-labelledby', 'site-modal-title');

    const panel = document.createElement('div');
    panel.className = 'modal-content';

    const closeButton = document.createElement('button');
    closeButton.type = 'button';
    closeButton.className = 'close';
    closeButton.setAttribute('aria-label', 'Close dialog');
    closeButton.textContent = '×';
    closeButton.addEventListener('click', () => dialog.close());

    const heading = document.createElement('h3');
    heading.id = 'site-modal-title';
    heading.textContent = title;

    panel.append(closeButton, heading, content);
    dialog.append(panel);
    document.body.append(dialog);

    dialog.addEventListener('click', (event) => {
      if (event.target === dialog) {
        const bounds = dialog.getBoundingClientRect();
        if (event.clientX < bounds.left || event.clientX > bounds.right ||
            event.clientY < bounds.top || event.clientY > bounds.bottom) {
          dialog.close();
        }
      }
    });

    dialog.addEventListener('keydown', (event) => {
      if (event.key !== 'Tab') {
        return;
      }

      const focusable = [...dialog.querySelectorAll('button, a[href], input, select, textarea, [tabindex]')]
        .filter((element) => !element.disabled && element.tabIndex >= 0 && element.getClientRects().length > 0);
      const first = focusable[0];
      const last = focusable[focusable.length - 1];

      if (document.activeElement === dialog) {
        event.preventDefault();
        (event.shiftKey ? last : first).focus();
      } else if (event.shiftKey && document.activeElement === first) {
        event.preventDefault();
        last.focus();
      } else if (!event.shiftKey && document.activeElement === last) {
        event.preventDefault();
        first.focus();
      }
    });

    dialog.addEventListener('close', () => {
      dialog.remove();
      if (activeDialog === dialog) {
        activeDialog = null;
        trigger?.focus({ preventScroll: true });
      }
    });

    activeDialog = dialog;
    dialog.showModal();
    dialog.focus({ preventScroll: true });
    return dialog;
  }

  window.SiteModal = { open };
})();
