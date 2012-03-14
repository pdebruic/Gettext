experimental
hashPjw: aString
	"So called `hashpjw' function by P.J. Weinberger
   	[see Aho/Sethi/Ullman, COMPILERS: Principles, Techniques and Tools,
   	1986, 1987 Bell Telephone Laboratories, Inc.] "
	| stringSize hash g |
	stringSize _ aString size.
	hash _ 0.
	1 to: stringSize do: [:pos |
		hash _ hash bitShift: 4.
		hash _ hash + ((aString at: pos) asInteger).
		g _ hash bitAnd: 16rF0000000.
		g = 0 ifFalse: [
			hash _ hash  bitXor: (g bitShift: -24).
			hash _ hash bitXor: g.
		]
	].
	^hash.
