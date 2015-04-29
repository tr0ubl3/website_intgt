$(document).ready ->
	clickBinding = (colectie) ->
		colectie.forEach (element) ->
			$(element[0]).on 'click', (e) ->
				e.preventDefault()
				$("html, body").animate({scrollTop:($(element[1]).offset().top)}, 1000, "swing")

	# centrarea sectiunilor de ecran
	elemente_de_centrat = [
		[
			'#detalii'
			'#pagina-1'
		]
		[
			'#strunjire'
			'#pagina-2'
		]
	]
	clickBinding(elemente_de_centrat)

	#cautare butoane .go-down si atasare eveniment click pt coborare la urmatoarea sectiune
	for buton in $('body').find('.go-down')
		grup = [[buton, $(buton).closest('section').next('section')]]
		clickBinding grup

	#cautare linkuri in bara navigatie si atasare eveniment pentru mutare la sectiune
	for legatura in $('nav.header>div.container-butoane>ul').find('a')
		console.log legatura.text.toLowerCase()
		imperechere = [[legatura, $('[data-section-name="' + legatura.text.toLowerCase() + '"]')]]
		clickBinding imperechere
	
	# snap-on sectiune ecran
	$('body').panelSnap
		slideSpeed: 500

	# wegbl logo
	# scene = new THREE.Scene()
	# camera = new THREE.PerspectiveCamera( 45, 1, 1, 1000 )
	# renderer = new THREE.WebGLRenderer('#logo',"highp")
	# renderer.setSize( $('#logo').width(), $('#logo').height() )
	# # renderer.context='#logo'
	# console.log renderer.getContext()
	# # document.body.appendChild( renderer.domElement )
	# geometry = new THREE.BoxGeometry( 0.5, 0.5, 0.5 )
	# material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } )
	# cube = new THREE.Mesh( geometry, material )
	# scene.add( cube )
	# camera.position.z = 2
	# render = () ->
	# 	requestAnimationFrame( render )
	# 	cube.rotation.x += 0.1
	# 	cube.rotation.y += 0.1
	# 	renderer.render(scene, camera)
	# render()

	#animatie svg
	#frezare
	# freza = Snap('svg#frezare').select('#freza')
	# fMatrix = new Snap.Matrix()
	# fMatrix.rotate(1,0,0)
	# # freza.transform(fMatrix)
	# freza.animate({d: 'm542 232.95c-18.658-1.7575 43.767-28.29 43.767-28.29-4.9033-17.379-35.015-14.252-52.056-2.613-17.04 11.639 15.343-49.805 15.343-49.805-13.881-10.992-37.868 10.51-41.557 31.452-3.6889 20.941-20.261-48.007-20.261-48.007-17.936 1.515-19.123 33.849-11.615 50.804 7.5072 16.954-46.383-23.758-46.383-23.758-14.002 13.606 6.6674 40.238 23.758 46.384 17.091 6.1458-50.804 11.615-50.804 11.615-2.3946 20.039 30.985 25.643 48.014 20.26 17.03-5.3827-31.452 41.553-31.452 41.553 10.364 15.432 41.145-0.36438 49.804-15.343 8.6595-14.979 2.6163 52.049 2.6163 52.049 17.497 4.9057 29.791-26.61 28.29-43.767-1.5011-17.157 35.46 38.19 35.46 38.19 15.729-9.495 2.8689-41.821-6.4616-51.713-9.3306-9.8914 51.712 6.4616 51.712 6.4616 7.7019-15.46-19.532-33.706-38.186-35.467zm-45.065 16.37c-12.792 1.1192-24.069-8.343-25.188-21.135-1.1192-12.792 8.343-24.069 21.135-25.188 12.792-1.1192 24.069 8.343 25.188 21.135 1.1192 12.792-8.344 24.069-21.135 25.188z'}, 1000, () ->
	# 	freza.animate({d: 'm540.57 236.62c-18.434-3.377 46.066-24.368 46.066-24.368-3.37-17.74-33.64-17.25-51.63-7.14s19.625-48.278 19.625-48.278c-12.87-12.16-38.64 7.17-44.14 27.71s-16-49.59-16-49.59c-18-0.054-22 32.054-15.999 49.598s-44.136-27.71-44.136-27.71c-15.135 12.334 3.135 40.666 19.625 48.278s-51.623 7.143-51.623 7.143c-4.132 19.754 28.632 28.246 46.066 24.368s-34.954 38.654-34.954 38.654c8.98 16.277 41.02 3.223 50.952-10.944s-1.93 52.079-1.93 52.079c17.003 6.412 31.997-23.912 31.997-41.135s31.997 41.135 31.997 41.135c16.497-8.088 6.503-41.412-1.93-52.079s50.952 10.944 50.952 10.944c9.02-14.73-16.52-35.28-34.95-38.66zm-46.32 12.38c-12.841 0-23.25-10.409-23.25-23.25s10.409-23.25 23.25-23.25 23.25 10.409 23.25 23.25-10.41 23.25-23.25 23.25z'},1000, mina.linear)
	# )

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


