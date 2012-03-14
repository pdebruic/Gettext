private-headers
exportHeader
	self exportTag: 'msgid' msg: ''.
	self exportTag: 'msgstr' msg: ''.
	self createHeaders
		do: [:each | self exportHeaderLineKey: each key value: each value].
	stream cr; cr