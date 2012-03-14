gui methods
filterUntranslated: aString 
	| filter |
	filter := aString
				ifNil: [''].
	""
	untranslatedFilter := filter.
	self refreshUntranslated