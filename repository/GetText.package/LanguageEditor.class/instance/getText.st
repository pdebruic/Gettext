gui methods
getText
	| menu |
	menu := MenuMorph new defaultTarget: self.
	""
	menu
		add: 'gettext template' translated
		target: self
		selector: #getTextExportTemplate.
	menu lastItem setBalloonText: 'exports the translations to gettext separated format.' translated.
	menu
		add: 'gettext export' translated
		target: self
		selector: #getTextExport.
	menu lastItem setBalloonText: 'Exports the translations to GetText format.' translated.

	""
	menu
		add: 'gettext import' translated
		target: self
		selector: #getTextImport.
	menu lastItem setBalloonText: 'Imports the translations from GetText format.' translated.
	""
	menu popUpInWorld