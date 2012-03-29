updating
refreshTranslations
	"refresh the translations panel"
	self selectedTranslation: 0.
	translations := nil.
	self changed: #translations.
