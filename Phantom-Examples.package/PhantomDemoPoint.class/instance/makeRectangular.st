as yet unclassified
makeRectangular
	rectangular ifFalse: [
		x := rho * (theta sin).
		y := rho * (theta cos).
		rectangular := true]  