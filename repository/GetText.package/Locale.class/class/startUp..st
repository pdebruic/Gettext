system startUp
startUp: resuming
	| newID |
	resuming ifFalse: [^self].
	(Preferences valueOfFlag: #useLocale)
		ifTrue: [
			DateAndTime localTimeZone: (TimeZone
				offset:  (Duration minutes: Locale current offsetLocalToUTC)
				name: 'Local Time'
				abbreviation: 'LT').
			newID := self current determineLocaleID.
			newID ~= LocaleID current
				ifTrue: [self switchAndInstallFontToID: newID gently: true]]