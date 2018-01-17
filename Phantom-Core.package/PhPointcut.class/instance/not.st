composing
not
	^(self copy)
		pointcut: (self pointcut ifNotNil: [self pointcut not]);
		composition: ((self composition) ifNotNil: [
			(self composition = #intersecton:) ifTrue: [#union:] ifFalse: [#intersection:]]);
		selectIfMatch: self selectIfMatch not;  
		yourself. 