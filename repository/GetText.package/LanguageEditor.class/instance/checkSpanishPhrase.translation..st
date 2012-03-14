private
checkSpanishPhrase: phraseString translation: translationString 
	"check the translation and aswer a string with a comment or a 
	nil meaning no-comments"
	| superResult |
	superResult := self checkPhrase: phraseString translation: translationString.
	superResult isNil
		ifFalse: [^ superResult].
	"For some reason, MCInstaller couldn't read Spanish character. "
	"((translationString includes: $?)
	and: [(translationString includes: $¿) not]) 
		ifTrue: [^ '¿Olvidó el signo de pregunta?'].
	((translationString includes: $!)
	and: [(translationString includes: $¡) not])
		ifTrue: [^ '¿Olvidó el signo de admiración?'].
	"
	^ nil
