do ($) ->
		'use strict'
		continut = $('#xxx').smoothState
			prefetch: true
			onStart:
				duration: 250
				render: () ->
					continut.toggleAnimationClass('is-exiting')
		.data('smoothState')