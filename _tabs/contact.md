---
title: Contact
icon: fa-solid fa-envelope
permalink: /contact/
order: 6
---
<link rel="stylesheet" href="{{ '/assets/css/contact.css' | relative_url }}">
<link rel="stylesheet" href="{{ '/assets/css/modal.css' | relative_url }}">

Feel free to reach out to me through mail.

<section class="contact-email" aria-labelledby="email-title">
  <div class="contact-email-heading">
    <h2 id="email-title">Email</h2>
  </div>
  <div class="contact-email-list">
    <div class="contact-email-address" data-email-row>
      <span class="contact-email-label"><i class="fa-regular fa-envelope" aria-hidden="true"></i>TIFR</span>
      <p>soham [dot] chatterjee [at] tifr [dot] res [dot] in</p>
      <button type="button" class="contact-email-copy" data-copy-email="soham.chatterjee@tifr.res.in" aria-label="Copy TIFR email address" hidden><span data-copy-label>Copy</span><i class="fa-regular fa-copy" aria-hidden="true"></i></button>
      <span class="copy-status" role="status" aria-live="polite"></span>
    </div>
    <div class="contact-email-address" data-email-row>
      <span class="contact-email-label"><i class="fa-regular fa-envelope" aria-hidden="true"></i>Personal</span>
      <p>sohamchatterjee999 [at] gmail [dot] com</p>
      <button type="button" class="contact-email-copy" data-copy-email="sohamchatterjee999@gmail.com" aria-label="Copy personal email address" hidden><span data-copy-label>Copy</span><i class="fa-regular fa-copy" aria-hidden="true"></i></button>
      <span class="copy-status" role="status" aria-live="polite"></span>
    </div>
  </div>
</section>

{% include public-keys.html %}

<script defer src="{{ '/assets/js/modal.js' | relative_url }}"></script>
<script defer src="{{ '/assets/js/public-keys.js' | relative_url }}"></script>
