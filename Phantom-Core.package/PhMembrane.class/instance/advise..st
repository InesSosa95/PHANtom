public
advise: aMembrane
	self advisedMembranes add: aMembrane.
	aMembrane advisingMembranes add: self.
	PhAspectWeaver updateMembranes.
	"self advisedMembranes do: [:each | each advisingMembranes add: self]"