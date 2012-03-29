private
appendVocabularies: domains
	| literalsForDomain references domainName methodReference |
	
	EToyVocabulary allPhrasesWithContextToTranslate do: [ :r |
		methodReference :=  (MethodReference new setStandardClass: (r second) methodSymbol: (r third)).
		"domainName _ self getTextDomainForPackage: (PackageOrganizer default packageOfMethod: methodReference)".
		domainName := 'Etoys-Tiles'.
		literalsForDomain _ domains at: domainName ifAbsentPut: [Dictionary new].
		r fourth do: [ :literal |
			references _ literalsForDomain at: literal ifAbsentPut: [OrderedCollection new].
			references add: methodReference.
		].
	]. 
	