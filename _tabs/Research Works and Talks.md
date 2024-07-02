---
layout: default
icon: fa-solid fa-book
order: 2
permalink: /projects-talks/
title: Research Works and Talks
---

<!-- <style>
@import url('https://fonts.googleapis.com/css2?family=Space+Mono:ital,wght@0,400;0,700;1,400;1,700&display=swap');

body { 
  /* font-family: 'Space Mono', monospace;  */
  display: flex;
  flex-direction: column;

ol.alternating-colors {
  counter-reset: list-counter;
}

ol.alternating-colors li {
  color: #fff7d1;
  padding-left: 16px;fff
  margin-top: 24px;
  position: relative;
  font-size: 16px;
  line-height: 20px;
  list-style: none; /* Remove default list styling */
  counter-increment: list-counter;
}

ol.alternating-colors li::before {
  content: counter(list-counter);
  display: flex;
  align-items: center;
  justify-content: center;
  height: 42px;
  width: 42px;
  border-radius: 50%;
  border: 2px solid #ddd;
  position: absolute;
  top: 0;
  left: -56px; /* Adjusted to position the circle correctly */
  text-align: center;
  vertical-align: middle;
  /* background-color: #fff; Optional: background color for better visibility */
  color: #fff; /* Optional: color for the counter text */
}

ol.alternating-colors li:nth-child(odd)::before {
  border-color: #0BAD02;
}

ol.alternating-colors li:nth-child(even)::before {
  border-color: #2378D5;
}

strong {
  color: #ffffff;
}

</style>

<body>
<ol class="alternating-colors">
  <li>
    <strong>Half-Life 2</strong>
    <p>Fight aliens, wear a head crab, learn about gravity</p>
  </li>
  <li>
    <strong>Halo: Combat Evolved</strong>
    <p>Fight aliens, wear an AI, learn about screen peeking siblings</p>
  </li>
  <li>
    <strong>Team Fortress 2</strong>
    <p>Fight non-alien residents, wear hats, learn about teamwork</p>
  </li>
  <li>
    <strong>Tribes</strong>
    <p>Ski, slip, and slide your way to victory</p>
  </li>
</ol>
</body> -->
<style>
p.newlist {
  margin: 1rem;
  /* line-height: 1.6; */
}

ol.newlist {
  list-style: none;
  counter-reset: list;
  padding: 0 0rem;
}

li.newlist {
  --stop: calc(100% / var(--length) * var(--i));
  --l: 62%;
  --l2: 88%;
  --h: calc((var(--i) - 9) * (180 / var(--length)));
  --c1: hsl(var(--h), 71%, var(--l));
  --c2: hsl(var(--h), 71%, var(--l2));

  position: relative;
  counter-increment: list;
  /* max-width: 45rem; */
  margin: 1rem auto;
  /* padding: 2rem 1rem 1rem; */
  box-shadow: 0.1rem 0.1rem 1.5rem rgba(0, 0, 0, 0.3);
  border-radius: 0.25rem;
  overflow: hidden;
  /* background-color: white; */
}

li.newlist::before {
  content: '';
  display: block;
  width: 100%;
  height: 0.5rem;
  position: absolute;
  top: 0;
  left: 0;
  background: linear-gradient(to right, var(--c1) var(--stop), var(--c2) var(--stop));
}

h3.newlist {
  display: flex;
  align-items: center; /* Change this to center */
  margin: 1rem 1rem 1rem;
  color: white;
}

h3.newlist::before {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 0 0 auto;
  margin-right: 1rem;
  width: 3rem;
  height: 3rem;
  content: counter(list);
  /* padding: 1rem; */
  border-radius: 50%;
  border-width: 2px;
  border: 3px solid var(--c1);
  color: white;
}

@media (min-width: 40em) {
  li.newlist {
    /* margin: 3rem auto; */
    padding: 3rem 1rem 1rem;
  }

  h3.newlist {
    font-size: 1.5rem;
    margin: 1 0 0.5rem;
  }

  h3.newlist::before {
    margin-right: 1.5rem;
  }
}
</style>


<body>
<h2 style="font-size:2.5em;">Talks</h2>
<ol class="newlist" style="--length: 3" role="list">
<li class="newlist" style="--i: 1">
<h3 class="newlist">Hensel and Newton Methods in Valuation Rings by J von zur Gathen</h3>
<p class="newlist">
Course-work presentation (Algebra and Computation), CMI
</p>
</li>
<li class="newlist" style="--i: 2">
<h3 class="newlist">Algebraic Geometric Codes</h3>
<p class="newlist">
Course-work presentation (Algorithmic Coding Theory II), CMI
</p>
<p class="newlist">
<a href="/assets/act-report.pdf">Report</a>
</p>
</li>
<li class="newlist" style="--i: 3">
<h3 class="newlist">Iterated Mod Problem</h3>
<p class="newlist">
Course-work presentation (Parallel Algorithms and Complexity), CMI
</p>
<p class="newlist">
<a href="/assets/parallel-presentation-iterated-mod.pdf">Slides</a>
</p>
</li>
</ol>
<h2 style="font-size:2.5em;">Research Internships</h2>
<ol class="newlist" style="--length: 5" role="list">
	<li class="newlist" style="--i: 1">
		<h3 class="newlist">Polyhedral Combinatorics and Derandomization of Isolation Lemma</h3>
		<h4 style="margin-bottom: -30px;">Supervisor: <a href="https://www.cse.iitb.ac.in/~rgurjar/">Rohit Gurjar</a>, IIT Mumbai</h4>
		<h5>Duration: May - Jul, 2024</h5>
		<p class="newlist">
		<ul>
			<li>I read the papers:<ul> <li>Bipartite Perfect Matching is in  Quasi-NC  by Fenner, Gurjar and  Thierauf</li>
			<li>Linear Matroid Intersection Is in Quasi-NC by Gurjar and Thierauf</li>
			<li>Fractional Linear Matroid Matching is in Quasi-NC by Gurjar, Oki, Raj</li>
			</ul>
		and learned how the idea of giving every cycle a nonzero circulations is generalized from bipartite graphs to matroid intersection polytopes to allowing half intergral vertices in matroid matching polytopes</li>
		<li>Additionally I read about isolating a path connecting the source vertex and sink vertex in a black-box layered graph from the paper 'Derandomizing Isolation in Space-Bounded Settings' by Melkebeek and Prakriya.</li>
		</ul>
		</p>
	</li>
	<li class="newlist" style="--i: 2">
		<h3 class="newlist">Quantum Property Testing of Junta Functions and Partially Symmetric Functions</h3>
		<h4 style="margin-bottom: -30px;">Supervisor: <a href="https://sites.google.com/site/homepagearijitghosh/">Arijit Ghosh</a>, Indian Statistical Institute, Kolkata</h4>
		<h5>Duration: Dec, 2023</h5>
		<p class="newlist">
		<ul>
			<li>I read the survey 'Quantum boolean functions' by Ashley Montanaro, Tobias J. Osborne and learned  about Fourier analysis of boolean functions in Quantum setting and Testing and Learning algorithms for Stabilizer states</li>
		<li>I learned about Classical Junta Testing from Eric Blais' paper Testing Juntas Nearly Optimally and then read about Quantum Junta Testing Algorithm from 'Testing and Learning Quantum Juntas Nearly Optimally' by Thomas Chen, Shivam Nadimpalli, Henry Yuen</li>
		<li>Also learned about Partially Symmetric Boolean Functions and it's classical algorthm of testing partially symmetric functions from the paper 'Partially Symmetric Functions are Efficiently Isomorphism-Testable' by Eric Blais, Amit Weinstein, Yuichi Yoshida</li>
		</ul>
		</p>
	</li>
	<li class="newlist" style="--i: 3">
		<h3 class="newlist">Factorization of Arithmetic Circuits in Algebraic Complexity Theory</h3>
		<h4 style="margin-bottom: -30px;">
		Supervisor: <a href="https://www.cse.iitk.ac.in/users/nitin/">Nitin Saxena</a>, IIT Kanpur
		</h4>
		<h5>
		May - Jul, 2023
		</h5>
		<p class="newlist">
		<ul>
			<li>I read 'Discovering the roots: Uniform closure results for algebraic classes under factoring' by Pranjal Dutta, Nitin Saxena and Amit Sinhababu  where I learned how to factorize arithmetic circuits and why  VP  is closed under factorization. Also leanred how Polynomial Identity Testing and Multivariate Factorizations are equivalent from 'Equivalence of Polynomial Identity Testing and Deterministic Multivariate Polynomial Factorization' by Swastik Kopparty, Shubhangi Saraf, Amir Shpilka</li>
		<li>Also read the Kaltofen's proof of  VP  closed under factorization.</li>
		<li>I also read how  VBP  is closed under factorization from Amit Sinhababu and Thomas Tierauf's paper 'Factorization of Polynomials given by Arithmetic Branching Programs'</li>
		<li>I also learned about the difficulties about proving factor closure for  VF  from the above mentioned two papers</li>
		<li>I read about factorization of formulas with individual degree bounded form the paper 'Factors of low individual degree polynomials' by Rafael Oliveira and we were trying to remove the condition for formulas</li>
		</ul>
		</p>
	</li>
	<li class="newlist" style="--i: 4">
		<h3 class="newlist">Computational Number Theroy and Algebra for Algebraic Comlexity Theory</h3>
		<h4 style="margin-bottom: -30px;">
		Supervisor: <a href="https://www.cse.iitk.ac.in/users/nitin/">Nitin Saxena</a>, IIT Kanpur</h4>
		<h5>
		Dec, 2023
		</h5>
		<p class="newlist">
		<ul>
		<li>I learned about Computational Number Theory and Algebra from Nitin Saxena's Course and read the book 'Modern Computer Algebra' by Von Zur Gathen and Jurgen Gerhard</li>
		<li>Also I learned about Arithmetic Circuits from <a href="https://www.nowpublishers.com/article/Details/TCS-039">Amir Shpilka's Survey</a> and 
	<a href="https://github.com/dasarpmar/lowerbounds-survey">Ramprasad Saptharishi's Survey</a> on Arithmetic Circuits.</li>
		</ul>
		</p>
	</li>
</ol>
</body>
