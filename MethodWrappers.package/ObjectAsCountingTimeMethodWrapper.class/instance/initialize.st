initialize
initialize
	super initialize.
	counter := 0.
	postblock := [:aSel :someArgs :aRec | counter := counter+1]