instance creation
receivers: aReceivers selectors: aSelectors if: aBlock
	^ self new receivers: aReceivers; selectors: aSelectors; if: aBlock; yourself.