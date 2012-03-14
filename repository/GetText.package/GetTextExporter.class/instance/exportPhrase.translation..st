private
exportPhrase: phraseString translation: translationString 
	| normalizedTrans tmp transStartsWithCR transEndsWithCR|
	phraseString isEmpty
		ifTrue: [^ self].
	self exportTag: 'msgid' msg: phraseString.
	translationString size = 0 ifTrue: [
		normalizedTrans _ ''
	] ifFalse: [
		transEndsWithCR _ translationString last = (Character cr).
		phraseString last = (Character cr) ifTrue: [
			transEndsWithCR ifTrue: [
				normalizedTrans _ translationString
			] ifFalse: [
				normalizedTrans _  translationString , String cr
			]
		] ifFalse: [
			transEndsWithCR ifTrue: [
				normalizedTrans _ translationString allButLast
			] ifFalse: [
				normalizedTrans _ translationString
			]
		].
		transStartsWithCR _ normalizedTrans first = (Character cr).
		phraseString first = (Character cr) ifTrue: [
			transStartsWithCR ifFalse: [
				tmp _ (Character cr asString) , normalizedTrans.
				normalizedTrans _ tmp.
			]
		] ifFalse: [
			transStartsWithCR ifTrue: [
				normalizedTrans _ normalizedTrans allButFirst
			]
		]
	].
	self exportTag: 'msgstr' msg: normalizedTrans.
	stream cr