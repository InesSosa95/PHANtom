installing
instantiate: aContext
	| theObject theAspect|
	theObject := aContext proceed.
	theAspect := self aspectclass new.
	theAspect perform: self targetmethod with: theObject.
	theAspect init.  
	^theObject.
	