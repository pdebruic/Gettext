private
createExtraInformation
	| extras |
	extras := OrderedCollection new.
	#(
		'Language name as you''d like it to appear in the Languages menu' 'Language-Name'
		'Directionality of language' 'Language-Direction'
		) pairsDo: [:first :second |
			extras add: (Array with: '' with: first with: second).
	].
	^ extras