experimental
loadHashTable: strm
	| entry |
	hashTable _ IntegerArray  ofSize: hashTableSize.
	strm binary.
	strm position: hashTableOffset.
	1 to: hashTableSize do: [:index |
		entry _ self nextInt32From: strm.
		hashTable at:  index put: entry.
	]