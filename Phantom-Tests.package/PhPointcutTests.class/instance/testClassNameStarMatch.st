matching
testClassNameStarMatch
	| pc targetSet classCol regex |
	pc := PhPointcut new
		receivers: 'Morph*';
		selectors: 'mouseEnter:'.
	regex := 'Morph\w*' asRegex.
	classCol := (SmalltalkImage current allClasses) select: [:each | regex matches: each name].
	targetSet := Set new.
	targetSet add: (Array with: Morph with: #mouseEnter:).
	classCol do: [:each |
		(each allSelectors anySatisfy: [:s | s = #mouseEnter:]) ifTrue: [
			targetSet add: (Array with: each with: #mouseEnter:)]].
	self assert: (pc getPointcuts = targetSet).
	