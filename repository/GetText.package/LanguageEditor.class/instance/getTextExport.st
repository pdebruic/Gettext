gui methods
getTextExport
	Cursor wait
		showWhile: [GetTextExporter2 new exportTranslator: self model]