accessing
stringReceiversWithContext
	| mrs results rr cls mn t o |
	mrs _ SystemNavigation default allCallsOn: #translated.
	results _ OrderedCollection new.
	mrs do: [:mr |
		rr _ OrderedCollection new.
		cls _ Smalltalk at: mr classSymbol.
		rr add: cls category.
		rr add: mr classSymbol.
		rr add: mr methodSymbol.
		mr classIsMeta ifTrue: [
			mn _  cls class decompile: mr methodSymbol.
		] ifFalse: [
			mn _ cls decompile: mr methodSymbol.
		].
		o _ OrderedCollection new.
		t _ Set new.
		self searchMessageNode: mn addTo: t.
		t do: [ :te |
			(te receiver isMemberOf: LiteralNode) ifTrue: [ 
			    o add: te receiver key.
			].
		].
		o ifNotEmpty: [
			rr add: o.
			results add: rr.
		].
	].
	^ results.

