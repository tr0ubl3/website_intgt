$(document).ready ->
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
	elemente_de_centrat.forEach (element) ->
		$(element[0]).click ->
			$("html, body").animate({scrollTop:($(element[1]).offset().top)}, 1000, "swing")

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

