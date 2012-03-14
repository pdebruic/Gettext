experimental
translateByHash: aString
	| trans |
	trans _ self searchByHash: aString.
	trans isNil ifTrue: [^aString]
			ifFalse: [^trans].
