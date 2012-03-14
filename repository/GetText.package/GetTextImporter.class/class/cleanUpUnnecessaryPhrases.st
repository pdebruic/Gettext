utilities
cleanUpUnnecessaryPhrases
	| keys refuse replaceBlock reader writer char result |
	"GetTextImporter cleanUpUnnecessaryPhrases"
	""
	"Collect wrong phrases"
	keys := InternalTranslator allKnownPhrases copy keys.
	refuse := Set new.
	"replaceBlock value: 'te\\nst'."
	replaceBlock := [:aString | 
			reader := aString readStream.
			writer := '' writeStream.
			[reader atEnd]
				whileFalse: [char := reader next.
					(char = $\
							and: [reader peek = $\])
						ifFalse: [writer nextPut: char]].
			writer contents].
	keys
		do: [:each | 
			result := replaceBlock value: each.
			(result ~= each
					and: [keys includes: result])
				ifTrue: [refuse add: each].
			result := GetTextImporter new formatString: each.
			(result ~= each
					and: [keys includes: result])
				ifTrue: [refuse add: each]].
	""
	"Remove from translated"
	InternalTranslator cachedTranslations
		do: [:each | refuse
				do: [:key | each translations
						removeKey: key
						ifAbsent: []]].
	""
	"Remove from untranslated"
	refuse
		do: [:key | InternalTranslator allKnownPhrases
				removeKey: key
				ifAbsent: []]