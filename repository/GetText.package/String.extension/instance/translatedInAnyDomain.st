*gettext
translatedInAnyDomain
| translation |
Transcript show: self printString, ' translatedInAnyDomain'; cr.
TextDomainManager allKnownDomains do: [:domain |
	translation := self translatedInDomain: domain.
	self = translation ifFalse: [^translation]
].
^self