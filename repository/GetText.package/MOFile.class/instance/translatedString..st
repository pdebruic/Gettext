private
translatedString: index
	"KNOWN PROBLEM: conversion is executed everytimes this method called"
	| str |
	str _ translatedStrings at: index.

	^str utf8ToSqueak applyLanguageInfomation: (Locale localeID: localeID) languageEnvironment.
