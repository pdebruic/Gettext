utilities
verifyExport
	"Same as #verifyMsgID: but it writes / reads .po files actually"
	"GetTextExporter2 verifyExport"
	"InternalTranslator removeLocaleID: (LocaleID isoString: 'test-US')"
	| src dst localeID |
	localeID := LocaleID isoString: 'test-US'.
	self verifyMsgID: localeID.
	src := localeID translator.
	GetTextExporter2 new exportTranslator: src.
	InternalTranslator removeLocaleID: localeID.
	dst := localeID translator.
	GetTextImporter import: dst allDirectory: FileDirectory default