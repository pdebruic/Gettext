gui methods
getTextImportAll
	self
		withUnboundModelDo: [:trans | Cursor wait
				showWhile: [GetTextImporter import: trans allDirectory: FileDirectory default]].
	self refreshBoth