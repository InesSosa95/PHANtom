as yet unclassified
addMembranes
	"self adviceGroup wrapper setActiveMembranes: (WeakSet withAll: (self adviceGroup advisingMembranes))."
	self adviceGroup wrapper setActiveMembranes: previousMembraneSet.
	self adviceGroup wrapper setObjectDeployedActiveMembranes:  previousObjectDeployedMembraneSet. 