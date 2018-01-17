install-uninstall
install
	self wrappedClass ifNil: [^self].
	(self wrappedClass localSelectors includes: self selector) 
		ifTrue: [	needCleanUp := false.]
		ifFalse: [needCleanUp := true].
	"super install."
	oldMethod := self wrappedClass lookupSelector: self selector.
	[oldMethod isKindOf: self class] whileTrue: [oldMethod := oldMethod oldMethod].
	self wrappedClass methodDict at: self selector put: self