function openModal(element) {
    const abstractText = element.parentElement.parentElement.parentElement.querySelector('.abstract').innerHTML;
    const modal = document.createElement('div');
    modal.className = 'modal';
    modal.innerHTML = `
        <div class="modal-content">
            <span class="close" onclick="this.closest('.modal').remove()">&times;</span>
            <h3 style="margin-top:0;color:#7fffd4;">Abstract</h3>
            <p>${abstractText}</p>
        </div>
    `;
    document.body.appendChild(modal);
    modal.style.display = 'flex';
    window.onclick = function(event) {
        if (event.target === modal) modal.remove();
    };
}
