action
run: aSelector with: arguments in: aReceiver

	| aRes |
	aRes := super run: aSelector with: arguments in: aReceiver.
	[self executed: true]
		ensure: [self uninstall].
	^aRes