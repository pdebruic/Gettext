Export translations to gettext format divided into categories.

"Export gettext template files"
GetTextExporter new exportTemplate.

"Export translation files for current locale"
GetTextExporter new exportTranslator: (InternalTranslator newLocaleID: LocaleID current).

"Export all gettext template and po files."
GetTextExporter exportAll.

