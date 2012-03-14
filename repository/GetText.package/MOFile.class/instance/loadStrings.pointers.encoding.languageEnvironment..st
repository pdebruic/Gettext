private
loadStrings: strm pointers: tupple encoding: encodingName languageEnvironment: env
	| strings rawStr str offsetTable lenTable |
	offsetTable _  tupple first.
	lenTable _ tupple second.
	strings _ Array new: nStrings.
	1 to: nStrings do: [:index |
		rawStr _ self loadString: strm 
					pointer:  (offsetTable at: index)
					length: (lenTable at: index).
		str _ encodingName isNil ifTrue: [rawStr] 
						ifFalse: [ encodingName = 'utf8' 
									ifTrue: [rawStr utf8ToSqueak applyLanguageInfomation: env]
									ifFalse: [self error: 'this encoding isn''t supported']
						].
		strings at: index put: str.
	].
	^strings.