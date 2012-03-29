private-translations
exportTranslations
	| keys size |
	keys := language translations keys asArray sort.
	size := keys size.
	ProgressInitiationException
		display: 'Exporting translated phrases as a gettext file.'
		during: [:bar | 1
				to: size
				do: [:index | 
					self
						exportPhrase: (keys at: index)
						translation: (language translations
								at: (keys at: index)).
					bar value: index / size]]