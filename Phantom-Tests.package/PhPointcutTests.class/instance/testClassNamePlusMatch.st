matching
testClassNamePlusMatch
	| pc targetSet |
	pc := PhPointcut new
		receivers: 'Morph+';
		selectors: 'mouseEnter:'.
	targetSet := Set new.
	targetSet add: (Array with: Morph with: #mouseEnter:).
	Morph allSubclasses do: [:each |
		(each allSelectors anySatisfy: [:s | s = #mouseEnter:]) ifTrue: [
			targetSet add: (Array with: each with: #mouseEnter:)]].
	self assert: (pc getPointcuts = targetSet).
	