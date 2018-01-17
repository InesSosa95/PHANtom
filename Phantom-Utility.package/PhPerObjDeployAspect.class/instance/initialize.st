initialize-release
initialize
	super initialize.
	self add:
		(PhAdvice around: (PhPointcut receivers: self classpattern selectors: #new context: #(proceed) )
			send: #instantiate: to: self).
	self install.