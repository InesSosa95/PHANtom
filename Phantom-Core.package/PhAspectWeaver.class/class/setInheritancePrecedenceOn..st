private
setInheritancePrecedenceOn: anAdviceCollection
	| aspectList adviceList workingSet tmp |
	aspectList := Set new.
	aspectList add: PhAspect.
	aspectList addAll: PhAspect allSubclasses.
	adviceList := OrderedCollection new.
	adviceList addAll: (anAdviceCollection select: [:adv | adv owner class theNonMetaClass = PhAspect]).
	workingSet := OrderedCollection with: PhAspect.
	tmp := OrderedCollection new.
	[aspectList notEmpty] whileTrue: [
		tmp removeAll.
		workingSet do: [:father |
			tmp addAll: (aspectList select: [:asp | asp superclass = father]).
			aspectList remove: father].
		tmp do: [:asp |
				adviceList addAll: (anAdviceCollection select: [:adv | adv owner class theNonMetaClass = asp])].
		workingSet removeAll.
		workingSet addAll: tmp].
	^ adviceList.