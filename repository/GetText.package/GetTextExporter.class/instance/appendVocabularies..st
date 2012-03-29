private
appendVocabularies: domains
	| literalsForDomain references domainName methodReference |
	
	EToyVocabulary allPhrasesWithContextToTranslate do: [ :r |
		methodReference :=  (MethodReference new setStandardClass: (r second) methodSymbol: (r third)).
		"domainName := self getTextDomainForPackage: (PackageOrganizer default packageOfMethod: methodReference)".
		domainName := 'Etoys-Tiles'.
		literalsForDomain := domains at: domainName ifAbsentPut: [Dictionary new].
		r fourth do: [ :literal |
			references := literalsForDomain at: literal ifAbsentPut: [OrderedCollection new].
			references add: methodReference.
		].
	]. 
	