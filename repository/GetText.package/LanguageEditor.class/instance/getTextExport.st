gui methods
getTextExport
	Cursor wait
		showWhile: [GetTextExporter new exportTranslator: self model]