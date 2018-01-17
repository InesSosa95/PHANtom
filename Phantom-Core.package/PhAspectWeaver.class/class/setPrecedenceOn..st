private
setPrecedenceOn: anAdviceSet
	"ordenar basado en precedencia"
	| pointcutRulesSet pointcutOverrideRuleSet aspectRulesSet sortedAspects sortedAdvices |
	aspectRulesSet := Set new.
	pointcutRulesSet := Set new.
	pointcutOverrideRuleSet := Set new.
	anAdviceSet do: [:adv |
		(adv owner precedence notEmpty) ifTrue: [aspectRulesSet add: adv owner precedence].
		(adv pointcut precedence notEmpty) ifTrue: [
			(adv pointcut override) 
				ifFalse: [pointcutRulesSet add: adv pointcut precedence]
				ifTrue: [pointcutOverrideRuleSet add: adv pointcut precedence]]].
	((aspectRulesSet isEmpty) & (pointcutRulesSet isEmpty) & (pointcutOverrideRuleSet isEmpty)) ifTrue: [^anAdviceSet].
	(pointcutOverrideRuleSet isEmpty) 
		ifFalse: [
			sortedAspects := PhPrecedenceRulesProcessor new getSortedAspectsWith: pointcutOverrideRuleSet.  
			sortedAdvices := self sort: anAdviceSet from: sortedAspects.  
			(anAdviceSet difference: sortedAdvices) do: [:e | sortedAdvices add: e].
			^sortedAdvices. ]
		ifTrue: [
			sortedAspects := PhPrecedenceRulesProcessor new getSortedAspectsWith: pointcutRulesSet.
			sortedAdvices := self sort: anAdviceSet from: sortedAspects.
			sortedAspects := PhPrecedenceRulesProcessor new getSortedAspectsWith: aspectRulesSet.
			sortedAdvices := self combineOrderOf: sortedAdvices and: (self sort: anAdviceSet from: sortedAspects).
			^sortedAdvices]