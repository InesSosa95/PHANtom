accessing
send: aSymbol to: anObject
	self advice: [:contxt | anObject perform: aSymbol with: contxt]