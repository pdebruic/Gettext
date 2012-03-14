private
clearAllDomains
	SystemNavigation default
		allCompiledMethodDo: [:each | each
				removeProperty: self textDomainProperty
				ifAbsent: []] 