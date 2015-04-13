$(document).ready(function() {
  var elemente_de_centrat;
  elemente_de_centrat = [['#detalii', '#pagina-1'], ['#strunjire', '#pagina-2']];
  elemente_de_centrat.forEach(function(element) {
    return $(element[0]).click(function() {
      return $("html, body").animate({
        scrollTop: ($(element[1]).offset().top)
      }, 1000, "swing");
    });
  });
  return $('body').panelSnap({
    slideSpeed: 500
  });
});
