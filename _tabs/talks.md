---
icon: fa-solid fa-microphone
order: 3
permalink: /projects-talks/
title: Talks
---

<style>
    body {
        background-color: #1a1c1e;
        color: #f5f5f5;
        line-height: 1.5;
        font-size: 1rem;
        margin: 0;
        padding: 2rem;
    }
    h1,h2,h3,h4,h5,h6 {
        color: #7fffd4;
        margin-bottom: 1rem;
    }
    h3,
    h4 {
        color: #5fe0c8;
    }
    a {
        transition: color 0.2s ease, text-shadow 0.2s ease;
    }
    .talks-header {
        font-size: 36px;
        font-weight: bold;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        margin-bottom: 10px;
    }
    .talk-item {
        display: flex;
        flex-direction: column;
        padding: 8px 0;
        gap: 3px;
    }
    .talk-header {
        display: flex;
        flex-direction: row;
        align-items: baseline;
        justify-content: space-between;
        gap: 12px;
    }
    .talk-title {
        font-size: 15.5px;
        font-weight: 600;
        color: #e8e8e8;
    }
    .talk-description {
        font-size: 13px;
        color: #aaa;
    }
    .talk-item:not(:last-child) {
        border-bottom: 1px solid #2e3035;
    }
    .talk-slides {
        display: flex;
        flex-direction: row;
        align-items: center;
        gap: 5px;
        flex-shrink: 0;
    }
    .pdf-box {
        cursor: pointer;
        display: inline-block;
        background-color: transparent;
        border: 1px solid #7fffd4;
        color: #7fffd4;
        padding: 1px 8px;
        border-radius: 6px;
        font-size: 0.75rem;
        font-weight: 500;
        transition: background-color 0.2s ease, color 0.2s ease, box-shadow 0.2s ease;
    }
    .pdf-box:hover {
        background-color: #7fffd4;
        color: #1a1c1e;
        box-shadow: 0 0 8px #9affd8;
    }
    .year-header {
        font-size: 22px;
        font-weight: 700;
        color: #7fffd4;
        margin-top: 1.5rem;
        margin-bottom: 0.5rem;
        border-bottom: 1px solid #2e3035;
        padding-bottom: 4px;
    }
    .talk-venue-row {
        display: flex;
        flex-direction: row;
        align-items: baseline;
        justify-content: space-between;
        gap: 12px;
        padding: 4px 0;
    }
    .talk-venue-row:not(:last-child) {
        border-bottom: 1px solid #252729;
    }
</style>

<div class="year-header">2026</div>

<div class="talk-item">
    <div class="talk-title">Deterministic List Decoding of Reed-Solomon Codes</div>
    <div class="talk-venue-row">
        <div class="talk-description">STOC 2026 Presentation</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1EkBCHeP-DFx-sC5gC-MUXfVywSXKPvG-/view?usp=drive_link" | relative_url }}', '_blank')">Poster</div>
        </div>
    </div>
    <div class="talk-venue-row">
        <div class="talk-description">Poster Presentation, WACT 2026</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1bP2GB9GkezbLkNIz7OtbH-sCfnBatKtB/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1KLQdePnyux_2rHgHXIfJq6rSpv-XWgP4/view?usp=drive_link" | relative_url }}', '_blank')">Poster</div>
        </div>
    </div>
    <div class="talk-venue-row">
        <div class="talk-description">TIFR, Student Seminar</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1xEjxUbyhwAv7Qr16BCDx-O-cW_8lZBh5/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
            <div class="pdf-box" onclick="window.open('https://www.tcs.tifr.res.in/~student_seminar/talks/2026-05-15/', '_blank')">Link</div>
        </div>
    </div>
    <div class="talk-venue-row">
        <div class="talk-description">ACMU Seminar, ISI</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/11qDmIEy4jzwuBVWwSGqV8DTthF_Vdi_O/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
        </div>
    </div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Weil Bounds: A Survey of Decoding Applications</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1qfq7NNjN_Tx4WbGXYtOWmVikCGTMKtyC/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
            <div class="pdf-box" onclick="window.open('https://github.com/sohamch08/msc-project-tifr', '_blank')">Thesis</div>
        </div>
    </div>
    <div class="talk-description">TIFR, MSc. Project Seminar</div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">GM-MDS Conjecture: MDS matrices over small fields</div>
    </div>
    <div class="talk-description">TIFR Student Seminar</div>
