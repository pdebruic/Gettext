gui methods
getTextImportAFile
	| result |
	result := (StandardFileMenu new pattern: '*.po';
				
				oldFileFrom: (FileDirectory default directoryNamed: 'po')) startUpWithCaption: 'Select a File:' translated.
	result
		ifNil: [^ self].
	self
		withUnboundModelDo: [:trans | Cursor wait
				showWhile: [GetTextImporter new
						import: trans
						fileNamed: (result directory fullNameFor: result name)]]