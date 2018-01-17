as yet unclassified
testUninstallAfterClassRemove
	| asp |
	[
	asp := PhAspect new add: (PhAdvice new
		pointcut: (PhPointcut new
			receivers: 'PhNoOneMock';
			selectors: 'hash');
		advice: [:ctx | 'foo'];
		type: #around).
	
	asp install.
	self checkNoOneHash.
	self removeNoOneClass.
	self uninstall: asp.  
	self createNoOneClass.
	] ensure: [
	asp uninstall.
	self createNoOneClass.]
	