</div>

<div class="year-header">2025</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">$\mathsf{BPL}\subseteq\mathsf{SC}$: Nisan's Pseudorandom Generator for $\mathsf{BPL}$</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1C88HBSjewJBBWkOqqQqAABne5jkZvWLq/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
        </div>
    </div>
    <div class="talk-description">Course-Work presentation (TIFR): Pseudorandomness. Paper by Noam Nisan, 1992</div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Subspace Polynomials and List Decoding of Reed Solomon Codes</div>
    </div>
    <div class="talk-description">
        Course-Work presentation (TIFR): Topics in Coding Theory.
        Paper by Eli Ben-Sasson, Swastik Kopparty & Jaikumar Radhakrishnan, 2006.
    </div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Universal Optimality of Dijkstra using Fibonacci Priority Queue with Working Set Property</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/13-yOlT-mHOMDWSDsZlPY92Fz2SzCV4zJ/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
        </div>
    </div>
    <div class="talk-description">Oral Qualifier Presentation. Paper by Haeupler, Hladík, Rozhoň, Tarjan, Tětek, 2024. FOCS Best Paper.</div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">$n^{1.62}$ Upper Bound on Hurwitz Problem</div>
    </div>
    <div class="talk-description">TIFR Student Seminar. Paper by Hrubesh, 2024</div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Super Polynomial Lower Bound on Traveling Salesman Polytope</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1q8L-SuT5rTfjURVE0PDDEjKm2Cpv7PF8/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
        </div>
    </div>
    <div class="talk-description">
        Course-work presentation (TIFR): Combinatorial Optimization.
        Paper by Fiorini, Massar, Pokutta, Tiwary and Wolf, 2012
    </div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Bounds on Price of Anarchy using Linear and Quadratic Programming</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1ZZXaHdMWj2_RrwkxBavZBTCPWGKX2kjS/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
        </div>
    </div>
    <div class="talk-description">
        Course-work presentation (TIFR): Algorithmic Game Theory.
        Paper by Kulkarni and Mirrokni, 2015
    </div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Bipartite Matching is in Quasi-NC</div>
    </div>
    <div class="talk-description">
        TIFR Student Seminar, 2025. Paper by Stephen A. Fenner,
        Rohit Gurjar and Thomas Thierauf, 2016.
    </div>
</div>

<div class="year-header">2024</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Hensel and Newton Methods in Valuation Rings</div>
    </div>
    <div class="talk-description">
        Course-work presentation (CMI): Algebra and Computation.
        Paper by J von zur Gathen, 1984.
    </div>
</div>

<div class="year-header">2023</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">Algebraic Geometric Codes</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/1hDhXFZpRLU8DVMv84d_N-5K6_Z6jMDTK/view?usp=drive_link" | relative_url }}', '_blank')">Report</div>
        </div>
    </div>
    <div class="talk-description">
        Course-work presentation (CMI): Algorithmic Coding Theory II.
        Jointly given by Me and Shree Ganesh S J
    </div>
</div>

<div class="talk-item">
    <div class="talk-header">
        <div class="talk-title">"Iterated Mod Problem" by Karloff and Ruzzo</div>
        <div class="talk-slides">
            <div class="pdf-box" onclick="window.open('{{ "https://drive.google.com/file/d/16zACu-KVsTJubbypDU-vdkHjyBgEWKhC/view?usp=drive_link" | relative_url }}', '_blank')">Slides</div>
        </div>
    </div>
    <div class="talk-description">
        Course-work presentation (CMI): Parallel Algorithms and Complexity
    </div>
</div>
