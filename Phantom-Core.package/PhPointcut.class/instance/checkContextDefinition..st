private
checkContextDefinition: anArray
	| validContextDefs |
	validContextDefs := #(#receiver #sender #selector #arguments #proceed #advice).
	anArray do: [:each |
		(validContextDefs anySatisfy: [:df | df = each])
			ifFalse: [^ false]].
	^ true