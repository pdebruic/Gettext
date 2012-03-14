private store-retrieve
loadFromFileNamed: fileNameString 
	"Load translations from an external file"

	FileStream readOnlyFileNamed: fileNameString do: [ :file |
		self loadFromStream: file ].
	self changed: #translations.
	self changed: #untranslated.
