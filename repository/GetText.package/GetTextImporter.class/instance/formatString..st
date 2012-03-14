private
formatString: aString 
"
	self assert: (GetTextImporter new formatString: 'test') = 'test'.
	self assert: (GetTextImporter new formatString: 'te\nst') = ('te', String cr, 'st').
	self assert: (GetTextImporter new formatString: 'te\\nst') = ('te\nst').
	self assert: (GetTextImporter new formatString: 'te\\st') = ('te\st').
	self assert: (GetTextImporter new formatString: 'te\st') = ('te\st').
"
	| reader writer char |
	reader := aString readStream.
	writer := '' writeStream.
	[reader atEnd]
		whileFalse: [char := reader next.
			(char = $\
					and: [reader atEnd not])
				ifTrue: [char := reader next.
					char caseOf: {
						[$n] -> [writer nextPut: Character cr].
						[$t] -> [writer nextPut: Character tab].
						[$"] -> [writer nextPut: $"].
						[$\] -> [writer nextPut: $\]}
						 otherwise: [writer nextPutAll: {$\. char}]]
				ifFalse: [writer nextPut: char]].
	^ writer contents