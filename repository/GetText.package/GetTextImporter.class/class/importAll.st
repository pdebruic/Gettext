utilities
importAll
	"GetTextImporter importAll"
	"Import all gettext files on po/. Only registered language is imported"
	InternalTranslator cachedTranslations
		do: [:translator | self import: translator allDirectory: FileDirectory default]