private
getMembraneWrapperListWith: aPointcutDictionary
	| dict |
	dict := Dictionary new.
	aPointcutDictionary keysAndValuesDo: [:key :value |
		dict at: key put: (PhMembraneMethodWrapper on: (key at: 1) selector: (key at: 2) with: value asArray)].
	^dict  