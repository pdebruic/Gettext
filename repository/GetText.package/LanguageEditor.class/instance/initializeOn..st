initialization
initializeOn: aLanguage 
	"initialize the receiver on aLanguage"
	""
	selectedTranslation := 0.
	selectedUntranslated := 0.
	selectedTranslations := IdentitySet new.
	""
	translator := aLanguage.
	""
	self model: aLanguage.
	self setLabel: 'Language editor for: ' translated , self translator name.
	""
	self initializeToolbars.
	self initializePanels.
	self initializeStatusbar.
	self initializeNewerKeys.
