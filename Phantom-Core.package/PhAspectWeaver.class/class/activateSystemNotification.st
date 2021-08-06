initialize-release
activateSystemNotification
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Added
		using: #verifyNewClass:."

	SystemAnnouncer uniqueInstance
		when: ClassAdded
		send: #verifyNewClass:
		to: self.

	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Modified
		using: #systemEvent:."
	SystemAnnouncer uniqueInstance
		when: ClassModifiedClassDefinition
		send: #systemEvent:
		to: self.

	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Removed
		using: #systemEvent:."
	SystemAnnouncer uniqueInstance
		when: ClassRemoved
		send: #systemEvent:
		to: self.

	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Renamed
		using: #classRename:."
	SystemAnnouncer uniqueInstance
		when: ClassRenamed
		send: #classRename:
		to: self.

	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Added
		using: #verifyNewMethod:."
	SystemAnnouncer uniqueInstance
		when: MethodAdded
		send: #verifyNewMethod:
		to: self.

	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Modified
		using: #methodModification:."
	SystemAnnouncer uniqueInstance
		when: MethodModified
		send: #methodModification:
		to: self.

	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Removed
		using: #methodRemoved:"
	SystemAnnouncer uniqueInstance
		when: MethodRemoved
		send: #methodRemoved:
		to: self