$(document).ready ->
		
	do implementareNavigatie = () ->
		clickBinding = (colectie) ->
			colectie.forEach (element) ->
				$(element[0]).on 'click', (e) ->
					e.preventDefault()
					$("html, body").velocity 'scroll', 
						duration: 1000
						offset: $(element[1]).offset().top
						easing: 'swing'

		# butoane pentru centrarea sectiunilor de ecran
		elemente_de_centrat = [
			[
				'#detalii'
				'#pagina-1'
			]
		]
		clickBinding(elemente_de_centrat)

		#cautare butoane .go-down si atasare eveniment click pt coborare la urmatoarea sectiune
		for buton in $('body').find('.go-down')
			grup = [[buton, $(buton).closest('section').next('section')]]
			clickBinding grup

		#cautare linkuri in bara navigatie si atasare eveniment pentru mutare la sectiune
		for legatura in $('nav.header>div.container-butoane>ul').find('a')
			# console.log legatura.text.toLowerCase()
			imperechere = [[legatura, $('[data-section-name="' + legatura.text.toLowerCase() + '"]')]]
			clickBinding imperechere
	
	#transformare buton in play/pause
	do controlVideo = () ->
		video = $('#fundal_video').get(0)
		icoana = $(".buton_play").children('i')
		modificareIcoana = (stare) ->
			if stare == 'pause'
				icoana.removeClass('play').addClass('pause')
			else if stare == 'play'
				icoana.removeClass('pause').addClass('play')

		video.onplaying = (e) ->
			modificareIcoana('pause')
		video.onended = (e) ->
			modificareIcoana('play')

		#buton pauza/play video landing page
		$(".buton_play").on('click', ()->
			if icoana.hasClass('pause')
				video.pause()
				modificareIcoana('play')
			else if icoana.hasClass('play')
				video.play()
				modificareIcoana('pause')
		)

	cookieMonster = (position) ->
		cookie = document.cookie

		#verificare daca este setat cookie
		regex = /(?:vertical+\=)(\d\w+?)(?:\;)/g
		testRegex = regex.exec(cookie)

		# console.log 'testul este: ' + docCookies.hasItem('vertical-position')

		#setare vertical-position daca nu este setat deja
		if not docCookies.hasItem('vertical-position')
			docCookies.setItem('vertical-position', position)
			# console.log docCookies.keys()


	# adaugare pozitia verticala a fiecarei <section> ce are link-uri in <a>
	do insertData = () ->
		linkuriProducatori = $("section[id^='pagina-'] > div.container-producatori > div.producator > a")
		for position in linkuriProducatori
			element = $(position)
			verticalPosition = element.parents('section').offset().top
			element.attr('data-vertical-position', verticalPosition)
			element.on 'click', () ->
				cookieMonster($(@).data('vertical-position'))

		# jQuery image slider
	do implentareCarusel = () ->
		# configurare
		vitezaAnimatie = 1000
		pauza = 4000
		slideCurent = 1

		# DOM caching
		$slider = $('#slider-frezare')
		$slideContainer = $slider.find('.slides')
		$slides = $slideContainer.find('.slide')

		# gaseste si stocheaza latimea parintelui
		latime = $slider.width()
		# gaseste si stocheaza numarul de slide-uri
		totalSlides = $slides.length

		# setare css width ul
		$slideContainer.css 'width', latime * totalSlides

		#setare css width li
		for slide in $slides
			$(slide).css 'width', latime

		# set interval
		setInterval () ->
			$slideContainer.velocity 'margin-left': '-=' + latime, vitezaAnimatie, () ->
				slideCurent++
				if slideCurent is totalSlides
					slideCurent = 1
					$slideContainer.css 'margin-left', 0
		, pauza
		# animatie margin-left
		# daca e ultimul slide din lista treci la urmatoarul producator
		# adauga butoane de interactionare pt slide-ul anterior/urmator si producator			
		

	# snap-on sectiune ecran
	$('body').panelSnap
		slideSpeed: 200
		directionThreshold: 20

	#tranzitie la schimbarea paginilor
		#self invoking anonymous function
	do ($) ->
		'use strict'
		continut = $('body#main').smoothState
			prefetch: true
			pageCacheSize: 10
			onStart:
				duration: 250
				render: () ->
					continut.toggleAnimationClass('is-exiting')
			callback: () ->
				console.log docCookies.getItem('vertical-position')
				$("html, body").scrollTop(docCookies.getItem('vertical-position'))
				implementareNavigatie()
				implentareCarusel()
				controlVideo()
				insertData()
				docCookies.removeItem('vertical-position')
		.data('smoothState')




