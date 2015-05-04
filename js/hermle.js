(function() {
  (function($) {
    'use strict';
    var continut;
    return continut = $('#xxx').smoothState({
      prefetch: true,
      onStart: {
        duration: 250,
        render: function() {
          return continut.toggleAnimationClass('is-exiting');
        }
      }
    }).data('smoothState');
  })($);

}).call(this);
