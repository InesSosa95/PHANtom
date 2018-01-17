private
addAllAdvisingMembranesOf: aMembrane to: aSet
	(aSet includes: aMembrane) 
		ifTrue: [^self]
		ifFalse: [
			aSet add: aMembrane.
			aMembrane advisingMembranes do: [:mbr |
				self addAllAdvisingMembranesOf: mbr to: aSet]] 