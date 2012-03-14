parsing
parse
	| size |
	size := (stream isKindOf: FileStream)
				ifTrue: [stream size]
				ifFalse: [1].
	ProgressInitiationException
		display: 'Importing phrases from a gettext file.'
		during: [:bar | [stream atEnd]
				whileFalse: [| line | 
					line := stream upTo: Character linefeed.
					self
						parseLine: ((line endsWith: String cr)
								ifTrue: [line allButLast]
								ifFalse: [line]).
					bar value: stream position / size]].
	self storeTranslation