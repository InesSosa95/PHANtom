*MethodWrappers
wrappedMethods
	|someMethods|
	someMethods:= Set new.
	someMethods addAll: (self methodDictionary values select: [:e | e isKindOf: ObjectAsMethodWrapper ]).
	someMethods addAll: (self class  methodDictionary values select: [:e | e isKindOf: ObjectAsMethodWrapper ]).
	^someMethods