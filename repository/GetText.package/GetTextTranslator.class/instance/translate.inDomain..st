translation
translate: aString inDomain: aDomainName
	| mo |
	mo _ self moFileForDomain: aDomainName.
	^mo isNil 
		ifTrue: [aString] 
		ifFalse: [mo translationFor: aString]
