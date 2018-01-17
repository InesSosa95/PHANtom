This class is used to define a pointcut.
The joinpoint model is based on messsage reception.
You have to define the receivers of the message, and the message (selectors).
Example:
	PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'foo:'.
	
	To select the metaclass:
	Example:
	PhPointcut new
		receivers: 'PhMockClass class';
		selectors: 'foo:'.
		
You can use some wildcards (like in AspectJ).
Example:
	Any receiver that have MockClass on his name.
	PhPointcut new
		receivers: '*MockClass*';
		selectors: 'foo:'.
		
	PhMockClass and all its subclasses:
	PhPointcut new
		receivers: 'PhMockClass+';
		selectors: 'foo:'.
		
On the selectors you can use '_' for any non argument selector, or '_:' any selector that receive an argument:
Example:
	Any selector of PhMockClass that receive a two argument message.
	PhPointcut new
		receivers: 'PhMockClass';
		selectors: '_:_:'.
		
You can pass groups of receivers and selectors as Arrays
Example:
	PhPointcut new
		receivers: #('Foo' 'Bar' 'SomeClass');
		selectors: #('foo:' 'bar').

You can also pass a PetitParser parser as receivers or selectors.
The classes definition that mathces the parser will be selected as receivers.
On the selectors, the selectors that matches the parser will be selected.

You can define the context to pass to the advices:
	PhPointcut new
		receivers: 'PhMockClass';
		selectors: 'foo:';
		context: #(#receiver #sender #selector #arguments #proceed).
		
You can override the precedence on defined on an aspect with overridePrecedence: #(...).
You can define a different precedence with precedence: #(...), this precedence has higher priority than the precedence defined on the aspects.
You can combine pointcuts using (and) pand: , (or) por: , and not.
Example: 
	(aPointcut1 pand: aPoincut2) por: aPointcut3.