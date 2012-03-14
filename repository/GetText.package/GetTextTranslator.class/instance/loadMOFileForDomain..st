private
loadMOFileForDomain: aDomainName
	| moName |
	moName _ self class findMOForLocaleID: self localeID 
								domain: aDomainName.
	moName notNil
			 ifTrue: [^MOFile new load: moName
								localeID: self localeID]
			ifFalse: [^nil]
