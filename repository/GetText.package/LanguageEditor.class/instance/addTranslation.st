gui methods
addTranslation
	"translate a phrase"
	| phrase |
	phrase := FillInTheBlank
				request: 'enter the original:' translated
				initialAnswer: ''.

	(phrase isNil
			or: [phrase = ''])
		ifTrue: [""
			self beep.
			^ self].
	""
	self translatePhrase: phrase