experimental
load1: aFileName localeID: id
	"CASE1: 
		all of strings are loaded. 
		translation strings are converted to Squeak format on load time.
		original-string/index pairs are registerd to Dictionary on load time.
		hash search can't be used"
	| strm originalTable translatedTable |
	localeID _ id.
	strm_ FileStream readOnlyFileNamed: aFileName.
	fileName _ aFileName.
	[
		self loadHeader: strm.
		originalTable _ self loadStringPointers: strm 
								offset: originalTableOffset.

		originalStrings _ self loadStrings: strm 
								pointers: originalTable.

		translatedTable _ self loadStringPointers: strm 
								offset: translatedTableOffset.

		translatedStrings _ self loadStrings: strm 
								pointers: translatedTable
								encoding: 'utf8'
								languageEnvironment: (Locale localeID: localeID) languageEnvironment .

		translations _ Dictionary new.
		1 to: nStrings do: [:index |
			| key |
			key _ originalStrings at: index.
			translations at: key put: index.
		].
		originalTable _ nil.
	] ensure: [strm close].