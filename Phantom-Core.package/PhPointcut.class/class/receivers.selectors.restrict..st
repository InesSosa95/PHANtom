instance creation
receivers: aReceivers selectors: aSelectors restrict: aRestriction
	^ self new receivers: aReceivers; selectors: aSelectors; restrictToPackages: aRestriction.