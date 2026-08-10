---
icon: fa-solid fa-graduation-cap
order: 1
permalink: /publications/
title: Publications
---

<link rel="stylesheet" href="{{ '/assets/css/publications.css' | relative_url }}">

<script src="{{ '/assets/js/publications.js' | relative_url }}"></script>

<div class="publication-item">
    <div class="publication-title">
        Deterministic list decoding of Reed-Solomon codes
        <div class="publication-buttons">
          <div class="abstract-box" onclick="openModal(this)">Abstract</div>
          <div class="pdf-box" onclick="window.open('/assets/deterministicGS.pdf', '_blank')">PDF</div>
          <div class="pdf-box" onclick="window.open('https://eccc.weizmann.ac.il/report/2025/170/', '_blank')">ECCC</div>
          <div class="pdf-box" onclick="window.open('https://arxiv.org/abs/2511.05176', '_blank')">Arxiv</div>
        </div>
    </div>
    <div class="publication-authors"><span class="separator">▶</span>Joint work with <a href="https://www.tifr.res.in/~prahladh/">Prahladh Harsha</a> (TIFR) and <a href="https://mrinalkr.bitbucket.io">Mrinal Kumar</a> (TIFR)</div>
    <div class="publication-details"><span class="separator">▶</span><a href="https://dl.acm.org/doi/10.1145/3798129.3800908" target="_blank">STOC 2026</a></div>
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

<h1>Dissertation</h1>
<div class="publication-item">
    <div class="publication-title">
        <div>Exponential Sums and Weil Bounds<div class="publication-subtitle">A Survey of Elementary Methods and Decoding Applications</div></div>
        <div class="publication-buttons">
          <div class="abstract-box" onclick="openModal(this)">Abstract</div>
          <div class="pdf-box" onclick="window.open('/assets/msc-project.pdf', '_blank')">PDF</div>
          <div class="pdf-box" onclick="window.open('https://github.com/sohamch08/msc-project-tifr', '_blank')">Repo</div>
        </div>
    </div>
    <div class="publication-authors"><span class="separator">▶</span>MSc Project Report under <a href="https://mrinalkr.bitbucket.io">Mrinal Kumar</a> (TIFR)</div>
    <div class="publication-details"><span class="separator">▶</span>May, 2026</div>
    <div class="abstract" style="display:none;"> <p>
    This talk is a survey on techniques for estimating the number of solutions to polynomial equations over a finite field $\mathbb{F}_q$. We use exponential sums-constructed from additive and multiplicative character-to establish these counts. By analyzing the algebraic and orthogonality properties of Gaussian and Jacobi sums, we build a mathematical framework to derive bounds for equations over $\mathbb{F}_q$ and its extensions.</p>
    <p>A central part of the survey is the study of Dirichlet $L$-functions over the polynomial ring $\mathbb{F}_q[X]$. We demonstrate how these $L$-functions can be used with characters on the set of monic rational functions to get bounds on the absolute value of character sums on polynomials. We discuss the Weil bounds for absolutely irreducible bivariate polynomials, focusing on two primary special cases:</p>
    <ul><li>Superelliptic curves: $Y^d = f(X)$ analyzed via Stepanov’s method.</li>
    <li>Artin-Schreier curves: $Y^q - Y = f(X)$ analyzed via Bombieri’s method. </li></ul>
    <p>These elementary polynomial methods are emphasized because they achieve the same results as advanced algebraic geometry without requiring its full abstract machinery.</p>
<p>The final part of the talk details an algorithmic application of these bounds: decoding codes constructed on evaluating polynomial composed with multiplicative character on whole field and dual BCH codes from a constant fraction of errors. This problem is challenging because character evaluations (like the quadratic character $\eta$) discard most information about a polynomial, leading to underdetermined systems where traditional decoding fails. To address this, we introduce pseudopolynomials which are of high-degree polynomials whose Hasse derivatives agree with low-degree polynomials when evaluated on $\mathbb{F}_q$. By merging the Berlekamp–Welch like arguments for Reed-Solomon with the interpolation techniques from Stepanov’s method, to decode from $\frac18$th of the minimum distance of the codes. 
    </p>
  </div>
</div>
