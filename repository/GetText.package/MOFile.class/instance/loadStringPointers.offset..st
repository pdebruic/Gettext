private
loadStringPointers: strm offset: tableOffset
	"returns tupple {arrayOfOffsetToString  arrayOfLengthOfString}"
	| offsetTable lenTable len offset tupple |
	offsetTable _ IntegerArray new: nStrings.
	lenTable _ IntegerArray new: nStrings.
	strm binary.
	strm position: tableOffset.
	1 to: nStrings do: [:index |
		len _ self nextInt32From: strm.
		offset _ self nextInt32From: strm.
		offsetTable at: index put: offset.
		lenTable at: index put: len.
	].
	tupple _ Array new: 2.
	tupple at: 1 put: offsetTable.
	tupple at: 2 put:  lenTable.
	^tupple
