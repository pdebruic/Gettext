gui methods
browseMethodsWithUntranslated
	| untrans |
	self selectedUntranslated isZero
		ifTrue: [""
			self beep.
			self inform: 'select the untrans phrase to look for' translated.
			^ self].
	""
	untrans := self untranslated at: self selectedUntranslated.
	SystemNavigation default browseMethodsWithLiteral: untrans.
