as yet unclassified
run: aSelector with: arguments in: aReceiver
	| result membraneStack advice advMembranes objectDeployedMembraneStack objAdvMembranes objectStart stackStart |
	PhMembraneMethodWrapper stackObjectOnCurrentProcess:  aReceiver. 
	membraneStack := self currentProcessMembraneStack.
	objectDeployedMembraneStack := self currentObjectDeployedMembraneStack.
	advMembranes := self getMembraneSetFor:  membraneStack.
	objAdvMembranes := self getObjectDeployedMembraneSetFor:  objectDeployedMembraneStack.
	advice := self getAdviceFrom:  advMembranes and: objAdvMembranes. 
	objectStart := PhMembraneMethodWrapper currentObjectDeployedMembraneStack isEmpty.
	stackStart := PhMembraneMethodWrapper currentProcessMembraneStack isEmpty.
	result :=  (PhAdviceGroup new)
		adviceCollection: advice;
		advisingMembranes: advMembranes;
		objectDeployedAdvisingMembranes: objAdvMembranes;
		wrapper: self;
		run: aSelector with: arguments in: aReceiver.
	PhMembraneMethodWrapper popObjectOnCurrentProcess.
	objectStart ifTrue: [self setObjectDeployedActiveMembranes: #()].
	stackStart ifTrue: [self setActiveMembranes: #()].
	^ result.