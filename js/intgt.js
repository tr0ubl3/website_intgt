$(document).ready(function() {
  var controlVideo, elemente_de_centrat;
  elemente_de_centrat = [['#detalii', '#pagina-1'], ['#strunjire', '#pagina-2']];
  elemente_de_centrat.forEach(function(element) {
    return $(element[0]).click(function() {
      return $("html, body").animate({
        scrollTop: ($(element[1]).offset().top)
      }, 1000, "swing");
    });
  });
  $('body').panelSnap({
    slideSpeed: 500
  });
  return (controlVideo = function() {
    var icoana, modificareIcoana, video;
    video = $('#fundal_video').get(0);
    icoana = $(".buton_play").children('i');
    modificareIcoana = function(stare) {
      if (stare === 'pause') {
        return icoana.removeClass('play').addClass('pause');
      } else if (stare === 'play') {
        return icoana.removeClass('pause').addClass('play');
      }
    };
    video.onplaying = function(e) {
      return modificareIcoana('pause');
    };
    video.onended = function(e) {
      return modificareIcoana('play');
    };
    return $(".buton_play").on('click', function() {
      if (icoana.hasClass('pause')) {
        video.pause();
        return modificareIcoana('play');
      } else if (icoana.hasClass('play')) {
        video.play();
        return modificareIcoana('pause');
      }
    });
  })();
});
