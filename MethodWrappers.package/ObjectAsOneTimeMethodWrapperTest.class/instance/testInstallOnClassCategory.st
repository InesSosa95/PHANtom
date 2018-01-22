running
testInstallOnClassCategory
	"self run: #testInstallOnClassCategory"
	| someWrappers |
	someWrappers := ObjectAsOneTimeMethodWrapper installOnClassCategory: 'MethodWrappers-Dummies'.
	[self assert: (ObjectAsMethodWrapperDummy new foo = 1).
	self assert: (someWrappers anySatisfy: [:e | e executed not]).
	self assert: (ObjectAsMethodWrapperDummy new bar = 2).
	self assert: (someWrappers allSatisfy: [:e | e executed])] ensure: [someWrappers do: [:e | e uninstall]].
	^someWrappers