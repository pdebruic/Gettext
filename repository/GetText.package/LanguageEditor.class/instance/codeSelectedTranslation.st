gui methods
codeSelectedTranslation
	| keys code |
	keys := selectedTranslations
				collect: [:key | self translations at: key].
	code := String
				streamContents: [:aStream | self translator fileOutOn: aStream keys: keys withBOM: false].
	(StringHolder new contents: code)
		openLabel: 'exported codes' translated