// This is a little fix that helps MDL cooperate with rails' Turbolinks
document.addEventListener('page:change', function() {
  componentHandler.upgradeDom();
});