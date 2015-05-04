$(document).ready(function() {
  var controlVideo, cookieMonster, implementareNavigatie, insertData;
  (implementareNavigatie = function() {
    var buton, clickBinding, elemente_de_centrat, grup, imperechere, legatura, _i, _j, _len, _len1, _ref, _ref1, _results;
    clickBinding = function(colectie) {
      return colectie.forEach(function(element) {
        return $(element[0]).on('click', function(e) {
          e.preventDefault();
          return $("html, body").animate({
            scrollTop: ($(element[1]).offset().top)
          }, 1000, "swing");
        });
      });
    };
    elemente_de_centrat = [['#detalii', '#pagina-1']];
    clickBinding(elemente_de_centrat);
    _ref = $('body').find('.go-down');
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      buton = _ref[_i];
      grup = [[buton, $(buton).closest('section').next('section')]];
      clickBinding(grup);
    }
    _ref1 = $('nav.header>div.container-butoane>ul').find('a');
    _results = [];
    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
      legatura = _ref1[_j];
      imperechere = [[legatura, $('[data-section-name="' + legatura.text.toLowerCase() + '"]')]];
      _results.push(clickBinding(imperechere));
    }
    return _results;
  })();
  (controlVideo = function() {
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
  cookieMonster = function(position) {
    var cookie, regex, testRegex;
    cookie = document.cookie;
    regex = /(?:vertical+\=)(\d\w+?)(?:\;)/g;
    testRegex = regex.exec(cookie);
    if (!docCookies.hasItem('vertical-position')) {
      return docCookies.setItem('vertical-position', position);
    }
  };
  (insertData = function() {
    var element, linkuriProducatori, position, verticalPosition, _i, _len, _results;
    linkuriProducatori = $("section[id^='pagina-'] > div.container-producatori > div.producator > a");
    _results = [];
    for (_i = 0, _len = linkuriProducatori.length; _i < _len; _i++) {
      position = linkuriProducatori[_i];
      element = $(position);
      verticalPosition = element.parents('section').offset().top;
      element.attr('data-vertical-position', verticalPosition);
      _results.push(element.on('click', function() {
        return cookieMonster($(this).data('vertical-position'));
      }));
    }
    return _results;
  })();
  $('body').panelSnap({
    slideSpeed: 200,
    directionThreshold: 20
  });
  return (function($) {
    'use strict';
    var continut;
    return continut = $('body#main').smoothState({
      prefetch: true,
      pageCacheSize: 10,
      onStart: {
        duration: 250,
        render: function() {
          return continut.toggleAnimationClass('is-exiting');
        }
      },
      callback: function() {
        console.log(docCookies.getItem('vertical-position'));
        $("html, body").scrollTop(docCookies.getItem('vertical-position'));
        implementareNavigatie();
        controlVideo();
        insertData();
        return docCookies.removeItem('vertical-position');
      }
    }).data('smoothState');
  })($);
});
