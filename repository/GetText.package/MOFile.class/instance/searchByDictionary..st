public
searchByDictionary: aString
	| index |
	index _ translations at: aString ifAbsent: [^nil].
	^self translatedString: index
	
