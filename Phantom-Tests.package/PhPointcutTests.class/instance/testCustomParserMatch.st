custom-parser-match
testCustomParserMatch
	| parser set pc |
	parser := (#any asParser plusGreedy: 'instanceVariableNames:' asParser) , 'instanceVariableNames:' asParser
		, (#any asParser plusGreedy: 'counter' asParser) , (#any asParser plusGreedy: 'classVariableNames:' asParser).
	pc := (PhPointcut new)
		receivers: parser;
		localSelectors: #any asParser;
		restrictToPackages: #('Phantom-Tests').
	set := Set new.
	(RPackageOrganizer default packageNamed: 'Phantom-Tests' ifAbsent: nil) classes
		do: [ :class | 
			(class instVarNames includes: 'counter')
				ifTrue: [ class localSelectors do: [ :sel | set add: (Array with: class with: sel) ] ] ].
	self assert: pc getPointcuts = set