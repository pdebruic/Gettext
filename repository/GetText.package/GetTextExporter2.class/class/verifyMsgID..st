utilities
verifyMsgID: localeID 
	"GetTextExporter2 verifyMsgID: (LocaleID isoString: 'test-US')"
	"InternalTranslator removeLocaleID: (LocaleID isoString: 'test-US')"
	"Test gettext keyword extract function without file I/O.
	A language named <langName> will be made. And
	all possible translated words are shown with extra X charactor like
	'XwordX' in the language."
	| src |
	InternalTranslator removeLocaleID: localeID.
	src := localeID translator.
	self keys
		do: [:key | src generics at: key put: 'X' , key , 'X']