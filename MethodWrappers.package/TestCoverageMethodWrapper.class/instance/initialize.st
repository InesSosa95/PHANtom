as yet unclassified
initialize
	super initialize.
	hasRun := false.
	postblock := [:aSel :someArgs :aRec |
			hasRun := true. 
			self uninstall.
			].