private
loadHeader: strm
	strm binary.
	magic _  strm uint32.
	magic = 16rDE120495 
		ifTrue: [isLittleEndian _ true]
		ifFalse: [
			magic = 16r950412DE 
				ifTrue: [isLittleEndian _ false]
				ifFalse: [ self error: 'invalid MO']
		].
	revision _ self nextInt32From: strm.
	nStrings _ self nextInt32From: strm.
	originalTableOffset _ self nextInt32From: strm.
	translatedTableOffset _ self nextInt32From: strm.
	hashTableSize _ self nextInt32From: strm.
	hashTableOffset _ self nextInt32From: strm.
