experimental
searchByHash: aString
	| hashValue nstr index incr key |
	hashValue _  self hashPjw: aString.
	incr _ 1 + (hashValue \\ (hashTableSize -2)).
	index _ (hashValue \\ hashTableSize) .
	[ 	nstr _ (hashTable at: index +1 ).
		nstr = 0 ifTrue: [^nil].
		key _ self originalString: nstr.
		key = aString ifTrue: [^self translatedString: nstr].
		index >= (hashTableSize - incr) 
				ifTrue: [index _ index - (hashTableSize - incr)  ]
				ifFalse:[index _ index + incr].	
	] doWhileTrue: true.