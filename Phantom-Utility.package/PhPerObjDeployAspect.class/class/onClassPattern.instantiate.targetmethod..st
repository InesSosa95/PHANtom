instance creation
onClassPattern: aClassPat instantiate: anAspectClass targetmethod: aSymbol
	|asp|
	asp := self basicNew.
	asp classpattern: aClassPat.
	asp aspectclass:  anAspectClass.
	asp targetmethod: aSymbol.  
	asp initialize.
	^asp.