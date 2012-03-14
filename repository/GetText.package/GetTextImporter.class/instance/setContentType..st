parsing
setContentType: lineString 
	"self new setContentType: 'Content-Type: text/plain; charset=utf-8'"
	| reader charSet |
	reader := lineString readStream.
	reader upTo: $=.
	charSet := reader upTo: $\.
	stream
		converter: (TextConverter newForEncoding: charSet)