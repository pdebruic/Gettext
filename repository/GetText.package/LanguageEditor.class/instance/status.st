gui methods
status
	"answer a status string"
	| translationsSize untranslatedSize |
	translationsSize := self translator translations size.
	untranslatedSize := self translator untranslated size.
	^ '| {1} phrases | {2} translated | {3} untranslated |' translated format: {translationsSize + untranslatedSize. translationsSize. untranslatedSize}