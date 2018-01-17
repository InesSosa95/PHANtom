accessing
localSelectors: aParserOrString
	self setLocal: true.  
	aParserOrString = #()
		ifTrue: [selectors := #any asParser]
		ifFalse: [selectors := aParserOrString]
