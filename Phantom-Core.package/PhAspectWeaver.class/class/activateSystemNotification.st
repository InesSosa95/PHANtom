initialize-release
activateSystemNotification
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Added
		using: #verifyNewClass:."
	SystemAnnouncer uniqueInstance
		subscribe: ClassAdded
		send: #verifyNewClass:
		to: self.
		
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Modified
		using: #systemEvent:."
	SystemAnnouncer uniqueInstance
		subscribe: ClassModifiedClassDefinition
		send: #systemEvent:
		to: self.
	
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Removed
		using: #systemEvent:."
	SystemAnnouncer uniqueInstance
		subscribe: ClassRemoved
		send: #systemEvent:
		to: self.	
	
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #class
		change: #Renamed
		using: #classRename:."
	SystemAnnouncer uniqueInstance
		subscribe: ClassRenamed
		send: #classRename:
		to: self.	
	
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Added
		using: #verifyNewMethod:."
	SystemAnnouncer uniqueInstance
		subscribe: MethodAdded
		send: #verifyNewMethod:
		to: self.	
	
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Modified
		using: #methodModification:."
	SystemAnnouncer uniqueInstance
		subscribe: MethodModified
		send: #methodModification:
		to: self.	
		
	"SystemChangeNotifier uniqueInstance
		notify: self
		ofSystemChangesOfItem: #method
		change: #Removed
		using: #methodRemoved:"
	SystemAnnouncer uniqueInstance
		subscribe: MethodRemoved
		send: #methodRemoved:
		to: self.