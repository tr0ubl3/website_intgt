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
	# $ ->
	# 	$.scrollify
	# 		section: 'section'
	# 		sectionName : "section-name"
	$('body').panelSnap
		slideSpeed: 500