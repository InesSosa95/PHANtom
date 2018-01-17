instance creation
on: aPointcut addCV: aCVString addCM: aCMString
	^self new on: aPointcut; addNewClassVar: aCVString; addNewClassMethod: aCMString
  