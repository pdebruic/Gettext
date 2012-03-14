private
appendStringReceivers: aSymbol into: domains
	| literals references domainName methodReference keywords found |
	
	found := TranslatedReceiverFinder new stringReceiversWithContext: aSymbol.
	found do: [ :assoc |
		methodReference := assoc key.
		keywords := assoc value.
		domainName := (PackageOrganizer default packageOfMethod: methodReference ifNone: [nil]).
		domainName := domainName isNil ifTrue: [TextDomainManager defaultDomain] ifFalse: [domainName name].
		literals _ domains at: domainName ifAbsentPut: [Dictionary new].
		keywords do: [ :literal |
			references _ literals at: literal ifAbsentPut: [OrderedCollection new].
			references add: methodReference.
		].
	]. 

