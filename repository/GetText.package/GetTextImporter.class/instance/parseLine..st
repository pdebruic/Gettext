parsing
parseLine: lineString 
	(lineString beginsWith: '"Content-Type:')
		ifTrue: [self setContentType: lineString.
			^ self].
	(lineString beginsWith: '#')
		ifTrue: ["do nothing"
			^ self].
	lineString = ''
		ifTrue: [^ self storeTranslation].
	(lineString beginsWith: 'msgid')
		ifTrue: [state := #appendId:.
			self parseMsg: lineString.
			^ self].
	(lineString beginsWith: 'msgstr')
		ifTrue: [state := #appendStr:.
			self parseMsg: lineString.
			^ self].
	self parseMsg: lineString