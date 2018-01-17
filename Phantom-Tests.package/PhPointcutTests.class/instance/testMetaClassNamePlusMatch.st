matching
testMetaClassNamePlusMatch
	| pc targetSet |
	pc := PhPointcut new
		receivers: 'Morph class+';
		selectors: 'newBounds:'.
	targetSet := Set new.
	targetSet add: (Array with: (Morph class) with: #newBounds:).
	Morph class allSubclasses do: [:each |
		(each allSelectors anySatisfy: [:s | s = #newBounds:]) ifTrue: [
			targetSet add: (Array with: each with: #newBounds:)]].
	self assert: (pc getPointcuts = targetSet).
	