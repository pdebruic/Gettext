gui methods
selectNewerKeys

	| index |
	self deselectAllTranslation.
	newerKeys do: [:k |
		index := self translations indexOf: k ifAbsent: [0].
		index > 0 ifTrue: [
			self selectedTranslationsAt: index put: true
		].
	].
