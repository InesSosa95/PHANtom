instance creation
receivers: rec selectors: sel context: ctx if: aBlockClosure 
	^ (self new)
		receivers: rec;
		selectors: sel;
		context: ctx;
		if: aBlockClosure;
		yourself.