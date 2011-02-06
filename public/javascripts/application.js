Event.observe(window, 'load', function() {
  window.setTimeout(function() {
    new Effect.Fade('flash', {duration: 0.5});
  }, 2000);
});
