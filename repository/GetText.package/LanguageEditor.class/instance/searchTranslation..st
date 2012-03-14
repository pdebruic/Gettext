gui methods
searchTranslation: aString 
	| results index |
	results := self translations
				select: [:each | ""
					('*' , aString , '*' match: each)
						or: ['*' , aString , '*' match: (self translator translate: each)]].
	""
	results isEmpty
		ifTrue: [""
			self inform: 'no matches for' translated , ' ''' , aString , ''''.
			^ self].
	""
	results size = 1
		ifTrue: [""
			self selectTranslationPhrase: results first.
			^ self].
	""
	index := (PopUpMenu
				labelArray: (results
						collect: [:each | ""
							(each copy replaceAll: Character cr with: $\)
								, ' -> '
								, ((self translator translate: each) copy replaceAll: Character cr with: $\)]))
				startUpWithCaption: 'select the translation...' translated.
	""
	index isZero
		ifTrue: [""
			self beep.
			^ self].
	""
	self
		selectTranslationPhrase: (results at: index)