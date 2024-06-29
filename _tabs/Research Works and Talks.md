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
  margin: 0;
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
  --h: calc((var(--i) - 10) * (180 / var(--length)));
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
  height: 0.7rem;
  position: absolute;
  top: 0;
  left: 0;
  background: linear-gradient(to right, var(--c1) var(--stop), var(--c2) var(--stop));
}

h3.newlist {
  display: flex;
  align-items: center; /* Change this to center */
  margin: 0 0 3rem;
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
  background-color: var(--c1);
  color: white;
}

@media (min-width: 30em) {
  li.newlist {
    /* margin: 3rem auto; */
    padding: 3rem 1rem 1rem;
  }

  h3.newlist {
    font-size: 1.5rem;
    margin: 0 0 0.5rem;
  }

  h3.newlist::before {
    margin-right: 1.5rem;
  }
}
</style>

<body>
<ol class="newlist" style="--length: 10" role="list">
	<li class="newlist" style="--i: 1">
		<h3 class="newlist">Polyhedral Combinatorics and Derandomization of Isolation Lemma</h3>
		<p class="newlist">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing diam donec adipiscing tristique risus.</p>
	</li>
	<li class="newlist" style="--i: 2">
		<h3 class="newlist">Quantum Property Testing of Junta Functions and Partially Symmetric Functions.</h3>
		<p class="newlist">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing diam donec adipiscing tristique risus.</p>
	</li>
	<li class="newlist" style="--i: 3">
		<h3 class="newlist">Factorization of Arithmetic Circuits in Algebraic Complexity Theory</h3>
		<p class="newlist">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing diam donec adipiscing tristique risus.</p>
	</li>
	<li class="newlist" style="--i: 4">
		<h3 class="newlist">Computational Number Theroy and Algebra for Algebraic Comlexity Theory</h3>
		<p class="newlist">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing diam donec adipiscing tristique risus.</p>
	</li>
	<li class="newlist" style="--i: 5">
		<h3 class="newlist">Ramanujan’s work on theta functions and $q$-series and their connections with number theory</h3>
		<p class="newlist">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Adipiscing diam donec adipiscing tristique risus.</p>
	</li>
</ol>
</body>