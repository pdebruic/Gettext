gui methods
phrase: phraseString translation: translationString 
	"set the models's translation for phraseString"
	self translator phrase: phraseString translation: translationString.
	self refreshBoth.

	newerKeys add: phraseString.
