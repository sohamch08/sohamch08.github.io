---

layout: default
icon: fa-solid fa-book
order: 1
permalink: /publications/
title: Publications

---

<style>
  /* --- Publication List Styling --- */
  /* Publication container */
.publication-item {
  margin-bottom: 1.8rem;
  background-color: var(--card-bg, #1e1e1e);
  padding: 1.2rem 1.5rem;
  border-left: 3px solid var(--heading-color, #2a7ae2);
  border-radius: 8px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.25s ease, transform 0.25s ease;
}

/* .publication-item:hover {
  box-shadow: 0 6px 22px rgba(0, 0, 0, 0.2);
  transform: translateY(-2px);
} */

/* Title line */
.publication-title {
  font-size: 1.05rem;
  color: var(--text-color, #e6e6e6);
  margin-bottom: 0.4rem;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 0.6rem;
  font-weight: 500;
  line-height: 1.4;
}
.publication-title:hover .separator {
  color: #5598f0;   /* lighter blue on hover */
  opacity: 1;
}

/* Author and publication info */
.publication-authors,
.publication-details {
  font-size: 0.94rem;
  color: var(--text-muted, #9a9a9a);
  margin-top: 0.4rem;
  line-height: 1.5;
}

/* Abstract and PDF buttons */
.abstract-box,
.pdf-box {
  cursor: pointer;
  background-color: transparent;
  border: 1px solid var(--heading-color, #2a7ae2);
  color: var(--heading-color, #2a7ae2);
  padding: 2px 10px;
  border-radius: 6px;
  font-size: 0.85rem;
  font-weight: 500;
  transition: background-color 0.2s ease, color 0.2s ease;
}

.abstract-box:hover,
.pdf-box:hover {
  background-color: var(--heading-color, #2a7ae2);
  color: #fff;
}

/* Author links */
.publication-authors a,
.publication-details a {
  color: var(--link-color, #2a7ae2);
  text-decoration: none;
  transition: color 0.2s ease;
}

.publication-authors a:hover,
.publication-details a:hover {
  color: var(--link-hover, #5598f0);
  text-decoration: underline;
}

/* Optional separator bullet */
/* .bullet {
  margin-right: 10px;
  display: inline-block;
  width: 5px;
  height: 5px;
  background-color: var(--heading-color, #2a7ae2);
  border-radius: 50%;
  margin-left: 10px;
} */
.separator {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  margin: 0 0.6rem;
  color: #2a7ae2;              /* Chirpy blue accent */
  font-size: 1rem;             /* slightly bigger */
  line-height: 1;              /* keeps it centered with text */
  vertical-align: middle;      /* aligns with Abstract/PDF buttons */
  opacity: 0.85;
  transform: translateY(-2.5px);  /* optical centering tweak */
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
    background-color: var(--content-bg, #1e1e1e);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 10px;
    box-shadow: 0 8px 28px rgba(0, 0, 0, 0.3);
    color: var(--text-color, #e0e0e0);
    padding: 2rem 2.2rem;
    width: 70%;
    max-width: 1000px;
    max-height: 80vh;
    overflow-y: auto;
    line-height: 1.7;
    font-family: "Inter", "Helvetica Neue", Helvetica, Arial, sans-serif;
    animation: popUp 0.25s ease-out;
    transition: all 0.2s ease-in-out;
    scrollbar-width: none;
    -ms-overflow-style: none;
}
.modal-content::-webkit-scrollbar {
    display: none;
}

/* Title header */
.modal-content h3 {
    margin-top: 0;
    margin-bottom: 0.6rem;
    color: var(--heading-color, #2a7ae2);
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
    color: var(--text-muted, #a0a0a0);
    cursor: pointer;
    transition: color 0.2s ease, transform 0.2s ease;
    z-index: 10;
}

.close:hover {
    color: var(--heading-color, #2a7ae2);
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
      const abstractText = element.parentElement.parentElement.querySelector('.abstract').innerHTML;
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
                <div class="abstract-box" onclick="openModal(this)">Abstract</div>
                <div class="pdf-box" onclick="window.open('https://eccc.weizmann.ac.il/report/2025/170/', '_blank')">ECCC</div>
                <div class="pdf-box" onclick="window.open('https://arxiv.org/abs/2511.05176', '_blank')">Arxiv</div>
            </div>
            <div class="publication-authors"><span class="separator">▸</span>Joint work with <a href="https://www.tifr.res.in/~prahladh/">Prahladh Harsha</a> (TIFR) and <a href="https://mrinalkr.bitbucket.io">Mrinal Kumar</a> (TIFR)</div>
            <div class="publication-details"><span class="separator">▸</span>Submitted</div>
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
