utilities
exportAll
	"GetTextExporter2 exportAll"
	self new exportTemplate.
	InternalTranslator availableLanguageLocaleIDs
		do: [:each | self new exportTranslator: each translator]