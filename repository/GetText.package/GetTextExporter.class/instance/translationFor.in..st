private
translationFor: aKey in: translator
	| translation |
	translator ifNil: [^ ''].
	TextDomainManager allKnownDomains do: [:domain |
		translation := translator translate: aKey inDomain: domain.
		aKey = translation ifFalse: [^translation]
	].
	^ aKey