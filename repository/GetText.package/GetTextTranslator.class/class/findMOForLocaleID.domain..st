private
findMOForLocaleID: id domain: aDomainName
	| sepa langSubDir path |
	sepa _ FileDirectory slash.
	langSubDir _ self langDirNameForLocaleID: id.
	(self localeDirsForDomain: aDomainName)
		do: [:each |
			path _ each , sepa , langSubDir, sepa , (self moNameForDomain: aDomainName).
			[(FileDirectory default fileExists: path)
				 ifTrue: [^path]] on: InvalidDirectoryError do: [:e | ^nil]].
	^nil.