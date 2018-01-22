action
install
	[oldMethod := self wrappedClass lookupSelector: self selector.
	oldMethod isKindOf: self class] whileTrue: [oldMethod uninstall].
	"self wrappedClass addSelector: self selector withMethod: self" 
	self wrappedClass methodDict at: self selector put: self