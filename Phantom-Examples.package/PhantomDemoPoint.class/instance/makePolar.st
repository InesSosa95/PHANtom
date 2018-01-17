as yet unclassified
makePolar
	polar ifFalse: [
		theta := x arcTan: y.
		rho := y / (theta sin).
		polar := true.]  