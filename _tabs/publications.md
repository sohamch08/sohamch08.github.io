---
icon: fa-solid fa-graduation-cap
order: 1
permalink: /publications/
title: Publications
---

<style>
  body {
    background-color: #1a1c1e;
    /* dark terminal background */
    color: #f5f5f5;
    /* base whitish text */
    /* font-family: monospace;      terminal font */
    line-height: 1.5;
    font-size: 1rem;
    margin: 0;
    padding: 2rem;
  }

  /* Headings */
  h1,h2,h3,h4,h5,h6 {
    color: #7fffd4;
    margin-bottom: 1rem;
  }
  h3,h4 {
    color: #5fe0c8;
  }
  /* Links */
  a {
    transition: color 0.2s ease, text-shadow 0.2s ease;
  }

/* --- Publication Items --- */
  .publication-item {
    margin-bottom: 1.8rem;
    background-color: #1a1c1e;  /* dark terminal background */
    padding: 1.2rem 1.5rem;
    border-left: 3px solid #7fffd4;  /* cyan accent */
    border-radius: 10px;
    box-shadow: 0 4px 16px rgba(127, 255, 212, 0.25); /* soft cyan glow */
    transition: box-shadow 0.25s ease, transform 0.25s ease;
  }

  .publication-item:hover {
    box-shadow: 0 6px 22px rgba(127, 255, 212, 0.35);
    transform: translateY(-2px);
  }

  /* Title line */
  .publication-title {
    font-size: 1.05rem;
    color: #f5f5f5;  /* whitish text */
    margin-bottom: 0.4rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 0.6rem;
    font-weight: 500;
    line-height: 1.4;
  }

  .publication-buttons {
      display: flex;
      gap: 0.5rem; /* space between buttons */
  }
  .publication-title:hover .separator {
    color: #9affd8;  /* neon cyan on hover */
    opacity: 1;
  }

  /* Author and publication info */
  .publication-authors,
  .publication-details {
    font-size: 0.94rem;
    color: #bfbfbf;  /* soft gray for muted text */
    margin-top: 0.4rem;
    line-height: 1.5;
  }

  /* Abstract and PDF buttons */
  .abstract-box,
  .pdf-box {
    cursor: pointer;
    background-color: transparent;
    border: 1px solid #7fffd4;
    color: #7fffd4;
    padding: 2px 10px;
    border-radius: 6px;
    font-size: 0.85rem;
    font-weight: 500;
    transition: background-color 0.2s ease, color 0.2s ease, box-shadow 0.2s ease;
  }

  .abstract-box:hover,
  .pdf-box:hover {
    background-color: #7fffd4;
    color: #1a1c1e;  /* dark text on bright button */
    box-shadow: 0 0 8px #9affd8;
  }

  /* Author links */
  .publication-authors a,
  .publication-details a {
    color: #4fe8c1;
    text-decoration: none;
    transition: color 0.2s ease, text-shadow 0.2s ease;
  }

  .publication-authors a:hover,
  .publication-details a:hover {
    color: #9affd8;
    text-decoration: underline;
    text-shadow: 0 0 4px #9affd855;
  }

  /* Separator */
  .separator {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    margin: 0 0.6rem;
    color: #7fffd4;
    font-size: 0.85rem;
    line-height: 1;
    vertical-align: middle;
    opacity: 0.85;
    transform: translateY(-1px);
    transition: color 0.2s ease, opacity 0.2s ease;
  }

/* --- Modal Styling --- */
  .modal {
    display: none;
    position: fixed;
    z-index: 1000;
    inset: 0;
    background-color: rgba(20, 20, 20, 0.45); /* subtle dim */
    backdrop-filter: blur(6px);
    justify-content: center;
    align-items: center;
    animation: fadeIn 0.25s ease-in-out;
  }

