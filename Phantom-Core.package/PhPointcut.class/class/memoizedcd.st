accessing
memoizedcd
	Memoizedcd isNil ifTrue:[
		Memoizedcd := SmalltalkImage current allClasses collect: [:cl| cl -> {cl definition . cl class definition}]].
	^ Memoizedcd