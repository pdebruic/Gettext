initialize-release
initialize
	"initialize the receiver"
	(TheWorldMenu respondsTo: #registerOpenCommand:)
		ifTrue: [""
			TheWorldMenu registerOpenCommand: {'Language Editor' translated. {self. #openOnDefault}}.
			TheWorldMenu registerOpenCommand: {'Language Editor for...' translated. {self. #open}}]