private
withUnboundModelDo: aBlock 
	"Private - Evaluate aBlock with the receiver temporary  
	unbound from the model.  
	 
	Useful to perform a batch of modifications to the model  
	without updating the view."
	| formerModel |
	formerModel := self model.
	self model: nil.
	[aBlock value: formerModel]
		ensure: [self model: formerModel]