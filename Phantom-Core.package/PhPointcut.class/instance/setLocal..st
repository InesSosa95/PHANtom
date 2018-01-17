private
setLocal: aBoolean
	aBoolean 
		ifTrue: [selectorsMessage := #localSelectors]  
		ifFalse: [selectorsMessage := #allSelectors] 