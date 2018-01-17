private
cleanWrappers
	WrapperList notEmpty 
		ifTrue: [
			WrapperList do: [:each | each uninstall ].
			WrapperList removeAll].