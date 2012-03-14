public
load: aFileName localeID: id
	"all of original/translated strings are loaded. 
		but conversion of translation string (in utf-8 bytestring) to Squeak format will be defered.
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
								pointers: translatedTable.

		translations _ Dictionary new: nStrings * 2.  "make too enough room to avoid #grow"
		1 to: nStrings do: [:index |
			| key |
			key _ originalStrings at: index.
			translations at: key put: index.
		].
		originalStrings _ nil.
	] ensure: [strm close].