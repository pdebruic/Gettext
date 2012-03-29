private
check
	"check the translations and answer a collection with the results"
	| results counter phrasesCount checkMethod |
	results := OrderedCollection new.
	untranslated := self untranslated.
	phrasesCount := self translations size + self untranslated size.
	counter := 0.
	checkMethod := self class checkMethods at: self translator localeID printString ifAbsent: [^results].
	
	self translations
		keysAndValuesDo: [:phrase :translation | 
			| result | 
			result := self perform: checkMethod with: phrase with: translation.
			(result notNil
					and: [result notEmpty])
				ifTrue: [results add: {phrase. translation. result}].
		
			counter := counter + 1.
			(counter isDivisibleBy: 50)
				ifTrue: [| percent | 
					percent := counter / phrasesCount * 100 roundTo: 0.01.
					Transcript
						show: ('- checked {1} phrases of {2} ({3}%)...' translated format: {counter. phrasesCount. percent});
						 cr]].

	self untranslated
		do: [:phrase | 
			| result | 
			result := self checkUntranslatedPhrase: phrase.
			(result notNil
					and: [result notEmpty])
				ifTrue: [results add: {phrase. nil. result}].
		
			counter := counter + 1.
			(counter isDivisibleBy: 50)
				ifTrue: [| percent | 
					percent := counter / phrasesCount * 100 roundTo: 0.01.
					Transcript
						show: ('- checked {1} phrases of {2} ({3}%)...' translated format: {counter. phrasesCount. percent});
						 cr]].

	^ results