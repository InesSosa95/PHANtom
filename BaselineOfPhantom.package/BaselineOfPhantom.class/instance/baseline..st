baselines
baseline: spec

	<baseline>
	
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'MethodWrappers';
				package: 'Phantom-Core' with: [ spec requires: #('PetitParser') ];
				package: 'Phantom-PrecedenceGraph' with: [ spec requires: 'Phantom-Core' ];
				package: 'Phantom-Utility' with: [ spec requires: 'Phantom-Core' ];
				package: 'Phantom-PrecedenceGraphTests' with: [ spec requires: 'Phantom-PrecedenceGraph' ];
				package: 'Phantom-Examples' with: [ spec requires: 'Phantom-Utility' ];
				package: 'Phantom-Tests' with: [ spec requires: #('Phantom-Utility' 'Phantom-PrecedenceGraph') ].
			spec
				group: 'Development' with: #('Phantom-Core' 'Phantom-PrecedenceGraph' 'Phantom-Utility' 'Phantom-PrecedenceGraphTests' 'Phantom-Examples' 'Phantom-Tests');
				group: 'default' with: #('Development') ]