private-translations
exportUntranslated
	| keys |
	keys := language untranslated keys asArray sort.
	ProgressInitiationException
		display: 'Exporting untranslated phrases as a gettext file.'
		at: Sensor cursorPoint
		from: 1
		to: keys size
		during: [:bar | 1
				to: keys size
				do: [:index | 
					self
						exportPhrase: (keys at: index)
						translation: ''.
					bar value: index]]