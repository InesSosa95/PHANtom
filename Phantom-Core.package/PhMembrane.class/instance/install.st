public
install
	PhAspectWeaver installMembrane: self.
	"self advisedMembranes do: [:each | each advisingMembranes add: self]"