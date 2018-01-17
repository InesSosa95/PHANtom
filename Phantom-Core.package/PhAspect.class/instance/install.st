install-uninstall
install
	membrane := PhMembrane new pointcut: self.
	aspectMembrane := PhMembrane new advise: membrane.
	self registerOn: aspectMembrane.
	membrane install.  
	"| pointcutSet pointcut |
	pointcutSet := Set new.
	self adviceCollection do: [:each |
		pointcutSet add: each pointcut].
	pointcutSet isEmpty ifFalse: [
		(pointcutSet size < 2) 
			ifTrue: [pointcut := pointcutSet asArray at: 1]
			ifFalse: [
				pointcut := pointcutSet asArray reduce: [:a :b |
					a por: b]]].
	membrane := PhMembrane new pointcut: pointcut.
	membrane install.
	self registerOn: membrane."