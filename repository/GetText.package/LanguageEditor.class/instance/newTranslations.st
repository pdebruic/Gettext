gui methods
newTranslations
	"private - try to apply the translations as much as possible all 
	over the image"
	| result newID |
	result := FillInTheBlank request: 'New locale ID string?' translated initialAnswer: Locale current determineLocaleID isoString.
	result isEmpty
		ifTrue: ["Do nothing"
			^ self].
	newID := LocaleID isoString: result.
	InternalTranslator
		newLocaleID: (LocaleID isoString: result).
	self class openOn: newID