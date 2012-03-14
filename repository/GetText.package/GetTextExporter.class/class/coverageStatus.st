utilities
coverageStatus
	"self coverageStatus"
	| keys diff |
	keys := self keys.
	diff := InternalTranslator allKnownPhrases keys difference: keys.
	Transcript cr; show: 'Detected keywords by GetTextExporter2: ' , keys size printString.
	Transcript cr; show: 'All known phrases in InternalTranslator: ' , InternalTranslator allKnownPhrases size printString.
	Transcript cr; show: 'Coverage: ' , (keys size / InternalTranslator allKnownPhrases size * 100.0) printString , '%'.
	diff inspect