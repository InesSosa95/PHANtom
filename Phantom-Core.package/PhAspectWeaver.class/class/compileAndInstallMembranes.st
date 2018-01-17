private
compileAndInstallMembranes
	| pointcutDict aspectRulesDict membranes |
	pointcutDict := Dictionary new.
	membranes := Set new.
	self installedMembranes do: [: mbr |
		self addAllAdvisingMembranesOf: mbr to: membranes].
	membranes do: [:membrane |
		(self getMembranePointcuts: membrane) do: [:pointcut |
			pointcutDict at: pointcut
				ifPresent: [:membraneCollection |
					(membraneCollection includes: membrane) ifFalse: [membraneCollection add: membrane]]
				ifAbsent: [pointcutDict at: pointcut put: (OrderedCollection with: membrane)]]].
	self addObjectDeployedMembranesPointcutsTo: pointcutDict.
	WrapperList := self getMembraneWrapperListWith: pointcutDict.
	WrapperList do: [:each | each install]