function openModal(element) {
    const content = element.closest('.publication-item').querySelector('.abstract').cloneNode(true);
    content.removeAttribute('style');
    window.SiteModal.open({ title: 'Abstract', content, trigger: element });
}
