PhAspect represent an Aspect, it has a collection of PhAdvices, an PhClassModifiers.
Use add: to add advices.
Use addClassModifier: to add a classModifier.
Use precedence: to specify the desired precedence on the installed aspects.
Use install to install it, and uninstall to uninstall the aspect.
Example:
	PhAspect new
		add: (PhAdvice new ...);
		addClassMofifier: (PhClassModifier new on: ...);
		precedence: 'PhAspectBigger+ PhAspectFoo'.