gui methods
filterTranslations: aString 
| filter |
filter := aString ifNil:[''].
""
	translationsFilter := filter.
	self refreshTranslations.
