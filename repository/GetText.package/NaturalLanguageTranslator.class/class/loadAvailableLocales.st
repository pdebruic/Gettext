private loading
loadAvailableLocales
	"This loads the default locale and all external locales"

	| defaultID |
	defaultID := LocaleID current.
	self cachedTranslations at: defaultID ifAbsent: [self localeID: defaultID].
	self loadAvailableExternalLocales.