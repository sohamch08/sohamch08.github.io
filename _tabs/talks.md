---
layout: default
icon: fa-solid fa-book
order: 3
permalink: /projects-talks/
title: Talks and Internships
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
        /* cyan terminal heading */
        margin-bottom: 1rem;
    }

    /* Secondary headings (optional) */
    h3,
    h4 {
        color: #5fe0c8;
        /* slightly darker cyan */
    }

    /* Paragraphs */
    p {
        margin-bottom: 1rem;
    }

    /* Links */
    a {
        color: #4fe8c1;
        /* base link cyan */
        text-decoration: none;
        transition: color 0.2s ease, text-shadow 0.2s ease;
    }

    a:hover {
        color: #9affd8;
        /* neon hover */
        text-shadow: 0 0 5px #9affd855;
    }

    /* Lists */
    ul,
    ol {
        margin-left: 1.5rem;
        margin-bottom: 1rem;
    }
    .internship-container, .talks-container {
        max-width: 800px;
        margin: 20px auto;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    .internship-header, .talks-header {
        font-size: 36px;
        font-weight: bold;
        color: #ccc;
        margin-bottom: 10px;
    }

    .internship-item, .talk-item {
        margin-bottom: 15px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }

    .internship-time, .talk-title {
        font-size: 18px;
        color: #ccc;
        font-weight: bold;
    }

    .internship-description, .talk-description {
        font-size: 18px;
        color: #fff;
        margin-top: 10px;
        margin-left: 15px;
    }

    .internship-abstract {
        font-size: 18px;
        color: #fff;
        margin-top: 6px;
        margin-left: 25px;
        font-style: italic;
    }

    .internship-item:not(:last-child), .talk-item:not(:last-child) {
        border-bottom: 1px solid #ccc;
        padding-bottom: 15px;
    }

    .talk-slides {
        margin-top: 10px;
        margin-left: 15px;
        font-size: 18px;
        color: #ccc;
    }
</style>
 <div class="talks-container">
        <div class="talk-item">
            <div class="talk-title">Universal Optimality of Dijkstra using Fibonacci Priority Queue with Working Set Property</div>
            <div class="talk-description">Oral Qualfier Presentation. Paper by Haeupler, Hladík, Rozhoň, Tarjan, Tětek, 2024. FOCS Best Paper.</div>
            <div class="talk-slides"><a href="https://sohamch08.github.io/assets/dijkstra-optimal.pdf">Slides</a></div>
        </div> 
        <div class="talk-item">
            <div class="talk-title">n^1.62 Upper Bound on Hurwitz Problem</div>
            <div class="talk-description">TIFR Student Seminar. Paper by Hrubesh, 2024</div>
        </div>   
        <div class="talk-item">
            <div class="talk-title">Super Polynomial Lower Bound on Traveling Salesman Polytope</div>
            <div class="talk-description">Course-work presentation (TIFR):  Combinatorial Optimization. Paper by Fiorini, Massar, Pokutta, Tiwary and Wolf, 2012</div>
            <div class="talk-slides"><a href="https://sohamch08.github.io/assets/copt-presentation.pdf">Slides</a></div>
        </div>    
        <div class="talk-item">
            <div class="talk-title">Bounds on Price of Anarchy using Linear and Quadratic Programming</div>
            <div class="talk-description">Course-work presentation (TIFR): Algorithmic Game Theory. Paper by Kulkarni and Mirrokni, 2015</div>
            <div class="talk-slides"><a href="https://sohamch08.github.io/assets/agt-presentation.pdf">Slides</a></div>
        </div> 
        <div class="talk-item">
            <div class="talk-title">Bipartite Matching is in Quasi-NC</div>
            <div class="talk-description">TIFR Student Seminar, 2025. Paper by Stephen A. Fenner, Rohit Gurjar and Thomas Thierauf, 2016.</div>
        </div>   
        <div class="talk-item">
            <div class="talk-title">Hensel and Newton Methods in Valuation Rings</div>
            <div class="talk-description">Course-work presentation (CMI): Algebra and Computation. Paper by J von zur Gathen, 1984.</div>
        </div>
        <div class="talk-item">
            <div class="talk-title">Algebraic Geometric Codes</div>
            <div class="talk-description">Course-work presentation (CMI): Algorithmic Coding Theory II.  Jointly given by Me and  Shree Ganesh S J</div>
            <div class="talk-slides"><a href="https://sohamch08.github.io/assets/act-report.pdf">Report</a></div>
        </div>
        <div class="talk-item">
            <div class="talk-title">"Iterated Mod Problem" by Karloff and Ruzzo</div>
            <div class="talk-description">Course-work presentation (CMI): Parallel Algorithms and Complexity</div>
            <div class="talk-slides"><a href="https://sohamch08.github.io/assets/parallel-presentation-iterated-mod.pdf">Slides</a></div>
        </div>
        <!-- Add more talk items as needed -->
    </div>
<h2 class="internship-header">Research Internshipts</h2>
<div class="internship-container">
    <div class="internship-item">
        <div class="internship-time">Summer 2024</div>
        <div class="internship-description">Worked on derandomization of isolation lemma over polytopes under prof. <a href="https://www.cse.iitb.ac.in/~rgurjar/">Rohit Gurjar</a>, IIT Bombay</div>
        <div class="internship-abstract">In this project I tried to extend the idea of bounding the number of vectors in the integer lattice which has $L_1$ norm less than twice the shortest vector for 0-1 matrices with $k$-column sum to derandomize isolation lemma over more general polytopes. Additionally I  read about isolating a path connecting in a black-box layered graph.</div>
    </div>
    <div class="internship-item">
        <div class="internship-time">Dec'23-Jul'24</div>
        <div class="internship-description">Quantum Property Testing of Junta Functions and Partially Symmetric Functions with prof. <a href="https://sites.google.com/site/homepagearijitghosh/">Arijit Ghosh</a>, ISI Kolkata</div>
        <div class="internship-abstract">In this project I learned about Quantum Boolean Functions and some basics of Quantum algorithms for property testing from the Survey by <a href="https://arxiv.org/abs/0810.2435">Montanaro-Osborne, 2008</a>. I learned about Classical and Quantum Junta Function testing. We worked on finding a more efficient Quantum Algorithm for testing Paritally symmetric boolean functions by improving the classical  algorithm in Blais-Weinstein-Yoshida's Paper.</div>
    </div>
    <div class="internship-item">
        <div class="internship-time">Summer 2023</div>
        <div class="internship-description">Reading project on Factorization of Arithmetic Circuits under prof. <a href="https://www.cse.iitk.ac.in/users/nitin/">Nitin Saxena</a>, IIT Kanpur</div>
        <div class="internship-abstract">In the project I learned factorization techniques and closure of of VP and VBP under factorization. I also read closure of VF with bounded individual degree from Oliviera, 2016 paper and we worked on removing the bounded individual degree condition</div>
    </div>
    <div class="internship-item">
        <div class="internship-time">Dec 2022</div>
        <div class="internship-description">Computational Number Theroy and Algebra for Algebraic Comlexity Theory under prof. <a href="https://www.cse.iitk.ac.in/users/nitin/">Nitin Saxena</a>, IIT Kanpur</div>
        <div class="internship-abstract">I did a basic study of  Computational Number Theory and Algebra from Nitin Saxena's course and about Arithmetic Circuits from  <a href="https://www.nowpublishers.com/article/Details/TCS-039">Amir Shpilka's Survey</a> and 
	<a href="https://github.com/dasarpmar/lowerbounds-survey">Ramprasad Saptharishi's Survey</a> on Arithmetic Circuits.</div>
    </div>
</div>
