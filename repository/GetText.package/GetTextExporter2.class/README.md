Export translations to gettext format divided into categories.

"Export gettext template files"
GetTextExporter2 new exportTemplate.

"Export translation files for current locale"
GetTextExporter2 new exportTranslator: (InternalTranslator newLocaleID: LocaleID current).

"Export all gettext template and po files."
GetTextExporter2 exportAll.

"To register a class category as a new domain"
TextDomainManager registerClassCategory: 'Morphic-Books' domain: 'Book'.
"Remove a class category"
TextDomainManager unregisterClassCategory: 'Morphic-Books'.