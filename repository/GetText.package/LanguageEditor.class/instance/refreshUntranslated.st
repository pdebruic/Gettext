updating
refreshUntranslated
"refresh the untranslated panel"
	self refreshTranslations.
	self selectedUntranslated: 0.
	untranslated := nil.
	self changed: #untranslated.
