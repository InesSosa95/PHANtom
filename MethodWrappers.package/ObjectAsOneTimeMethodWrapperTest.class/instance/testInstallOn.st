running
testInstallOn
	"self run: #testInstallOn"
	|aWrapper|
	aWrapper := ObjectAsOneTimeMethodWrapper installOn: ObjectAsMethodWrapperDummy selector: #foo.
	aWrapper preblock: [:aSel :someArgs :aRec | self preExecuted:true].
	aWrapper postblock: [:aSel :someArgs :aRec | self postExecuted:true].
	[self assert: (ObjectAsMethodWrapperDummy new foo = 1).
	self assert: aWrapper executed.
	self assert: preExecuted.
	self assert: postExecuted] ensure: [aWrapper uninstall].
	^aWrapper