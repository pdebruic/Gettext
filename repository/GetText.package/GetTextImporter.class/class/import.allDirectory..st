utilities
import: translator allDirectory: aFileDirectory 
	"self import: NaturalLanguageTranslator current allDirectory:
	FileDirectory default"
	| fileName targetFile |
	fileName := translator localeID posixName , '.po'.
	(FileDirectory default directoryNamed: 'po')
		withAllSubdirectoriesCollect: [:each | (each fileExists: fileName)
				ifTrue: [targetFile := each fullNameFor: fileName.
					self new import: translator fileNamed: targetFile]]