accessing
allMethodsWithTranslations
"Look for #translated calls"
| methodsWithTranslations |
methodsWithTranslations := TranslatedReceiverFinder new stringReceiversWithContext: #translated.
methodsWithTranslations := methodsWithTranslations, (TranslatedReceiverFinder new
stringReceiversWithContext: #translatedNoop).

methodsWithTranslations := methodsWithTranslations collect: [:each | each key compiledMethod].

"Look for Etoys tiles and vocabularies"
methodsWithTranslations := methodsWithTranslations, (EToyVocabulary allPhrasesWithContextToTranslate collect: [:r |
	(MethodReference new setStandardClass: r second methodSymbol: r third) compiledMethod.
]).

^methodsWithTranslations