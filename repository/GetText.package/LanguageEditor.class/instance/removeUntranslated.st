gui methods
removeUntranslated
	"remove the selected untranslated phrase"
	| untrans |
	self selectedUntranslated isZero
		ifTrue: [""
			self beep.
			self inform: 'select the untranslated phrase to remove' translated.
			^ self].
	""
	untrans := self untranslated at: self selectedUntranslated.
	""
	(self
			confirm: ('Removing "{1}".
Are you sure you want to do this?' translated format: {untrans}))
		ifFalse: [^ self].
	""
	self translator removeUntranslated: untrans