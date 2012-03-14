parsing
storeTranslation
	| key |
	key := self formatString: msgId.
	msgId isEmpty
		ifFalse: [InternalTranslator registerPhrase: key.
			msgStr isEmpty
				ifFalse: [language
						rawPhrase: key
						translation: (self formatString: msgStr)]].
	self initialize