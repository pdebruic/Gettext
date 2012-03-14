notification
localeChangedGently

	#(#ParagraphEditor #BitEditor #FormEditor #StandardSystemController )
		do: [:key | Smalltalk
				at: key
				ifPresent: [:class | class initialize]].
	PartsBin localeChangedGently.
	Project localeChangedGently.
	PaintBoxMorph localeChangedGently.
	ColorPickerMorph localeChangedGently.
	Preferences localeChangedGently.
