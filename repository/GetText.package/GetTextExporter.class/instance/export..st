exporting
export: aLanguage 
	language := aLanguage.
	[stream := FileStream forceNewFileNamed: self defaultFileName.
	stream lineEndConvention: #lf.
	stream converter: UTF8TextConverter new.
	self exportHeader.
	self exportTranslations.
	self exportUntranslated]
		ensure: [stream close]