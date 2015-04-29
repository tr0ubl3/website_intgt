$(document).ready(function() {
  var buton, clickBinding, controlVideo, elemente_de_centrat, grup, imperechere, legatura, _i, _j, _len, _len1, _ref, _ref1;
  clickBinding = function(colectie) {
    return colectie.forEach(function(element) {
      return $(element[0]).click(function() {
        return $("html, body").animate({
          scrollTop: ($(element[1]).offset().top)
        }, 1000, "swing");
      });
    });
  };
  elemente_de_centrat = [['#detalii', '#pagina-1'], ['#strunjire', '#pagina-2']];
  clickBinding(elemente_de_centrat);
  _ref = $('body').find('.go-down');
  for (_i = 0, _len = _ref.length; _i < _len; _i++) {
    buton = _ref[_i];
    grup = [[buton, $(buton).closest('section').next('section')]];
    clickBinding(grup);
  }
  _ref1 = $('nav.header>div.container-butoane>ul').find('a');
  for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
    legatura = _ref1[_j];
    console.log(legatura.text.toLowerCase());
    imperechere = [[legatura, $('[data-section-name="' + legatura.text.toLowerCase() + '"]')]];
    clickBinding(imperechere);
  }
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
