accessing
translations
	"answet the translator's translations"
	| allTranslations filterString |
	translations ifNotNil: [^translations].
	allTranslations := self translator translations keys.
	""
	filterString := self translationsFilter.
	""
	filterString isEmpty
		ifFalse: [allTranslations := allTranslations
						select: [:each | ""
							('*' , filterString , '*' match: each)
								or: ['*' , filterString , '*'
										match: (self translator translate: each)]]].
""
	^ translations := allTranslations asSortedCollection asArray