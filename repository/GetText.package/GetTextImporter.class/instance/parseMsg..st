parsing
parseMsg: lineString 
	| begin end msg |
	begin := lineString indexOf: $".
	end := lineString lastIndexOf: $".
	msg := begin + 1 <= (end - 1)
				ifTrue: [lineString copyFrom: begin + 1 to: end - 1]
				ifFalse: [''].
	state
		ifNotNil: [self perform: state with: msg].
	^ msg