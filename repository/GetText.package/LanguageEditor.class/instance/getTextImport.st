gui methods
getTextImport
	| menu |
	menu := MenuMorph new defaultTarget: self.
	menu addTitle: 'Choose translation file' translated.
	menu add: 'All *.po files' translated action: #getTextImportAll.
	menu add: 'Choose a file' translated action: #getTextImportAFile.
	menu popUpInWorld