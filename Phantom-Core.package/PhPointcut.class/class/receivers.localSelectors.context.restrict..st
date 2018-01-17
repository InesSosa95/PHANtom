instance creation
receivers: aReceivers localSelectors: aSelectors context: aContext restrict: aRestriction
	^ self new receivers: aReceivers; localSelectors: aSelectors; context: aContext; restrictToPackages: aRestriction.