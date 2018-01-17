as yet unclassified
testBeforeAfterAdvice
	|pc beforeAdv advAfter aspect mock |

	mock := PhMockClass new.
	self assert: (mock test = 'test').
	aspect := PhAspect new.
	pc := (PhPointcut new) receivers: 'PhMockClass'; selectors: 'test'; context: #(#receiver).
	beforeAdv := (PhAdvice new) advice: [:context | context receiver instVarNamed: 'testString' put: ('before',(context receiver testString )) ]; pointcut: pc; type: #before.  
	advAfter := (PhAdvice new) advice: [:context | context receiver instVarNamed: 'testString' put: ((context receiver testString),'after') ]; pointcut: pc; type: #after.  
	aspect add: advAfter.
	aspect add: beforeAdv.
	[aspect install.
	self assert: (mock test = 'beforetest').  self assert: (mock testString = 'beforetestafter').] ensure: [aspect uninstall. ].
  	
	