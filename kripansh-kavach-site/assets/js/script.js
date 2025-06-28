// Initialize ScrollSpy
const scrollSpy = new bootstrap.ScrollSpy(document.body, {
  target: '#mainNav',
  offset: 80
});

// Bootstrap modal product prefill
const quoteModal = document.getElementById('quoteModal');
if (quoteModal) {
  quoteModal.addEventListener('show.bs.modal', event => {
    const button = event.relatedTarget;
    const product = button?.getAttribute('data-product') || '';
    document.getElementById('productInput').value = product;
  });
}

// Form validation with name attributes
(function () {
  'use strict';
  const forms = document.querySelectorAll('.needs-validation');
  Array.from(forms).forEach(form => {
    // Add name attributes to all form inputs if missing
    form.querySelectorAll('input, textarea, select').forEach(input => {
      if (!input.name) {
        input.name = input.id || input.className.split(' ')[0];
      }
    });

    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
})();

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    document.querySelector(this.getAttribute('href')).scrollIntoView({
      behavior: 'smooth'
    });
  });
});

// Remove unused trust section animations and styles
