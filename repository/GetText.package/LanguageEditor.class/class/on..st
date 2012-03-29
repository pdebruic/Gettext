instance creation
on: localeID 
	"answer an instance of the receiver on aLanguage"
	^ self new
		initializeOn: (InternalTranslator cachedTranslations
				at: localeID
				ifAbsent: [self
						error: ('Translator for {1} is not found' translated format: {localeID})])