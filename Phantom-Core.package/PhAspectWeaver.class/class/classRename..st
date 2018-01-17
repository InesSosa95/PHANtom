notification
classRename: anEvent
	anEvent classRenamed methodDict do: [:each |
		(each isKindOf: PhMethodWrapper)
			ifTrue: [
				each reference setClass: (anEvent classRenamed) methodSymbol: (each reference methodSymbol)]].
	self update.