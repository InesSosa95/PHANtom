tokens
starAny
	^ (any) ==> [:node | Array with: (#word asParser star) with: nil]