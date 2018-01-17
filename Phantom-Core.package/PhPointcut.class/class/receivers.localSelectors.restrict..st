instance creation
receivers: aReceivers localSelectors: aSelectors restrict: aRestriction
	^ self new receivers: aReceivers; localSelectors: aSelectors; restrictToPackages: aRestriction.