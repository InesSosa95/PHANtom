composing
testNot
	| pc regex pcCol targetSet |
	pc := PhPointcut new
		receivers: '*Morph*';
		selectors: 'mouseEnter:'.
	regex := '\w*Morph\w*' asRegex.
	targetSet := Set new.
	(SmalltalkImage current allClasses) do: [:each | 
		(regex matches: each name asString) not
			ifTrue: [each allSelectors do: [:sel |
					targetSet add: (Array with: each with: sel)]] 
			ifFalse: [each allSelectors do: [:sel |
					(sel = #mouseEnter:) not
						ifTrue: [targetSet add: (Array with: each with: sel)]]].
		(regex matches: each class name asString) not
			ifTrue: [each class allSelectors do: [:sel |
					targetSet add: (Array with: (each class) with: sel)]] 
			ifFalse: [each class allSelectors do: [:sel |
					(sel = #mouseEnter:) not
						ifTrue: [targetSet add: (Array with: (each class) with: sel)]]]].
	pcCol := pc not getPointcuts.
	self assert: (pcCol = targetSet).