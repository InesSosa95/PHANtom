instance creation
receivers: aReceivers selectors: aSelectors context: aContext restrict: aRestriction
	^ self new receivers: aReceivers; selectors: aSelectors; context: aContext; restrictToPackages: aRestriction.