/* Elegant modal content */
  .modal-content {
    position: relative;
    background-color: #1a1c1e;
    border: 1px solid rgba(127, 255, 212, 0.2);
    border-radius: 10px;
    box-shadow: 0 8px 28px rgba(127, 255, 212, 0.3);
    color: #f5f5f5;
    padding: 2rem 2.2rem;
    width: 70%;
    max-width: 1000px;
    max-height: 80vh;
    overflow-y: auto;
    line-height: 1.7;
    /* font-family: monospace; */
    font-size: 1rem;
    animation: popUp 0.25s ease-out;
    transition: all 0.2s ease-in-out;
    scrollbar-width: none;
    -ms-overflow-style: none;
  }

.modal-content::-webkit-scrollbar {
  display: none;
}

/* Modal title */
  .modal-content h3 {
    margin-top: 0;
    margin-bottom: 0.6rem;
    color: #7fffd4;
    border-bottom: 1px solid rgba(255, 255, 255, 0.15);
    padding-bottom: 0.4rem;
    font-size: 1.25rem;
    font-weight: 600;
    text-align: left;
    letter-spacing: 0.3px;
  }

  /* Close button */
  .close {
    position: absolute;
    top: 1rem;
    right: 1.2rem;
    font-size: 1.4rem;
    font-weight: bold;
    color: #bfbfbf;
    cursor: pointer;
    transition: color 0.2s ease, transform 0.2s ease;
    z-index: 10;
  }

  .close:hover {
    color: #7fffd4;
    transform: scale(1.15);
  }

  /* Animations */
  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }

  @keyframes popUp {
    from { transform: scale(0.96); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
  }


</style>

<script>
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
</script>

<div class="publication-item">
    <div class="publication-title">
        Deterministic list decoding of Reed-Solomon codes
        <div class="publication-buttons">
          <div class="abstract-box" onclick="openModal(this)">Abstract</div>
          <div class="pdf-box" onclick="window.open('https://eccc.weizmann.ac.il/report/2025/170/', '_blank')">ECCC</div>
          <div class="pdf-box" onclick="window.open('https://arxiv.org/abs/2511.05176', '_blank')">Arxiv</div>
        </div>
    </div>
    <div class="publication-authors"><span class="separator">▶</span>Joint work with <a href="https://www.tifr.res.in/~prahladh/">Prahladh Harsha</a> (TIFR) and <a href="https://mrinalkr.bitbucket.io">Mrinal Kumar</a> (TIFR)</div>
    <div class="publication-details"><span class="separator">▶</span>Submitted</div>
    <div class="abstract" style="display:none;"> <p>
    We show that Reed-Solomon codes of dimension $k$ and block length $n$  over any finite field $\mathbb{F}$ can be <i>deterministically</i> list decoded from agreement $\sqrt{(k-1)n}$ in time $\text{poly}(n, \log |\mathbb{F}|)$.
    </p> 
    <p>
    Prior to this work, the list decoding algorithms for Reed-Solomon codes, from the celebrated results of Sudan and Guruswami-Sudan, were either randomized with time complexity $\text{poly}(n, \log |\mathbb{F}|)$ or were deterministic with time complexity depending polynomially on the characteristic of the underlying field. In particular, over a prime field $\mathbb{F}$, no deterministic algorithms running in time $\text{poly}(n, \log |\mathbb{F}|)$ were known for this problem.
    </p>
    <p>
    Our main technical ingredient is a deterministic algorithm for solving the bivariate polynomial factorization instances that appear in the algorithm of Sudan and  Guruswami-Sudan with only a $\text{poly}(\log |\mathbb{F}|)$ dependence on the field size in its time complexity for every finite field $\mathbb{F}$. While the question of obtaining efficient deterministic algorithms for polynomial factorization over finite fields is a fundamental open problem even for <i>univariate</i> polynomials of degree $2$, we show that additional information from the received word can be used to obtain such an algorithm for instances that appear in the course of list decoding Reed-Solomon codes.
    </p>
  </div>
</div>
