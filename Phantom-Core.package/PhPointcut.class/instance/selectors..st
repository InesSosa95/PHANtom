accessing
selectors: aParserOrString
	self setLocal: false.
	cachedSelParser := nil.
	aParserOrString = #()
		ifTrue: [selectors := #any asParser]
		ifFalse: [selectors := aParserOrString]
