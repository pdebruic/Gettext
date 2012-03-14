accessing
isDomainLoaded: aDomainName
	| mo |
	mo _ moFiles at: aDomainName ifAbsent: [nil].
	^mo isNil not.
