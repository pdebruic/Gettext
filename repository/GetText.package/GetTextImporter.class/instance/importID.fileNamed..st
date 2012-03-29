importing
importID: localeID fileNamed: fileName
	| currentPlatform |
	language := InternalTranslator newLocaleID: localeID.
	currentPlatform := Locale currentPlatform.
	[Locale
		currentPlatform: (Locale localeID: localeID).
	[stream := FileStream readOnlyFileNamed: fileName.
	stream text.
	self parse]
		ensure: [stream notNil
				ifTrue: [stream close]]]
		ensure: [Locale currentPlatform: currentPlatform].
	NaturalLanguageTranslator privateStartUp "Actually it is not private no more...".