action
uninstall

	oldMethod isNil ifTrue: [^self].
	"self wrappedClass removeSelectorSilently: self selector.
	self wrappedClass addSelector: self selector withMethod: oldMethod.
	"
	self wrappedClass methodDict at: self selector put: oldMethod  

