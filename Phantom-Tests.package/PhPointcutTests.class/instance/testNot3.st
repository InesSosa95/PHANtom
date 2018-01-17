composing
testNot3
	| pc1 pc2 col1 col2 |
	pc1 := PhPointcut new
		receivers: '*Morph*';
		selectors: 'mouseEnter:'.  
	pc2 := PhPointcut new
		receivers: (#word asParser star, ' class' asParser);
		selectors: (#any asParser star).
		
	col1 := (((pc1 not) & (pc2 not)) restrictToPackages: #('Kernel' 'Morphic')) getPointcuts.
	col2 := (( (pc1 | pc2) not ) restrictToPackages: #('Kernel' 'Morphic')) getPointcuts.
	self assert: (col1 = col2)