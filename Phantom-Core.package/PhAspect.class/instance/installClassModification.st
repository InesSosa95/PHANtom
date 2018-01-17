install-uninstall
installClassModification
	installed ifFalse: [
		self classModifiers do: [:each | each install].
		installed := true]