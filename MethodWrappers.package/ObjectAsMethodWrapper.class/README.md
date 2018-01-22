This class implements methodWrapper like behavior using the trick that the VM allows any object to be put in 
a method dictionary if it implements run:with:in:


Here is a way to install a methodWrapper.

((PackageInfo named: 'Morphic') classes gather: [ :each |  
	ObjectAsOneTimeMethodWrapper installOnClass: each ]) inspect

((PackageInfo named: 'Morphic') classes do: [:each|ObjectAsMethodWrapper uninstallClass: each ]) 


Possible improvements:
	- it is not clear that specifying pre and post action is better than a simple method as in the original MethodWrapper
	implementation. 