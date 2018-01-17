as yet unclassified
= anAspectNode
	(anAspectNode isKindOf: AspectNode) ifFalse: [^false].
	^(self aspect = anAspectNode aspect)  