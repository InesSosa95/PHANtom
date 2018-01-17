install-uninstall
uninstallClassModification
	"PhAspectWeaver unInstall: self"
	installed ifTrue: [
		self classModifiers do: [:each | each uninstall].
		installed := false]